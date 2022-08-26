const express=require('express');
const tasksRouter=require('../controllers/tasksController');

const router=express.Router();

router.post('/unarchive/:token',tasksRouter.task_unarchive_post);

router.post('/archive/:token',tasksRouter.task_archive_post);

router.post('/start-task/:token',tasksRouter.start_task_post);

router.get('/:projectId/:token',tasksRouter.tasks_get);

router.delete('/:token',tasksRouter.task_delete);


router.post('/:token',tasksRouter.task_post);

module.exports=router;