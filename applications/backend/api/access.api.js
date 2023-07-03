const express = require('express')
const AccessService = require('../services/access.service')

const router = express.Router();

router.post(`/`, (req, res, next) => {
    return AccessService.addAccess(req.body)
        .then(value => {
            res.send(value)
        })
        .catch(reason => {
            console.log("1")
            console.error(reason)
            next(reason);
        })
})

router.get(`/`, (req, res, next) => {
    return AccessService.findAll()
        .then(value => {
            res.send(value)
        })
        .catch(reason => {
            console.log("2")
            console.error(reason)
            next(reason);
        })
})

module.exports = router