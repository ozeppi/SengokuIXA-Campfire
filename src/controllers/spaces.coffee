Camp = require '../models/camp'

module.exports =
    index: (req, res)->
        Camp.find {namespace: req.params.namespace}, (err, campList)->
            res.render 'spaces', {
                campList: campList.reverse()
                user: 'ozeppi'
                namespace: req.params.namespace
            }

    add: (req, res)->
        camp = new Camp (
            namespace: req.params.namespace
            x: req.body.x
            y: req.body.y
            user: 'ozeppi'
        )
        camp.save (err, camp)->
            if not err
                res.redirect 'spaces/' + req.params.namespace
            else
                res.send err
                res.statusCode = 500
