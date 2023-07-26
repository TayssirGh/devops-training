import logging
from fastapi import FastAPI
from scripts.qr_request_body import QR
from scripts.qr_generator import QrGenerator
from scripts.save_s3 import S3Manager
from scripts.validate_env import EnvValidator
from elasticsearch import Elasticsearch
from datetime import datetime

EnvValidator.validate_variables()
es = Elasticsearch([EnvValidator.kibana_endpoint()], verify_certs=True)


logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')




atom = FastAPI()
if EnvValidator.use_bucket():
    s3 = S3Manager()
    s3.init_bucket()


def send_log_to_elasticsearch(log_level, message, data=None):
    log_entry = {
        'timestamp': datetime.now(),
        'level': log_level,
        'message': message,
        'data': data
    }

    index_name = 'test'  # Replace with your desired index name

    try:
        es.index(index=index_name, body=log_entry)
    except Exception as e:
        print(f"Failed to send log to Elasticsearch: {e}")


@atom.post("/")
def generate_qr(qr: QR):
    try:
        resulting_qr_path = QrGenerator.generate_qr(qr.content, qr.id)
        if EnvValidator.use_bucket():
            res = s3.save_into_s3(qr_id=qr.id, qr_path=resulting_qr_path, path_under_bucket=qr.path_under_bucket)
            send_log_to_elasticsearch('INFO', 'QR code generation successful', data={"qr_id": qr.id, "res": res})
            return {"res": res, "s3": EnvValidator.use_bucket()}
        else:
            return {"res": resulting_qr_path.replace(EnvValidator.qr_tmp_folder(), ""), "s3": EnvValidator.use_bucket()}
    except Exception as e:
        send_log_to_elasticsearch('ERROR', f'QR code generation failed: {str(e)}')
        return {"error": str(e)}
