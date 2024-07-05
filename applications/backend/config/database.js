require('dotenv').config();
const mongoose = require('mongoose')

const {
    MONGO_URI,
    MONGO_DB
} = process.env

console.log(MONGO_URI,MONGO_DB)

const MONGODB_URI=`${MONGO_URI}/${MONGO_DB}?retryWrites=true&w=majority`

module.exports = databaseConnection = () => {
    return mongoose.connect(MONGODB_URI, {useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false})
}
