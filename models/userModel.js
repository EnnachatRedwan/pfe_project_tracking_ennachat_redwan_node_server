const con = require("./connection");
const uuid = require("uuid").v1;

const register = (user) => {
  const key = uuid().substring(0, 5);
  con.query("insert into Employee (username,fullname,empKey) values(?,?,?)", [
    user.username,
    user.fullname,
    key,
  ]);
};

const login = (user) => {
  con.query("call login(?,?)", [user.username, user.password], (err, rows) => {
    if (err) throw err;
    if (rows[0][0].state == 0) return 0;
    if (rows[0].length == 0) return null;
    else return rows[0][0];
  });
};

module.exports = { register, login };
