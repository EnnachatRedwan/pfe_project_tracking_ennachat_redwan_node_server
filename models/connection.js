const mysql = require("mysql");

const con = mysql.createConnection({
  host: "sql12.freesqldatabase.com",
  user: "sql12592225",
  password: "IeByyw3ESd",
  database: "sql12592225",
  timezone: "utc",
});

con.connect((err) => {
  if (err) throw err;
});

module.exports = con;
