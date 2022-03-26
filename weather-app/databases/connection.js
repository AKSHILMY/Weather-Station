var mysql = require("mysql");
var con = mysql.createConnection({
  host: "localhost",
  user: "sqluser",
  password: "password",
  database: "sql_lab4",
});

module.exports = con;
