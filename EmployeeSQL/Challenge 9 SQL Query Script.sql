--SQL CHALLENGE QUERY SCRIPTS

--1. List the employee number, last name, first name, sex and salary of each employee
Select e.emp_no,
	e.last_name,
	e.first_name,
	e.sex,
	s.salary
From employee e
 Left Join salaries as s 
 	on e.emp_no = s.emp_no
	
--2. List the first name, last name, and hire date for the employees who were hired in 1986

Select first_name,
	last_name,
	hire_date
From employee 
where hire_date between '1986-01-01' and '1986-12-31'

--3. list the manager of each department along with their department number, department name, employee number, last name and first name

Select dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name
From dept_manager dm
Left Join department as d
	on dm.dept_no = d.dept_no
Left Join employee as e
	on dm.emp_no = e.emp_no


--4. List the department number for each employee along with that employee's employee number, last name, first name, and department name

Select de.dept_no,
	de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
From dept_emp de
Left Join department as d
	on de.dept_no = d.dept_no
Left Join employee as e
	on de.emp_no = e.emp_no


--5. List first name, last name, and sex of each employee whose first is hercules and whose last name begins with the letter b.

Select *
From department;

Select first_name,
	last_name,
	sex
From employee
Where first_name Like 'Hercules'
	and last_name like 'B%'
	
--6. List each employee in the Sales department, including their employee number, last name, and first name	
--finding the dept_no for Sales
Select *
from department

--finding how many employees work in the Sales department
select count(*)
from dept_emp
Where dept_no = 'd007'

--completing task #6

Select de.emp_no,
	e.last_name,
	e.first_name
From dept_emp de
Left join employee e 
	on de.emp_no = e.emp_no
Left join department d
	on de.dept_no = d.dept_no
Where de.dept_no = 'd007'

--7. List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name

Select de.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
From dept_emp de
Left join employee e 
	on de.emp_no = e.emp_no
Left join department d
	on de.dept_no = d.dept_no
Where de.dept_no = 'd007' or de.dept_no = 'd005'
Order by de.dept_no

--8. List the frequency counts,in decending order, of all the employee lastnames (that is, how many employees share each last name)

Select last_name, Count(last_name)
From employee
Group by last_name
order by last_name DESC