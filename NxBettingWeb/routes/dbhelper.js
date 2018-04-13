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

exports.GetList = function(cb) {
    data = {}

    data.list = [
        {sn: 0, home: 'www', away: 'kkk', home_rate: 187, away_rate: 174, regdate: '2018-04-13 6:00:00', betlimitdate: '2018-04-13 7:00:00', state: 2 },
        {sn: 1, home: 'www', away: 'kkk', home_rate: 187, away_rate: 174, regdate: '2018-04-13 10:00:00',betlimitdate: '2018-04-13 7:00:00', state: 0 },
        {sn: 2, home: 'www', away: 'kkk', home_rate: 187, away_rate: 174, regdate: '2018-04-13 10:00:00', betlimitdate: '2018-04-13 7:00:00', state: 0 }
    ];
    cb(data);
}