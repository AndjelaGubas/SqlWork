drop procedure if exists departments_of_employees;
delimiter //
create procedure departments_of_employees(
	IN p_emp_no INT)
begin
	select 
		emp.emp_no, emp.first_name, emp.last_name, de.dept_no, d.dept_name, de.from_date, de.to_date 
	from 
		employee emp
		left join dept_emp de on
		de.emp_no = emp.emp_no 
        left join department d on
        de.dept_no = d.dept_no
	where 
		emp.emp_no = p_emp_no and
		de.to_date = '9999-01-01'
        
end //
delimiter ;
call departments_of_employees(10017);

