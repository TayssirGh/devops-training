from minio import Minio
import os
import socket
from .validate_env import EnvValidator


class S3Manager:

    def __init__(self):
        hostname = EnvValidator.bucket_endpoint().split(":")[0]
        port = EnvValidator.bucket_endpoint().split(":")[1]
        ip = socket.gethostbyname(hostname)
        self.endpoint = ip + ":" + port
        self.accessKey = EnvValidator.bucket_access_key()
        self.secretKey = EnvValidator.bucket_secret_key()
        self.bucketName = EnvValidator.bucket_name()
        self.bucketPath = EnvValidator.bucket_path()

        self.minioClient = Minio(self.endpoint, access_key=self.accessKey,
                                 secret_key=self.secretKey, secure = False)

    def init_bucket(self):
        if not self.minioClient.bucket_exists(self.bucketName):
            self.minioClient.make_bucket(self.bucketName)

    def save_into_s3(self, qr_id: str, qr_path: str, path_under_bucket: str = None):
        self.minioClient.fput_object(self.bucketName, "{}/{}.png".format(
            self.bucketPath if path_under_bucket is None else path_under_bucket, qr_id),
                                     qr_path)
        os.remove(qr_path)
        return self.minioClient.presigned_get_object(self.bucketName, "{}/{}.png".format(self.bucketPath, qr_id))
