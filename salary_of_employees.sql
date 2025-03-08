delimiter //
create procedure salary_of_employees(
	IN p_emp_no INT)
begin
	select 
		emp.emp_no, emp.first_name, emp.last_name, sal.amount, de.from_date, de.to_date
	from 
		employee emp
		left join salary sal on 
        emp.emp_no = sal.emp_no 
        left join dept_emp de on
        emp.emp_no = de.emp_no
	where 
		emp.emp_no = p_emp_no and 
        de.to_date = '9999-01-01';
end //
delimiter ;
