const express = require("express");
const projectsController = require("../controllers/projectsController");

const router = express.Router();

router.post("/archive/:token", projectsController.project_archive_post);

router.post("/unarchive/:token", projectsController.project_unarchive_post);

router.post("/start-project/:token", projectsController.start_project_post);

router.get("/:token", projectsController.projects_get);

router.post("/:token", projectsController.project_post);

router.delete("/:token", projectsController.project_delete);

module.exports = router;
