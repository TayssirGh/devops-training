const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors');

const AccessRouter = require('../api/access.api')

const api = express();
api.use(bodyParser.json());
api.use(bodyParser.urlencoded({extended: true}));
api.use(cors());

const errorsHandler = (error, req, res, next) => {
    console.error(error)
    const defaultError = {message: error, code: 500}
    res.status(error.code || defaultError.code)
        .send(error || defaultError);
}

api.use('/access', AccessRouter);

api.use(errorsHandler)
module.exports = api;