
drop procedure if exists assign_dept_manager;
delimiter //
create procedure assign_dept_manager(
	IN p_emp_no INT,
    IN p_dept_no CHAR(4)
    )
proc: begin
	DECLARE l_is_exists INT DEFAULT 0;

	select count(*) into l_is_exists from dept_emp where emp_no = p_emp_no and dept_no = p_dept_no and to_date = '9999-01-01';
	if l_is_exists > 0 then
		select 'zaposleni je vec u departmentu';
	else
		insert into dept_emp(emp_no, dept_no, from_date, to_date) 
		values (p_emp_no, p_dept_no, now(), '9999-01-01');
	end if;

	select count(*) into l_is_exists from dept_manager where dept_no = p_dept_no and emp_no = p_emp_no and to_date = '9999-01-01';
	if l_is_exists > 0 then 
		select 'zaposleni je vec menadzer u departmanu';
		leave proc;
	end if;

	update dept_manager
		set to_date = now()
		where dept_no = p_dept_no and
		to_date = '9999-01-01';
    
	insert into dept_manager (emp_no, dept_no, from_date, to_date) 
    values (p_emp_no, p_dept_no, now(), '9999-01-01');

	insert into audit (date_action, dept_no, emp_no, audit_action, `description`)
		values (now(), p_dept_no, p_emp_no, 'addman', concat('dodat novi menadzer' , p_emp_no, ' ' ,p_dept_no, 'at' ,now()));

end //
delimiter ;