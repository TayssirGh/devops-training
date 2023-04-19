const axios = require('axios')
require('dotenv').config();

const {
    QR_URL
} = process.env;

const myVariable = process.env.QR_URL;
console.log(myVariable)

class QrClient {

    generateQr(qr_id, qr_content) {
        return axios.default.post(myVariable, {
            id: qr_id,
            content: qr_content
        })
    }
}

module.exports = new QrClient();