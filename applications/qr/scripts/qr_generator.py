import os
import qrcode

from .validate_env import EnvValidator


class QrGenerator:

    @staticmethod
    def generate_qr(data: str, qr_id: str):
        qr_dir = EnvValidator.qr_tmp_folder()
        os.makedirs(qr_dir, exist_ok=True)
        qr_path = "{}/{}.png".format(qr_dir, qr_id)
        qr = qrcode.QRCode(
            version=3,
            error_correction=qrcode.constants.ERROR_CORRECT_H,
            box_size=25,
            border=3,
        )
        qr.add_data(data)
        qr.make(fit=True)

        img = qr.make_image(fill_color=f'#{EnvValidator.qr_fill_color()}', back_color=f'#{EnvValidator.qr_background_color()}' )
        img.save(qr_path)

        return qr_path
