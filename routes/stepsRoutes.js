const express = require("express");
const stepsController=require('../controllers/stepsController');

const router = express.Router();

router.post('/check/:token/:taskId',stepsController.check_step_post);

router.post('/uncheck/:token/:taskId',stepsController.uncheck_step_post);

router.get('/:token/:taskId',stepsController.steps_get);

router.post('/:token',stepsController.step_post);

router.delete('/:token',stepsController.step_delete);

router.put('/:token',stepsController.step_update);

module.exports = router;
