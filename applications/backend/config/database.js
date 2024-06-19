const mongoose = require('mongoose')
require('dotenv').config();

const {
    MONGO_URI,
    MONGO_DB
} = process.env

const MONGODB_URI=`${MONGO_URI}/${MONGO_DB}`

module.exports = databaseConnection = () => {
    return mongoose.connect(MONGODB_URI, {useNewUrlParser: true, useUnifiedTopology: true})
}