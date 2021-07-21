const mongoose = require('mongoose')
const {
    MONGO_URI
} = process.env

module.exports = databaseConnection = () => {
    return mongoose.connect(MONGO_URI, {useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false})
}
