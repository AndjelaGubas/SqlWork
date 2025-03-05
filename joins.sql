-- Lista svih zaposlenih (ime, prezime, emp_no, datum rodjenja, gender),  
-- sa nazivima departmenta u kojem trenutno rade, datumom kad su poceli da rade i 
-- trenutnom platom i datumom od kad primaju tu platu

select 
	first_name, last_name, emp.emp_no, birth_date, gender,  sal.amount, sal.to_date, sal.from_date, de.dept_no, dept.dept_name
from 
	employee emp
	left join salary sal on emp.emp_no = sal.emp_no
	left join dept_emp de on emp.emp_no = de.emp_no
	left join department dept on de.dept_no = dept.dept_no
where 
	sal.to_date = '9999-01-01';

		