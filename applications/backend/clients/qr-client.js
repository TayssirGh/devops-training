const axios = require('axios')
require('dotenv').config();

const {
    QR_URL
} = process.env;

class QrClient {

    generateQr(qr_id, qr_content) {
        console.log('QR_URL:', QR_URL);
        return axios.default.post(QR_URL, {
            id: qr_id,
            content: qr_content
        })
    }
}

module.exports = new QrClient();