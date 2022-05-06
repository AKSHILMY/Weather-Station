var express = require("express");
var app = express();
var students;
app.get("/", function (req, res) {
  students = require("../databases/retreive");
  res.writeHead(200, { "Content-Type": "text/html" });
  res.write();
  return res.end();
});
var server = app.listen(5000, function () {
  console.log("Server is running..");
});
