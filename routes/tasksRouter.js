const express=require('express');
const tasksRouter=require('../controllers/tasksController');

const router=express.Router();

router.get('/employees/:token/:taskId',tasksRouter.task_employee_get);

router.post('/affect/:token',tasksRouter.affect_task_post);

router.post('/unaffect/:token',tasksRouter.unaffect_task_post);

router.get('/archived/:token',tasksRouter.archived_tasks_get);

router.post('/unarchive/:token',tasksRouter.task_unarchive_post);

router.post('/archive/:token',tasksRouter.task_archive_post);

router.post('/start-task/:token',tasksRouter.start_task_post);

router.get('/:projectId/:token',tasksRouter.tasks_get);

router.delete('/:token',tasksRouter.task_delete);


router.post('/:token',tasksRouter.task_post);

module.exports=router;