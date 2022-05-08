const express = require("express");
const bodyParser = require("body-parser");

const app = express();

app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

var sensor_data;
app.get("/home", function (req, res) {
  sensor_data = require("../databases/retreive");
  // res.writeHead(200, { "Content-Type": "text/html" });
  res.json({
    data: "A",
    age: 9,
  });
  return; //res.end();
});
var server = app.listen(5000, function () {
  console.log("Server is running..");
});
