const con = require("../models/connection");
const uuid = require("uuid").v1;
const jwt=require('jsonwebtoken');

const register_user_post = (req, res) => {
  const user = req.body;
  const key = uuid().substring(0, 5);
  con.query(
    "insert into Employee (username,fullname,empKey) values(?,?,?)",
    [user.username, user.fullname, key],
    (err, result) => {
      if (err) {
        if (err.code == "ER_DUP_ENTRY") res.status(409).send();
        res.status(500).send();
        throw err;
      }
      res.json({ key: key });
    }
  );
};

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
      User=JSON.parse(JSON.stringify(rows[0][0]));
      jwt.sign(User,process.env.TOKEN_KEY,{expiresIn:'20s'},(err,token)=>{
        if(err) throw err;
        res.json({token});
      })
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
  register_user_post,
  login_user_post,
  activate_user_post,
};
