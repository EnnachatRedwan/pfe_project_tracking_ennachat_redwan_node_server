const express=require('express');
const tasksRouter=require('../controllers/tasksController');

const router=express.Router();

router.get('/:projectId/:token',tasksRouter.tasks_get);

router.delete('/:token',tasksRouter.task_delete);

module.exports=router;