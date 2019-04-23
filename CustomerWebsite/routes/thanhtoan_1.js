var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('thanhtoan_1', { title: 'Thanh toan | Dang nhap' });
});

module.exports = router;
