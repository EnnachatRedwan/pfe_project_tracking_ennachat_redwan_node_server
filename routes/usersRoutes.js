const express = require("express");
const usersController = require('../controllers/usersController');

const router = express.Router();


router.post("/login", usersController.login_user_post);

router.post('/activate-user',usersController.activate_user_post);

module.exports = router;
