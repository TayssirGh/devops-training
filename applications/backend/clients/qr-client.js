const axios = require('axios');
const http = require('http');
require('dotenv').config();

const { QR_URL } = process.env;

class QrClient {
  generateQr(qr_id, qr_content) {
    console.log(qr_content);
    console.log(QR_URL);

    const agent = new http.Agent({ family: 4 }); // Specify IPv4 address family

    axios
      .post(QR_URL, {
        id: qr_id,
        content: qr_content,
      }, {
        httpAgent: agent, // Pass the agent to axios configuration
      })
      .then(response => {
        console.log(response.data);
      })
      .catch(error => {
        console.error(error);
      });

    return axios.default.post(QR_URL, {
      id: qr_id,
      content: qr_content,
    });
  }
}

module.exports = new QrClient();
