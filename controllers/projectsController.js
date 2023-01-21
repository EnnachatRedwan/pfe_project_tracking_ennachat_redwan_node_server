const con = require("../models/connection");
const jwt = require("jsonwebtoken");

const projects_get = (req, res) => {
  const token = req.params["token"];
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query("call getProjects(?)", user.username, (err, result) => {
      if (err) {
        res.status(500).send();
        throw err;
      }
      res.send(result[0]);
    });
  });
};

const project_post = (req, res) => {
  const token = req.params["token"];
  const project = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "call insertProject(?,?,?,?)",
      [project.title, project.type, project.addingDate, user.username],
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

const project_delete = (req, res) => {
  const token = req.params["token"];
  const project = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "delete from project where id_prj=? and leader=?",
      [project.id, user.username],
      (err, result) => {
        if (err) {
          res.status(500).send();
          throw err;
        }
        res.send();
      }
    );
  });
};

const project_patch = (req, res) => {
  const token = req.params["token"];
  const project = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(403).send();
      throw err;
    }
    con.query(
      "call editProject(?,?,?,?,?)",
      [project.id, project.title, project.addingDate,project.type, user.username],
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

const start_project_post = (req, res) => {
  const token = req.params["token"];
  const project = req.body;
  const today = new Date();
  const date =
    today.getFullYear() + "-" + (today.getMonth() + 1) + "-" + today.getDate();
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "update project set isStarted=true,startingDate=? where id_prj=? and leader=?",
      [date, project.id, user.username],
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

const project_archive_post = (req, res) => {
  const token = req.params["token"];
  const project = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "call archiveProject(?,?)",
      [user.username, project.id],
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

const project_unarchive_post = (req, res) => {
  const token = req.params["token"];
  const project = req.body;
  jwt.verify(token, process.env.TOKEN_KEY, (err, user) => {
    if (err) {
      res.status(500).send();
      throw err;
    }
    con.query(
      "delete from projectarchive where username=? and id_prj=?",
      [user.username, project.id],
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
  projects_get,
  project_post,
  project_delete,
  start_project_post,
  project_archive_post,
  project_unarchive_post,
  project_patch,
};
