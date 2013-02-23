Camp = require '../models/camp'
UUID = require 'node-uuid'

module.exports =
    index: (req, res)->
        identity = req.cookies.identity  if req.cookies && req.cookies.identity
        unless identity
            identity = UUID.v1()
            res.cookie('identity', identity, {
                expires: new Date(2100, 1, 1)
            })
        Camp.find {namespace: req.params.namespace}, (err, campList)->
            res.render 'spaces', {
                campList: campList.reverse()
                namespace: req.params.namespace
                identity: identity
            }

    add: (req, res)->
        unless req.body.x && req.body.y
            res.send 'Invalid parameters. Please check x and y'
            res.statusCode = 500
        camp = new Camp (
            namespace: req.params.namespace
            x: req.body.x
            y: req.body.y
            user: req.cookies.identity
        )
        camp.save (err, camp)->
            if not err
                res.redirect 'spaces/' + req.params.namespace
            else
                res.send err
                res.statusCode = 500

    delete: (req, res)->
        Camp.remove {
            namespace: req.params.namespace
            x: req.body.x
            y: req.body.y
            user: req.cookies.identity
        }, (err)->
            if not err
                res.redirect 'spaces/' + req.params.namespace
            else
                res.send err
                res.statusCode = 500
