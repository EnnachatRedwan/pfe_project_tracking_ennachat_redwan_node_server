const con = require("../models/connection");
const jwt = require("jsonwebtoken");

const login_user_post = (req, res) => {
  const user = req.body;
  con.query("call login(?,?)", [user.username, user.password], (err, rows) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    if (rows[0][0] == null) res.status(401).json({ user: null });
    else if (rows[0][0].state == 0) res.status(302).json({ state: 0 });
    else {
      User = JSON.parse(JSON.stringify(rows[0][0]));
      jwt.sign(
        User,
        process.env.TOKEN_KEY,
        (err, token) => {
          if (err) throw err;
          res.json({ User ,token });
        }
      );
    }
  });
};

const activate_user_post = (req, res) => {
  const user = req.body;
  con.query(
    "call activateUser(?,?,?)",
    [user.username, user.password, user.key],
    (err, result) => {
      if (err) {
        res.status(500).send();
        throw err;
      }
      if (result[0][0].activated == 0) res.status(400).send();
      else res.status(200).send();
    }
  );
};

module.exports = {
  login_user_post,
  activate_user_post,
};
