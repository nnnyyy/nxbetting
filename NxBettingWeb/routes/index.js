var express = require('express');
var Auth = require('./Auth');
var Log = require('./Log');
var async = require('async');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', {session: req.session.user_id });
});

router.use( Log.logger );
router.get('/login', Auth.login );
router.post('/checklogin', Auth.checklogin );

module.exports = router;
