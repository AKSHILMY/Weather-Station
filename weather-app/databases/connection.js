var mysql = require("mysql");
var con = mysql.createConnection({
  host: "localhost",
  user: "sqluser",
  password: "password",
  database: "weather_station",
});

module.exports = con;
