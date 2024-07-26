const axios = require('axios')
require('dotenv').config();
const {
    QR_URL
} = process.env;

class QrClient {

    generateQr(qr_id, qr_content) {
        return axios.default.post(QR_URL, {
            id: qr_id,
            content: qr_content
        })
    }
}

module.exports = new QrClient();