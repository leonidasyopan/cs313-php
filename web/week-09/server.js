// Require express and its functionalities.
var express = require("express");
// Create an app and declare it's going to be the type of express
var app = express();
// Declare which port will be used
var port = 5000;

/* 
Allows a public folder so any file inside the "public" folder will be given without changes to the user. 
A common use for that is images, css files, html (not dynamic) files, etc...
*/
app.use(express.static("public"));

app.set("views", "views");
app.set("view engine", "ejs");

app.get("/", function(req, res) {
    console.log("Received a request for /");
    var name = getCurrentLoggedInUserAccount();

    res.render();
})

app.get("/home", function(req, res) {
    console.log("Received a request for the home page");
    var name = getCurrentLoggedInUserAccount();

    res.render("home");
})

app.listen(port, function() {
    console.log("The server is up and listening on port 5000");
});


function getCurrentLoggedInUserAccount() {

    return "John";
}