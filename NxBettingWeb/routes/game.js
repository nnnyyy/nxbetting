/**
 * Created by nnnyyy on 2018-04-13.
 */
var express = require('express');
var router = express.Router();

router.get('/', function(req, res, next) {
    if( req.params.user_id == null ||
        req.params.user_id == '' ) {
        res.redirect('/');
    }else {
        res.send('Game!');
    }
});

module.exports = router;
