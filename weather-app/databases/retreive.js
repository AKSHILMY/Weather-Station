var con = require("./connection");
var sensor_data;
con.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
  con.query("SELECT * FROM sensor_data", function (err, result, fields) {
    if (err) throw err;
    Object.keys(result).forEach(function (key) {
      sensor_data = JSON.stringify(result[key]);
      sensor_data = JSON.parse(sensor_data);
      console.log(sensor_data);
    });
  });
});
module.exports = sensor_data;
