const api = require('./config/api')
require('dotenv').config();

const {
    APP_PORT
} = process.env

console.log(APP_PORT)
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