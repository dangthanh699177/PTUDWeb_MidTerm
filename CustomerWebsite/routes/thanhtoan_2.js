var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('thanhtoan_2', { title: 'Thanh toan | Dia chi' });
});

module.exports = router;
