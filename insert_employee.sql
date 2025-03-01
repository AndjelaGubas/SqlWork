drop procedure if exists insert_employee;

delimiter //
create procedure insert_employee(
	IN p_first_name VARCHAR(16),
	IN p_last_name VARCHAR(16),
	IN p_birth_date DATE,
    IN p_gender ENUM('M', 'F'),
    IN p_hire_date DATE ,
    IN p_dept_no CHAR(4)
)
begin
	set @max_no = (select max(emp_no) AS max_employee_number FROM employee);

	insert into employee 
		(emp_no, birth_date, first_name, last_name, gender, hire_date, dept_no) 
	values 
		(@max_no+1, p_birth_date,  p_first_name, p_last_name, p_gender, p_hire_date, p_dept_no);
	
    CALL assign_employee_to_department(@max_no+1, p_dept_no);
    
end //
delimiter ;

call insert_employee('Mitar', 'Jelic', '2002-11-14',  'M', '2025-02-24', 'd002');

 
    
    