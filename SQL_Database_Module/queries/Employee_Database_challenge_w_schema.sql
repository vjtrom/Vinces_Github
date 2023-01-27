-- MODULE 7 CHALLENGE
-- DELIVERABLE #1

-- 1) Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT e.emp_no,
    e.first_name,
    e.last_name,
-- 2) Retrieve the title, from_date, and to_date columns from the Titles table.	
	t.title,
	t.from_date,
	t.to_date
-- 3) Create a new table using the INTO clause.	
INTO retirement_titles
FROM employees as e
-- 4) Join both tables on the primary key.
INNER JOIN titles as t
ON e.emp_no = t.emp_no
-- 5) Filter the data on the birth_date column to retrieve the employees
--    who were born between 1952 and 1955. Then, order by the employee number.
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY "emp_no" ASC;

-- Show retirement_titles
SELECT * FROM retirement_titles;


-- 9. Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--    These columns will be in the new table that will hold the most recent title of each employee.
-- 10.Use the DISTINCT ON statement to retrieve the first occurrence of the employee number 
--    for each set of rows defined by the ON () clause.
SELECT DISTINCT ON (emp_no) emp_no, first_name, last_name, title

-- 12. Create a Unique Titles table using the INTO clause.
INTO retirement_unique_titles
FROM retirement_titles

-- 11. Exclude those employees that have already left the company by filtering on to_date to 
--     keep only those dates that are equal to '9999-01-01'.
WHERE to_date='9999-01-01'

-- 13. Sort the Unique Titles table in ascending order by the employee number and descending order by 
--     the last date (i.e., to_date) of the most recent title.

ORDER BY "emp_no" ASC;

-- Show retirement_unique_titles
SELECT * FROM retirement_unique_titles;

-- 16. Write another query in the Employee_Database_challenge.sql file to retrieve the number of employees by 
-- their most recent job title who are about to retire.

-- 17. First, retrieve the number of titles from the Unique Titles table.
SELECT title, COUNT(title) AS "count"

-- 18. Then, create a Retiring Titles table to hold the required information.
INTO retiring_titles
FROM retirement_unique_titles

-- 19. Group the table by title, then sort the count column in descending order.
GROUP BY title
ORDER BY count DESC;

-- show retiring_titles
SELECT * FROM retiring_titles;


-- DELIVERABLE #2
--  In the Employee_Database_challenge.sql file, write a query to create a Mentorship Eligibility table that 
--  holds the employees who are eligible to participate in a mentorship program.

-- 1. Retrieve the emp_no, first_name, last_name, and birth_date columns from the Employees table.
-- 2. Retrieve the from_date and to_date columns from the Department Employee table
-- 3. Retrieve the title column from the Titles table.
-- 4. Use a DISTINCT ON statement to retrieve the first occurrence of the employee number for each set of 
--    rows defined by the ON () clause.
-- 5. Create a new table using the INTO clause.

SELECT DISTINCT ON (emp_no)
	e.emp_no,
    e.first_name,
    e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	t.title
INTO mentorship_eligibility
FROM employees as e

-- 6. Join the Employees and the Department Employee tables on the primary key.
-- 7. Join the Employees and the Titles tables on the primary key.

INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no	
INNER JOIN titles as t
ON e.emp_no = t.emp_no

-- 8. Filter the data on the to_date column to all the current employees, then filter the data on the birth_date columns to
--    get all the employees whose birth dates are between January 1, 1965 and December 31, 1965.

WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')

-- 9. Order the table by the employee number.
ORDER BY emp_no ASC;

-- show mentorship_eligibility
select * from mentorship_eligibility;







-- DELIVERABLE #3

-- How many roles will need to be filled as the "silver tsunami" begins to make an impact?




-- Are there enough qualified, retirement-ready employees in the departments to mentor the 
-- next generation of Pewlett Hackard employees?


SELECT DISTINCT ON (emp_no)
	e.emp_no,
    e.first_name,
	e.last_name,
    rt.title,
	de.dept_no,
	e.hire_date,
    de.to_date
INTO silver_tsunami
FROM employees as e
INNER JOIN retirement_titles as rt
ON e.emp_no = rt.emp_no	
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no	
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY "emp_no" ASC;

