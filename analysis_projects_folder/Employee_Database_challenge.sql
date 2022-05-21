--DELIVERABLE 1:

--step 1 join employees with titles based on emp_no

SELECT e.emp_no, 
	   e.first_name,
	   e.last_name,
	   ti.title, 
	   ti.from_date, 
	   ti.to_date
INTO retirement_titles
	FROM titles as ti
	INNER JOIN employees as e
	ON (ti.emp_no = e.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;


--Check table, 133,776 rows
SELECT * FROM retirement_titles;

-- step 2 Use Dictinct with Orderby to remove duplicate rows
--& create the unique titles csv

SELECT DISTINCT ON (emp_no) emp_no,
				first_name,last_name, title
	INTO unique_titles
	FROM retirement_titles
	WHERE to_date = '9999-01-01'
	ORDER BY emp_no;
	
--check table
SELECT * FROM unique_titles;

--step 3 create the retiring titles csv

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title
ORDER BY COUNT DESC;

--check table
SELECT * FROM retiring_titles;

--Deliverable 2

SELECT DISTINCT ON (ti.emp_no) e.emp_no,
  e.first_name,
  e.last_name,
  e.birth_date,
  de.from_date,
  de.to_date,
  ti.title
INTO mentorship
FROM employees as e
INNER JOIN dept_emp as de
  ON (e.emp_no = de.emp_no)
INNER JOIN titles as ti
  ON (e.emp_no = ti.emp_no)
WHERE (de.to_date = '9999-01-01')
AND (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY ti.emp_no;

SELECT * FROM mentorship
