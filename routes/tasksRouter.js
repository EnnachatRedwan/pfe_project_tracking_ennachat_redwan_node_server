const express=require('express');
const tasksRouter=require('../controllers/tasksController');

const router=express.Router();

router.post('/start-task/:token',tasksRouter.start_task_post);

router.get('/:projectId/:token',tasksRouter.tasks_get);

router.delete('/:token',tasksRouter.task_delete);


router.post('/:token',tasksRouter.task_post);

module.exports=router;