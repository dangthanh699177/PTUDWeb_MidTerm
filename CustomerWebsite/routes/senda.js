var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('senda', { title: 'Cay canh sen da' });
});

module.exports = router;
