
select emp.last_name, emp.first_name, dep.dept_no, dep.dept_name 
from 
	employee emp
	inner join 
		department dep on emp.dept_no = dep.dept_no;
    
    