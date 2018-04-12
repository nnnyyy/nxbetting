/**
 * Created by nnnyy on 2018-04-13.
 */
var Log = require('./Log');
var dbpool = require('./MySQL').init();

exports.CheckLogin = function(_id, _pw, cb) {
    Log.logger.debug('Check Login Start..');
    dbpool.query('select * from account', function(err, rows){
        Log.logger.debug('select length : ' + rows.length );
        if( err ){
            Log.logger.debug('Check Login Error..');
            cb(-1);
            return;;
        }
        Log.logger.debug('Check Login Success..');
        cb(0);
    })
}