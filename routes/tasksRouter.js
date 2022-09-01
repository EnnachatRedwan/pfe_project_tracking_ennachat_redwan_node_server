const express=require('express');
const tasksController=require('../controllers/tasksController');

const router=express.Router();

router.get('/employees/:token/:taskId',tasksController.task_employee_get);

router.post('/affect/:token',tasksController.affect_task_post);

router.post('/unaffect/:token',tasksController.unaffect_task_post);

router.get('/archived/:token',tasksController.archived_tasks_get);

router.post('/unarchive/:token',tasksController.task_unarchive_post);

router.post('/archive/:token',tasksController.task_archive_post);

router.post('/start-task/:token',tasksController.start_task_post);

router.get('/:projectId/:token',tasksController.tasks_get);

router.delete('/:token',tasksController.task_delete);

router.post('/:token',tasksController.task_post);

router.patch('/:token',tasksController.task_patch);

module.exports=router;