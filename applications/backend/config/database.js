const mongoose = require('mongoose')
const {
    MONGO_URI,
    MONGO_DB
} = process.env

const MONGODB_URI="mongodb+srv://glaafarah:aXUeTaT6zaMH7vXR@testing-mongo.7qdunay.mongodb.net/?retryWrites=true&w=majority"

module.exports = databaseConnection = () => {
    return mongoose.connect(MONGODB_URI, {useNewUrlParser: true, useUnifiedTopology: true, useFindAndModify: false})
}
