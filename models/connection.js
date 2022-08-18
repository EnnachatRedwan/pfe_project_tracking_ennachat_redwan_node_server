const mysql = require("mysql");

const con = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "radwan456",
  database: "ProjectsTracking",
});

con.connect((err) => {
  if (err) throw err;
});

module.exports = con;
