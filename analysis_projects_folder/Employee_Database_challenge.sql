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

--DELIVERABLE 2

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

--PLEASE NOTE:

--I experienced difficulty in running the query for deliverable 2 since my results in the “title” column 
--would differ from the example in the protocol for one or two employees on each run.  I spent over an hour 
--working with a learning assistant (ask-150923) who confirmed that my query and table schemas were correct.  
--The LA suggested that the example CSV provided in the protocol may be incorrect because the current 
--job title (per the “Title” CSV) for the employee in row 8 is Sr. Engineer, however, the example shows 
--that employee’s job title as Engineer.

--I continued to play around with the query and finally received the same result as the example in the protocol 
--by using the employee number from the “Titles” table as my “distinct on” filter.  However, on subsequent runs 
--of that query I noticed that it also returned results that were inconsistent with the example. 



--SUGGESTED FUTURE QUERIES AS DISCUSSED IN THE README ANALYSIS:

--SUGGESTION 1) CREATE A MENTORSHIP TABLE SIMILAR TO THE RETIRING TITLES TABLE
SELECT COUNT(mt.title), mt.title
INTO mentorship_titles
FROM mentorship as mt
GROUP BY title
ORDER BY COUNT DESC;

--SUGGESTION 2) drill down on the retiring_titles information:

--2A) create table that shows unique title and dept no.
SELECT ut.emp_no, 
	   ut.first_name,
	   ut.last_name,
	   ut.title, 
	   de.dept_no
INTO drill_down
	FROM unique_titles as ut
	INNER JOIN dept_emp as de
	ON (ut.emp_no = de.emp_no)
ORDER BY emp_no;

--2B) count of unique titles and dept number

SELECT COUNT(dd.dept_no), dd.title, dd.dept_no
INTO drill_count_2
FROM drill_down as dd
GROUP BY dept_no, title
ORDER BY COUNT DESC;



