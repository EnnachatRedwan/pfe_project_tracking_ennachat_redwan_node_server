const con = require("../models/connection");
const jwt = require("jsonwebtoken");

const steps_get = (req, res) => {
  const token = req.params["token"];
  const taskId = req.params["taskId"];
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query("call getSteps(?,?)", [user.username, taskId], (err, result) => {
      if (err) {
        res.status(500).send();
        throw err;
      }
      res.send(result[0]);
    });
  });
};

const step_post = (req, res) => {
  const token = req.params["token"];
  const step = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "call addStep(?,?,?,?)",
      [user.username, step.taskId, step.title, step.desc],
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

const check_step_post = (req, res) => {
  const token = req.params["token"];
  const taskId = req.params["taskId"];
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query("call checkStep(?,?)", [user.username, taskId], (err) => {
      if (err) {
        res.status(500).send();
        throw err;
      }
      res.send();
    });
  });
};

const uncheck_step_post = (req, res) => {
  const token = req.params["token"];
  const taskId = req.params["taskId"];
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query("call uncheckStep(?,?)", [user.username, taskId], (err) => {
      if (err) {
        res.status(500).send();
        throw err;
      }
      res.send();
    });
  });
};

const step_delete = (req, res) => {
  const token = req.params["token"];
  const step = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "delete from step where id_step =? and id_task in (select id_task from task where project_id in (select id_prj from project where leader =?));",
      [step.id, user.username],
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

const step_update = (req, res) => {
  const token = req.params["token"];
  const step = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "update step set title=?,description=? where id_step=? and id_task in (select id_task from task where project_id in (select id_prj from project where leader =?));",
      [step.title,step.desc,step.id, user.username],
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

module.exports = {
  steps_get,
  check_step_post,
  uncheck_step_post,
  step_post,
  step_delete,
  step_update,
};
