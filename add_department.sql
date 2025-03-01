drop procedure if exists add_department;
delimiter //
create procedure add_department(
	IN p_dept_no CHAR(4),
	IN p_dept_name VARCHAR(40),
	IN p_email VARCHAR(50)
)
begin

	insert into department (dept_name, dept_no, email) 
    values (p_dept_name, p_dept_no, p_email);
    
    insert into audit (date_action, dept_no, emp_no, audit_action, action_desc)
	values (now(), p_dept_no, NULL, 'adddep', concat('dep dodat', p_dept_name, p_dept_no,'at', now()));
    
end //
delimiter ;

call add_department('d014', 'Housekeeping department', 'seacdept@gmail.com');
