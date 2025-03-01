use employee;
drop procedure if exists assign_employee_to_department;
delimiter //
create procedure assign_employee_to_department(
	IN p_emp_no INT,
	IN p_dept_no CHAR(4)
)
proc: begin
	DECLARE l_is_exists INT DEFAULT 0;
    DECLARE l_first_name varchar(14) DEFAULT NULL;
    DECLARE l_last_name varchar(16) DEFAULT NULL;
    
    -- proveri da li postoji zaposleni sa prosledjenim p_emp_no
    select count(*) into l_is_exists from employee where emp_no = p_emp_no;
    if l_is_exists = 0 then
		select 'zaposleni ne postoji';
		leave proc;
	end if;
    
    -- isto i za department
    select count(*) into l_is_exists from department where dept_no = p_dept_no;
    if l_is_exists = 0 then 
		select 'Department ne postoji';
		leave proc;
	end if;
    
    -- da li je zaosleni vec u deptu
    select count(*) into @is_exists from dept_emp where emp_no = p_emp_no and dept_no = p_dept_no;
	if @is_exists > 0 then
		select 'zaposleni je vec u departmentu';
        leave proc;
	end if;
    
    -- proveriti da li je zaposleni trenutno u nekom drugom departmentu 
    select 
		dept_no into @old_dept_no
	from 
		dept_emp
	where 
		emp_no = p_emp_no and
        to_date = '9999-01-01';
	if @old_dept_no is not null then
		update dept_emp 
        set to_date = now() 
        where
			dept_no = @old_dept_no and 
            emp_no = p_emp_no;
	end if;	

    insert into dept_emp (emp_no, dept_no, from_date, to_date) values (p_emp_no, p_dept_no, now(), '9999-01-01');
	
    select first_name into l_first_name from employee where emp_no = p_emp_no;
    select last_name into l_last_name from employee where emp_no = p_emp_no;
    
	insert into audit (date_action, dept_no, emp_no, audit_action, `description`)
		values (now(), p_dept_no, p_emp_no, 'assignemp', concat('zaposleni dodat u departman ', l_first_name, ' ', l_last_name, ' at ' , now()));
end //
delimiter ;

call assign_employee_to_department(500008, 'd001');
call assign_employee_to_department(500010, 'd001');
call assign_employee_to_department(500007, 'd006');
call assign_employee_to_department(500005, 'd004');
call assign_employee_to_department(50004, 'd005');

select * from audit;