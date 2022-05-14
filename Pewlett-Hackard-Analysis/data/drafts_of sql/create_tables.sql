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

