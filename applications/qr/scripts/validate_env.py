import os
from dotenv import load_dotenv



class EnvValidator:

    @staticmethod
    def validate_variables():
        if EnvValidator.use_bucket():
            if EnvValidator.bucket_endpoint() is None:
                print("Missing the 'BUCKET_ENDPOINT' environment variable.")
                exit(1)
            if EnvValidator.bucket_access_key() is None:
                print("Missing the 'BUCKET_ACCESS_KEY' environment variable.")
                exit(1)
            if EnvValidator.bucket_secret_key() is None:
                print("Missing the 'BUCKET_SECRET_KEY' environment variable.")
                exit(1)
            if EnvValidator.bucket_name() is None:
                print("Missing the 'BUCKET_NAME' environment variable.")
                exit(1)


    @staticmethod
    def qr_tmp_folder():
   
        return os.getenv('QR_TMP_FOLDER', "./generated_qr")

    @staticmethod
    def qr_fill_color():
        return os.getenv('QR_FILL_COLOR', "#121128")

    @staticmethod
    def qr_background_color():
        return os.getenv('QR_BACKGROUND_COLOR', "#dcdbdb")

    @staticmethod
    def use_bucket():
        return True if os.getenv('USE_BUCKET', "false") == "true" else False

    @staticmethod
    def bucket_endpoint():
        return os.getenv('BUCKET_ENDPOINT')

    @staticmethod
    def bucket_access_key():
        return os.getenv('BUCKET_ACCESS_KEY')

    @staticmethod
    def bucket_secret_key():
        return os.getenv('BUCKET_SECRET_KEY')

    @staticmethod
    def bucket_name():
        return os.getenv('BUCKET_NAME')

    @staticmethod
    def bucket_path():
        return os.getenv('BUCKET_PATH')
