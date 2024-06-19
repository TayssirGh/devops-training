const api = require('./config/api')
require('dotenv').config();
const {
    APP_PORT, QR_URL,
} = process.env
console.log('index QR_URL:', QR_URL);

const databaseConnection = require('./config/database')

databaseConnection()
    .then(() => {
        console.info('Successfully connected to database.')
        api.listen(APP_PORT, () => {
            console.log(`Listening on port ${APP_PORT}`);
        })
    })
    .catch(reason => {
        console.error('Could not connect to database.', reason)
    });