select emp.first_name, emp.last_name, emp.emp_no, sal.amount, from_date
from 
	employee emp
	left join salary sal on 
		sal.emp_no = emp.emp_no
where
	emp.emp_no = 10009;






