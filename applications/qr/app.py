from fastapi import FastAPI
from scripts.qr_request_body import QR
from scripts.qr_generator import QrGenerator
from scripts.save_s3 import S3Manager
from scripts.validate_env import EnvValidator

EnvValidator.validate_variables()

atom = FastAPI()
if EnvValidator.use_bucket():
  s3 = S3Manager()
  s3.init_bucket()


@atom.post("/")
def generate_qr(qr: QR):
    resulting_qr_path = QrGenerator.generate_qr(qr.content, qr.id)
    if EnvValidator.use_bucket():
        res = s3.save_into_s3(qr_id=qr.id, qr_path=resulting_qr_path, path_under_bucket=qr.path_under_bucket)
        return {"res": resulting_qr_path.replace(EnvValidator.qr_tmp_folder(), ""), "s3": "false"}
    else:
        return {"res": resulting_qr_path.replace(EnvValidator.qr_tmp_folder(), ""), "s3": EnvValidator.use_bucket()}
