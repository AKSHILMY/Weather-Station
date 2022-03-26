var http = require("http");
var fs = require("fs");

console.log(__dirname);
http
  .createServer(function (req, res) {
    fs.readFile("./src/App.js", null, function (err, data) {
      res.writeHead(200, { "Content-Type": "Application/json" });
      res.write(data);
      return res.end();
    });
  })
  .listen(8080);
