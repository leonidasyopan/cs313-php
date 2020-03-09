var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  // Controller

  console.log("Received a request for the home page.")

  var name = getCurrentLoggedInUserAccount();
  var emailAddress = "john@gmail.com"


  var params = {username: name, email: emailAddress};

  res.render('home', params /* { title: 'Homepage' }*/); 
});

module.exports = router;

function getCurrentLoggedInUserAccount() {

return "John";
}