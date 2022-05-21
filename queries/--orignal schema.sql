--orignal schema


--creating tables for PH-EmployeeDB - department
CREATE TABLE departments (
	dept_no VARCHAR(4) NOT NULL,
	dept_name VARCHAR(40) NOT NULL,
	PRIMARY KEY(dept_no),
	UNIQUE(dept_name)
);

--Delete table for PH-EmployeeDB - Employees to change the input
DROP Table employees;

DROP 

CREATE TABLE employees (
	emp_no INT NOT NULL, 
	birth_date DATE NOT NULL, 
	first_Name VARCHAR(40) NOT NULL,
	Last_Name VARCHAR(40) NOT NULL,
	gender VARCHAR(7) NOT NULL,
	hire_date DATE NOT NULL,
	PRIMARY KEY (emp_no)
);

--Create dept manager table
CREATE TABLE dept_manager (
dept_no VARCHAR(4) NOT NULL,
    emp_no INT NOT NULL,
    from_date DATE NOT NULL,
    to_date DATE NOT NULL,
FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
    PRIMARY KEY (emp_no, dept_no)
);

--create salary table
CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

--create title table
CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_data DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	PRIMARY KEY (emp_no)
);

DROP TABLE titles CASCADE;

DROP TABLE titles CASCADE;

CREATE TABLE titles (
	emp_no INT NOT NULL,
	title VARCHAR(50) NOT NULL,
	from_data DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no)
);
--removed PK because it would not import due to dupes
ALTER TABLE titles
RENAME COLUMN from_data to from_date


--create dept_employee table
CREATE Table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(4) NOT NULL,
	from_data DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no)
);

SELECT * FROM departments;