var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('thanhtoan_3', { title: 'Thanh toan | Dat mua' });
});

module.exports = router;
