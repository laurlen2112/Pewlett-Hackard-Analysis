--create a new table 7.3.1
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--SEE NEW TABLE
SELECT * FROM retirement_info;

SELECT * FROM departments;
DROP TABLE employees CASCADE;
DROP TABLE dept_emp CASCADE;

--re-create employee table
CREATE TABLE employees (
	emp_no INT NOT NULL, 
	birth_date DATE NOT NULL, 
	first_Name VARCHAR(40) NOT NULL,
	Last_Name VARCHAR(40) NOT NULL,
	gender VARCHAR(7) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

DROP TABLE dept_emp CASCADE;

--recreate dept_emp table without PK hoping it takes care of employee id prob
CREATE Table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no)
);


DROP TABLE salaries CASCADE;

--re- create salary table deleted PK emp_no hoping it will nullify issues of
--more than one id in same column
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);


SELECT * FROM employees;
SELECT * FROM titles;


--7.3.1
--search for bdays btwn 1952 - 1955, 90,398 + results
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

--search for bdays in 1952, 21,209 rows
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1952-12-31';

--skill dril 7.3.1 search for bdays for evey year

--search for bdays in 1953, 22,857
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1953-01-01' AND '1953-12-31';

--search for bdays in 1954, 23,228
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1954-01-01' AND '1954-12-31';

--search for bdays in 1955, 23,104
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1955-01-01' AND '1955-12-31';

-- Retirement eligibility
SELECT first_name, last_name
FROM employees
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31';

-- Retirement eligibility, 41,380 results
SELECT first_name, last_name
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

-- Number of employees retiring, 41,380
SELECT COUNT(first_name)
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--create a new table 7.3.1
SELECT first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--SEE NEW TABLE
SELECT * FROM retirement_info;

--7.3.2 drop original retirment table and recreate with emp-no

DROP TABLE retirement_info;

--recreate retirement info table
SELECT emp_no, first_name, last_name
INTO retirement_info
FROM employees
WHERE (birth_date BETWEEN '1952-01-01' and '1955-12-31')
AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31');

--check table
SELECT * FROM retirement_info;
SELECT COUNT(first_name)
FROM retirement_info

--joining department and dept_managers table with inner join
SELECT departments.dept_name,
	dept_manager.emp_no,
	dept_manager.from_date,
	dept_manager.to_date
FROM departments
INNER JOIN dept_manager
ON departments.dept_no = dept_manager.dept_no;

--check table
SELECT * FROM departments;
SELECT COUNT(emp_no)
FROM departments
--practice the same join as above, using aliases
SELECT d.dept_name,
	dm.emp_no,
	dm.from_date,
	dm.to_date
FROM departments as d
INNER JOIN dept_manager as dm
ON d.dept_no = dm.dept_no;

--using a left join to add start and end dates to retire table
SELECT retirement_info.emp_no,
	retirement_info.first_name,
retirement_info.last_name,
	dept_emp.to_date
--assign left join with FROM
FROM retirement_info
LEFT JOIN dept_emp
--use on to tell it where they are lined
ON retirement_info.emp_no = dept_emp.emp_no;

--practice using aliases (ri = retirement info, de = dept emp)
--same join as above but using alisases
--aliases are not saved and only exist with the block of code we use 
--use them in
SELECT ri.emp_no,
	ri.first_name,
ri.last_name,
	de.to_date
--define the aliases
FROM retirement_info as ri
LEFT join dept_emp as de
ON ri.emp_no = de.emp_no;

--use a left join on retirement table and dept_emp table to see 
--if they are still with PH
SELECT ri.emp_no,
	ri.first_name,
	ri.last_name,
de.to_date
--create a new table to hold info
INTO current_emp
--step to join
FROM retirement_info as ri
LEFT JOIN dept_emp as de
ON ri.emp_no = de.emp_no
--filtering the table
WHERE de.to_date = ('9999-01-01')

--7.3.4 Use count, group by and order by

--employee count by dept number
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

-- employee count by dept number using group by, count, and join
SELECT COUNT(ce.emp_no), de.dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no;

--using order by to make the output  be organized by dept no
--in ascending order
SELECT COUNT(ce.emp_no), de.dept_no
--skill drill update code to include output table
INTO retire_by_dept_no
FROM current_emp as ce
LEFT JOIN dept_emp as de
ON ce.emp_no = de.emp_no
GROUP BY de.dept_no
ORDER BY de.dept_no;

--7.3.5 creating more lists
--employee info joining employees and salaries
--check data in salaries table
SELECT * FROM salaries
ORDER BY to_date DESC;

--join salaries and emp_dept to fix salaries date with 3 joins
--step 1 filter employees into temp table
SELECT e.emp_no, 
	e.first_name, 
e.last_name, 
	e.gender,
	s.salary,
	s.to_date
--create place to save; comment out into statement to see results
--so if mistake was made can change before new table was saved
--INTO emp_info
FROM employees as e
INNER JOIN salaries as s
ON (e.emp_no = s.emp_no)
--add 3rd join
INNER JOIN dept_emp as de
ON (e.emp_no = de.emp_no)
--add filters
WHERE(birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (de.to_date = '9999-01-01');


--joining 3 more tables with the into commented out to test the join

SELECT ce.emp_no, 
ce.first_name, 
ce.last_name, 
d.dept_name
--INTO dept_info
FROM current_emp as ce
INNER join dept_emp AS de
ON (ce.emp_no = de.emp_no)
INNER JOIN departments AS d
ON(de.dept_no = d.dept_no);


--7.3.6 create taileroed lists
--skill drill create list that will return everying on the retirement in
--tailored to the sales dept; emp_no, emp_1st name, emp_last_name, emp_dpt name
--sales = d007
--1. add dept no from dept emp based on emp no
--2. add dept name from dept based on dept no

--creating the table to join the info
DROP TABLE sales_retire_info;
--re-create table with the groupby
SELECT ri.emp_no,
	   ri.first_name, 
	   ri.last_name, 
	   de.dept_no,
	   d.dept_name	   
INTO sales_retire_info
FROM retirement_info as ri
	LEFT JOIN dept_emp as de
		ON(ri.emp_no = de.emp_no)
	LEFT JOIN departments as d
		ON(de.dept_no = d.dept_no)
ORDER BY dept_no;

--need to filter for sales dept and drop dept-no column and other depts
ALTER TABLE sales_retire_info
	DROP COlUMN dept_no
	--dropped the table and recreated with dept_no
	
---create final sales table
Select emp_no, first_name, last_name, dept_name
INTO final_sales_retire_info
FROM sales_retire_info
	WHERE dept_name = 'Sales';	
-	
--create table for skill drill 2

Select emp_no, first_name, last_name, dept_name
INTO dev_sales_retire_info
FROM sales_retire_info
	WHERE dept_name IN ('Sales', 'Development');

--module complete

--change titles column name:
ALTER TABLE titles
	RENAME from_data to from_date;


















	