const con = require("../models/connection");
const jwt = require("jsonwebtoken");

const tasks_get = (req, res) => {
  const token = req.params["token"];
  const projectId = req.params["projectId"];
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query(
      "call getProjectTasks(?,?)",
      [user.username, projectId],
      (err, result) => {
        if (err) {
          res.status(500).send();
          throw err;
        }
        res.send(result[0]);
      }
    );
  });
};

const task_post = (req, res) => {
  const token = req.params["token"];
  const task = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "call insertTask(?,?,?,?);",
      [task.title, task.addingDate,task.projectId, user.username],
      (err, result) => {
        if (err) {
          res.status(500).send();
          throw err;
        }
        res.send(result[0]);
      }
    );
  });
};

const task_delete = (req, res) => {
  const token = req.params["token"];
  const task = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "delete from task where id_task=? and project_id in(select id_prj from project where leader=?)",
      [task.id, user.username],
      (err) => {
        if (err) {
          res.status(500).send();
          throw err;
        }
        res.send();
      }
    );
  });
};

const start_task_post = (req, res) => {
  const token = req.params["token"];
  const task = req.body;
  const today = new Date();
  const date =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "update task set isStarted=true,startingDate=? where id_task=? and project_id in(select id_prj from project where leader=?)",
      [date, task.id, user.username],
      (err) => {
        if (err) {
          res.status(500).send();
          throw err;
        }
        res.send();
      }
    );
  });
};

module.exports = { tasks_get, task_delete, start_task_post, task_post };
