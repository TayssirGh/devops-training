const axios = require('axios')
require('dotenv').config();

const {
    QR_URL
} = process.env;

class QrClient {

    generateQr(qr_id, qr_content) {
        console.log(qr_id)
        console.log(qr_content)
        axios.post(QR_URL,{
            id: qr_id,
            content: qr_content
        })
            .then(response => {
                console.log(response.data);
            })
            .catch(error => {
                console.error(error);
            });
        return axios.default.post(QR_URL, {
            id: qr_id,
            content: qr_content
        })
    }
}

module.exports = new QrClient();