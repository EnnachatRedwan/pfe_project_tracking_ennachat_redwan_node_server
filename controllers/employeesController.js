const con = require("../models/connection");
const jwt = require("jsonwebtoken");

const employees_get = (req, res) => {
  const token = req.params["token"];
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query(
      "select * from employee where leader =?",
      user.username,
      (err, result) => {
        if (err) {
          res.status(403).send();
          throw err;
        }
        res.send(result);
      }
    );
  });
};

module.exports = { employees_get };
