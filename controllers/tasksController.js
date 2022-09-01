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
      [task.title, task.addingDate, task.projectId, user.username],
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

const task_patch = (req, res) => {
  const token = req.params["token"];
  const task = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query(
      "call editTask(?,?,?,?)",
      [task.id, task.title, task.addingDate, user.username],
      (err) => {
        if (err) {
          res.status(403).send();
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

const task_archive_post = (req, res) => {
  const token = req.params["token"];
  const project = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query("call archiveTask(?,?)", [user.username, project.id], (err) => {
      if (err) {
        res.status(500).send();
        throw err;
      }
      res.send();
    });
  });
};

const task_unarchive_post = (req, res) => {
  const token = req.params["token"];
  const task = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "delete from taskArchive where username=? and id_task=?",
      [user.username, task.id],
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

const archived_tasks_get = (req, res) => {
  const token = req.params["token"];
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "select t.*,p.title from task t,project p where t.id_task in (select id_task from taskArchive where username=?) and t.project_id = p.id_prj;",
      [user.username],
      (err) => {
        if (err) {
          res.status(500).send();
          throw err;
        }
        console.log(result);
        res.send();
      }
    );
  });
};

const affect_task_post = (req, res) => {
  const token = req.params["token"];
  const data = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "call affectTaskToEmployee(?,?,?);",
      [user.username, data.taskId, data.employeeUsername],
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

const unaffect_task_post = (req, res) => {
  const token = req.params["token"];
  const data = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "call unaffectTaskToEmployee(?,?,?);",
      [user.username, data.taskId, data.employeeUsername],
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

const task_employee_get = (req, res) => {
  const token = req.params["token"];
  const taskId = req.params["taskId"];
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "select username from employee where username in (select username from empTask where id_task=?)",
      [taskId],
      (err, result) => {
        if (err) {
          res.status(500).send();
          throw err;
        }
        res.send(result);
      }
    );
  });
};

module.exports = {
  tasks_get,
  task_delete,
  start_task_post,
  task_post,
  task_archive_post,
  task_unarchive_post,
  archived_tasks_get,
  affect_task_post,
  unaffect_task_post,
  task_employee_get,
  task_patch,
};
