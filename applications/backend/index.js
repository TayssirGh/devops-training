const api = require('./config/api')
require('dotenv').config();

const {
    APP_PORT
} = process.env

const myVariable = process.env.APP_PORT;

const databaseConnection = require('./config/database')

databaseConnection()
    .then(() => {
        console.info('Successfully connected to database.')
        api.listen(myVariable, () => {
            console.log(`Listening on port ${myVariable}`);
        })
    })
    .catch(reason => {
        console.error('Could not connect to database.', reason)
    });