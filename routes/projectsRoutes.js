const express=require('express');
const projectsController=require('../controllers/projectsController');

const router=express.Router();

router.get('/:token',projectsController.projects_get);

router.post('/:token',projectsController.project_post);

router.delete('/:token',projectsController.project_delete);

router.post('/start-project/:token',projectsController.start_project_post);

module.exports=router;