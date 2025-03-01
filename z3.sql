select 
	emp.emp_no, emp.first_name, emp.last_name, emp.hire_date, dept.dept_no, de.from_date, de.to_date, dept.dept_name 
from
	employee emp
	inner join dept_emp de on
		emp.emp_no = de.emp_no
	inner join department dept on 
		de.dept_no = dept.dept_no;
    

