const express=require('express');
const employeesController=require('../controllers/employeesController');

const router=express.Router();

router.get('/:token',employeesController.employees_get);

router.post('/:token',employeesController.employee_post);

router.delete('/:token',employeesController.employee_delete);

router.put('/:token',employeesController.employee_reset_put);

router.patch('/:token',employeesController.employee_fullname_patch);

module.exports=router;