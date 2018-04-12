/**
 * Created by nnnyyy on 2018-04-12.
 */
var Log = require('./Log');
var dbhelper = require('./dbhelper');

exports.login = function(req, res, next) {
    res.render('login', {session: null});
}

exports.logout = function(req, res, next) {
    req.session.user_id = null;
    res.redirect('/');
}

exports.checklogin = function( req, res, next) {
    Log.logger.debug('Check Login ' + req.body.user_id + ' : ' + req.body.user_pw);
    try {
        dbhelper.CheckLogin(req.body.user_id, req.body.user_pw, function(dbret) {
            res.send({ret: 0});
            /*
            if(dbret != 0) {
                req.session.user_id = null;
                res.send( { ret: -1 } );
                return;
            }

            req.session.user_id = req.body.user_id;
            Log.logger.debug('session id : ' + req.session.user_id);
            res.send( { ret: 0 } );
            return;
            */
        })
    }catch(err) {
        req.session.user_id = null;
        Log.logger.debug('error : ' + err);
        res.send( {ret: -2} );
    }
}