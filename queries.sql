
--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT e.emp_no, last_name, first_name, sex, salary
FROM employees AS e
JOIN salaries AS s
ON (e.emp_no = s.emp_no)


--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT last_name, first_name, hire_date
FROM employees
WHERE hire_date BETWEEN '1986-01-01' AND '1986-12-31';

-- 3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT m.dept_no, m.emp_no, d.dept_name, e.first_name, e.last_name
FROM dept_manager AS m
JOIN departments AS d
ON (m.dept_no = d.dept_no)
	JOIN employees as e
	ON (e.emp_no = m.emp_no)
	

--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
	JOIN departments as d
	ON(de.dept_no = d.dept_no);
	
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
	JOIN departments as d
	ON(de.dept_no = d.dept_no)
	WHERE dept_name = 'Sales';
	
	
--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employees as e
JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
	JOIN departments as d
	ON(de.dept_no = d.dept_no)
	WHERE dept_name = 'Sales' OR dept_name = 'Development';


--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name, COUNT(last_name) AS last_name_count
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;

--Bonus: Average salary by title
SELECT title, ROUND(AVG(salary),2) AS avg_salary
FROM titles
JOIN employees as e
ON (emp_title_id = title_id)
	JOIN salaries as s
	ON(e.emp_no = s.emp_no)
GROUP BY title