select * from silver_tsunami;

SELECT emp_no, COUNT(emp_no) AS "dept_count"
INTO tsunami_department_count
FROM silver_tsunami
--SELECT title, COUNT(title) AS "count"
GROUP BY dept_no
ORDER BY dept_no DESC;

SELECT dept_no, COUNT(emp_no) AS "count"
INTO tsunami_department_count
FROM silver_tsunami
GROUP BY dept_no
ORDER BY count DESC;

select * from tsunami_department_count;



SELECT * FROM retirement_titles;
















-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);


CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no)

);








CREATE TABLE employees (
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);
CREATE TABLE dept_manager (
	dept_no VARCHAR NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);
CREATE TABLE titles (
  	emp_no INT NOT NULL,
  	title VARCHAR NOT NULL,
  	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
--  	PRIMARY KEY (emp_no)
);
CREATE TABLE dept_emp (
  emp_no INT NOT NULL,
  dept_no VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
--  PRIMARY KEY (emp_no)
);
SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM salaries;
SELECT * FROM titles;

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM retirement_info;
SELECT * FROM employees;
SELECT * FROM dept_manager;
SELECT * FROM dept_emp;
SELECT * FROM current_emp;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

-- Joining retirement_info and dept_emp tables
SELECT retirement_info.emp_no,
    retirement_info.first_name,
retirement_info.last_name,
    dept_emp.to_date
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no;

-- Joining departments and dept_manager tables
SELECT departments.dept_name,
     dept_manager.emp_no,
     dept_manager.from_date,
     dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

SELECT ri.emp_no,
    ri.first_name,
ri.last_name,
    de.to_date
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no;

SELECT d.dept_name,
     dm.emp_no,
     dm.from_date,
     dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

SELECT ri.emp_no,
    ri.first_name,
    ri.last_name,
de.to_date
INTO current_emp
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
WHERE de.to_date = ('9999-01-01');

SELECT retirement_info.emp_no,
    retirement_info.first_name,
    retirement_info.last_name,
dept_emp.to_date
INTO current_emp
FROM retirement_info
LEFT JOIN dept_emp
ON retirement_info.emp_no = dept_emp.emp_no
WHERE dept_emp.to_date = ('9999-01-01');


SELECT * FROM dept_emp;
SELECT * FROM current_emp;
SELECT * FROM retirement_info;

-- Employee count by department number
SELECT COUNT(ce.emp_no), de.dept_no
INTO current_emp_dept
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

SELECT * FROM current_emp_dept;

SELECT * FROM salaries;
SELECT * FROM salaries
ORDER BY to_date DESC;

SELECT emp_no, first_name, last_name, gender
INTO emp_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

SELECT * FROM emp_info;

SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    s.salary,
    de.to_date
INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON e.emp_no = s.emp_no	
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no	
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
AND (de.to_date = '9999-01-01');

SELECT * FROM emp_info;

-- List of managers per department
SELECT  dm.dept_no,
        d.dept_name,
        dm.emp_no,
        ce.last_name,
        ce.first_name,
        dm.from_date,
        dm.to_date
--INTO manager_info
FROM dept_manager AS dm
    INNER JOIN departments AS d
        ON (dm.dept_no = d.dept_no)
    INNER JOIN current_emp AS ce
        ON (dm.emp_no = ce.emp_no);


SELECT ce.emp_no,
ce.first_name,
ce.last_name,
d.dept_name
-- INTO dept_info
FROM current_emp as ce
INNER JOIN dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON (de.dept_no = d.dept_no);

--Create a query that will return only the information relevant to the 
--Sales team. The requested list includes:
--Employee numbers from employees
--Employee first name from employees
--Employee last name from employees
--Employee department name from dept_employee filtered for sales - d007
-- first left join employees and dept-employee
-- then filter for sales - d007



SELECT e.emp_no,
    e.first_name,
	e.last_name,
    e.gender,
    de.dept_no,
    d.dept_name
--INTO sales_emp_info
FROM employees as e
INNER JOIN dept_emp as de
ON e.emp_no = de.emp_no	
INNER JOIN departments as d
ON de.dept_no = d.dept_no	
WHERE (de.dept_no = 'd007');