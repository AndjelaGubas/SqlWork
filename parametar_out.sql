drop procedure if exists get_employee_name;
delimiter //
create procedure get_employee_name(
	IN p_emp_no INT,
	OUT p_name varchar(20)
)
proc: begin
    
    select first_name into p_name
	from
		employee
	where
		emp_no = p_emp_no;
    
end //
delimiter ;

set @neko_ime = '';
call get_employee_name(500009, @neko_ime);

select @neko_ime;