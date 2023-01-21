const con = require("../models/connection");
const jwt = require("jsonwebtoken");
const uuid = require("uuid").v1;

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

const employee_post = (req, res) => {
  const token = req.params["token"];
  const employee = req.body;
  const key = uuid().substring(0, 5);

  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query(
      "insert into employee (username,fullname,empKey,leader) values(?,?,?,?)",
      [employee.username, employee.fullname, key,user.username],
      (err, result) => {
        if (err) {
          if (err.code == "ER_DUP_ENTRY") res.status(409).send();
          res.status(500).send();
          throw err;
        }
        res.json({ key: key });
      }
    );
  });
};

const employee_delete = (req, res) => {
  const token = req.params["token"];
  const employee = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query(
      "delete from employee where username=? and leader =?",
      [employee.username, user.username],
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

const employee_reset_put = (req, res) => {
  const token = req.params["token"];
  const employee = req.body;
  const key = uuid().substring(0, 5);
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query(
      "update employee set empKey =?,isActivated=false where username=? and leader =?",
      [key, employee.username, user.username],
      (err) => {
        if (err) {
          res.status(403).send();
          throw err;
        }
        res.json({ key: key });
      }
    );
  });
};

const employee_fullname_patch = (req,res)=>{
  const token = req.params["token"];
  const employee = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query(
      "update employee set fullname =? where username=? and leader =?",
      [employee.fullname, employee.username, user.username],
      (err) => {
        if (err) {
          res.status(403).send();
          throw err;
        }
        res.send();
      }
    );
  });
}

module.exports = {
  employees_get,
  employee_post,
  employee_delete,
  employee_reset_put,
  employee_fullname_patch
};
