-- List the following details of each employee: employee number, last name, first name, gender, and salary.
select employee.emp_no, employee.last_name, employee.first_name, employee.gender, salary.salary 
from employee
join salary on salary.emp_no = employee.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
select employee.first_name, employee.last_name, employee.hire_date 
from employee
where extract(year from employee.hire_date) = 1986;

-- List the manager of each department with the following information: department number, department name, 
-- the manager's employee number, last name, first name.
select department_manager.dept_no, department.dept_name, employee.emp_no, employee.last_name, employee.first_name
from department_manager
join department on department.dept_no = department_manager.dept_no
join employee on employee.emp_no = department_manager.emp_no;

-- List the department of each employee with the following information: employee number, 
-- last name, first name, and department name.
select employee.emp_no, employee.last_name, employee.first_name, department.dept_name
from employee
join department_employee on department_employee.emp_no = employee.emp_no
join department on department.dept_no = department_employee.dept_no;

-- List first name, last name, and gender for employees whose first name is "Hercules" and last names begin with "B."
select employee.first_name, employee.last_name, employee.gender
from employee
where first_name = 'Hercules' and last_name like 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select employee.emp_no, employee.last_name, employee.first_name, department.dept_name
from employee
join department_employee on department_employee.emp_no = employee.emp_no
join department on department.dept_no = department_employee.dept_no
where department.dept_name = 'Sales';

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, 
-- and department name.
select employee.emp_no, employee.last_name, employee.first_name, department.dept_name
from employee
join department_employee on department_employee.emp_no = employee.emp_no
join department on department.dept_no = department_employee.dept_no
where department.dept_name = 'Sales' or department.dept_name = 'Development';

--In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select last_name, count(last_name)
from employee
group by last_name
order by count(last_name) desc;