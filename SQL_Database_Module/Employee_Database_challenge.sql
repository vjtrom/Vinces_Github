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

-- Select the number of current employees eligible for retirement
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
AND (de.to_date = '9999-01-01')
ORDER BY "emp_no" ASC;

select * from silver_tsunami;


-- Add the department name to the table
SELECT
	st.emp_no,
    st.first_name,
	st.last_name,
    st.title,
	st.dept_no,
	dpt.dept_name,
	st.hire_date,
    st.to_date
INTO silver_tsunami_2
FROM silver_tsunami as st
INNER JOIN departments as dpt
ON st.dept_no = dpt.dept_no;

SELECT * FROM silver_tsunami_2;

-- Count the number of current, eligible employees by department
SELECT dept_name, count(emp_no) AS "dept_count"
INTO tsunami_department_count
FROM silver_tsunami_2
GROUP BY dept_name
ORDER BY dept_count DESC;

SELECT * FROM tsunami_department_count;