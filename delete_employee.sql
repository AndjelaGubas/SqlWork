
drop procedure if exists delete_employee;
delimiter //
create procedure delete_employee(
	IN p_emp_no INT
)
begin 
	delete from employee where emp_no = 20100;
end //
call delete_employee('10300');


