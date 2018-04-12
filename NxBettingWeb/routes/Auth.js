/**
 * Created by nnnyyy on 2018-04-12.
 */
var dbpool = require('./MySQL').init();

exports.login = function(req, res, next) {
    res.render('login', {session: null});
}

exports.checklogin = function( req, res, next) {
    req.session.user_id = 'nnnyyy';
    res.send( {ret: 0} );
}