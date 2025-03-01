drop procedure if exists update_employee;
delimiter //
create procedure update_employee( 
	IN p_first_name varchar(14) ,
    IN p_last_name varchar(16),
    In p_birth_date date,
    IN p_emp_no INT 
    )
begin
	update employee
		set first_name = p_first_name, last_name = p_last_name, birth_date = p_birth_date
        where emp_no = p_emp_no;
        
	insert into audit( date_action, dept_no, emp_no, audit_action, `description`)
		values (now(), NULL, p_emp_no, 'updemp', concat('Zaposleni je azuriran: ', p_emp_no, ' at ', NOW()));
	
end //
delimiter ;
 call update_employee('Nikola', 'Marinkovic', '1998-07-02' , 10001)
select * from employee;
select * from audit;