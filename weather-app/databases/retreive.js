var con = require("./connection");
var students;
con.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
  con.query("SELECT * FROM student", function (err, result, fields) {
    if (err) throw err;
    Object.keys(result).forEach(function (key) {
      students = JSON.stringify(result[key]);
      console.log(students);
    });
  });
});
module.exports = students;
