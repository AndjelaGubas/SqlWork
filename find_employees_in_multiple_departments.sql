delimiter //

create procedure FindEmployeesInMultipleDepartments()
begin
	select
        e.emp_no, 
        e.first_name, 
        e.last_name
	from
        employees e
    where 
        e.emp_no IN (
            select 
                de.emp_no
            from 
                dept_emp de
            group by
                de.emp_no
            having
                COUNT(DISTINCT de.dept_no) > 1
        );
end //
delimiter ;
