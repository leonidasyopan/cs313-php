let http = require('http');

function onRequest(request, response) {
    let reqUrl = request.url;

    if(reqUrl == '/home' || reqUrl == '/home.php' || reqUrl == '/home.html' || reqUrl == '/home.htm') {

        // Define type of file
        response.writeHead(404, {"Content-Type": "text/html"});

        // Write HTML
        response.write("<h1>Welcome to the Home Page</h1>");

        // End the response
        response.end();

    } else if (reqUrl == '/getData' || reqUrl == '/getData.php' || reqUrl == '/getData.html' || reqUrl == '/getData.htm') {

        // json data
        var jsonData = '{"name":"Leonidas Yopan","class":"cs313"}';

        // parse json
        var jsonObj = JSON.parse(jsonData);
        
        // stringify JSON Object
        var jsonContent = JSON.stringify(jsonObj);

        // Define type of file
        response.writeHead(200, {"Content-Type": "application/json"});      

        // Write HTML
        response.write(jsonContent);

        // End the response
        response.end();

    } else {

        // Define type of file
        response.writeHead(404, {"Content-Type": "text/html"});

        // Write HTML
        response.write("<h2>Page Not Found</h2>");

        // End the response
        response.end();
    }

}

let server = http.createServer(onRequest);

server.listen(8888);

console.log("The server is now listening on port 5000...");