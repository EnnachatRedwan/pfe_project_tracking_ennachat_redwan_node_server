const express=require('express');
const employeesController=require('../controllers/employeesController');

const router=express.Router();

router.get('/:token',employeesController.employees_get);

module.exports=router;