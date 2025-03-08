use employee;

select * 
from 
	employee
	inner join department on 
		department.dept_no = employee.dept_no 
where
	dept_name = 'Managment';

select * from department where dept_name = 'Managment';