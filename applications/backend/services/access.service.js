const AccessModel = require('../schemas/access.schema')
const QrClient = require('../clients/qr-client')

class AccessService {
    addAccess(accessData) {
        this.validateAccessData(accessData)
        console.log(accessData)
        accessData.qr_id = this.makeid();
        return QrClient.generateQr(accessData.qr_id, accessData.qr_content).then(result => {
            console.log(result)
            accessData.qr_url = result.data.res
            accessData.is_s3 = result.data.s3
            const access = new AccessModel(accessData)
            return access.save().then(savedAccess => {
                return savedAccess;
            })
        })
            .catch(err => {

                throw {message: err.message, code: (err.code && !isNaN(err.code)) || 500}
            })
    }

    findAll() {
        return AccessModel.find().then((access) => {
            return access;
        })
            .catch(reason => {
                throw reason;
            })
    }

    validateAccessData(accessData, update = false) {
        if (!accessData.qr_content) {
            throw {message: "Missing 'qr_content' field.", code: 400}
        }
    }

    makeid() {
        let result = '';
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        var charactersLength = characters.length;
        for (let i = 0; i < 10; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }
}

module.exports = new AccessService();