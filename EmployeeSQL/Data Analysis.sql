-- DATA ANALYSIS


-- 1. List the employee number, last name, first name, sex, and salary of each employee.

SELECT Employees.emp_no AS "employee number", 
Employees.last_name AS "last name", 
Employees.first_name AS "first name", 
Employees.sex AS sex,
Salaries.salary AS "salary of each employee"
FROM Employees
INNER JOIN Salaries ON
Employees.emp_no = Salaries.emp_no;



-- 2. List the first name, last name, and hire date for the employees who were hired in 1986.

SELECT first_name AS "first name", 
last_name AS "last name", 
hire_date AS "hire date"
FROM Employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';



-- 3.List the manager of each department along with their department number, department name, employee number, last name, and first name.

SELECT Department_Manager.dept_no AS "department number", 
	   Departments.dept_name AS "department name",
	   Department_Manager.emp_no AS "employee number",
	   Employees.last_name AS "last name",
	   Employees.first_name AS "first name" 
FROM Department_Manager
INNER JOIN Departments ON
Department_Manager.dept_no = Departments.dept_no
INNER JOIN Employees ON
Department_Manager.emp_no = Employees.emp_no;



-- 4.List the department number for each employee along with that employee’s employee number, last name, first name, and department name

SELECT Employees.emp_no AS "employee number", 
	   Employees.last_name AS "last name", 
	   Employees.first_name AS "first name",
	   Departments.dept_name AS "department name"
FROM Employees
INNER JOIN Department_Employees ON
Employees.emp_no = Department_Employees.emp_no
INNER JOIN Departments ON
Department_Employees.dept_no = Departments.dept_no;



-- 5.List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.

SELECT first_name AS "first name",
	   last_name AS "last name",
	   sex
FROM Employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';



-- 6.List each employee in the Sales department, including their employee number, last name, and first name.

SELECT Employees.emp_no AS "employee number",
	   Employees.last_name AS "last name", 
	   Employees.first_name AS "first name"
FROM Employees
INNER JOIN Department_Employees ON
Employees.emp_no = Department_Employees.emp_no
INNER JOIN Departments ON
Department_Employees.dept_no = Departments.dept_no
WHERE dept_name = 'Sales';



-- 7.List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT Employees.emp_no AS "employee number", 
	   Employees.last_name AS "last name",
	   Employees.first_name AS "first name",
	   Departments.dept_name AS "department name"
FROM Employees
JOIN Department_Employees ON
Employees.emp_no = Department_Employees.emp_no
INNER JOIN Departments ON
Department_Employees.dept_no = Departments.dept_no
WHERE dept_name = 'Sales' OR 
	  dept_name = 'Development';



-- 8.List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT last_name, COUNT(last_name) 
FROM Employees
GROUP BY last_name
ORDER BY COUNT(last_name) DESC;
	  
