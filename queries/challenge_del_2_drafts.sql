--Deliverable 2:

--create new table
SELECT ti.emp_no,	  
	   e.first_name,
	   e.last_name,
	   e.birth_date,
	   de.from_date, 
	   de.to_date, 
	   ti.title
	  
INTO test
FROM titles as ti
	LEFT JOIN employees as e
		ON (e.emp_no = ti.emp_no)
	INNER JOIN dept_emp as de
		ON (e.emp_no = de.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (de.to_date = '9999-01-01')
ORDER BY title;

--check table
SELECT * FROM mentor_table;

SELECT DISTINCT ON (emp_no) emp_no,
				 first_name,last_name, birth_date, 
				 from_date, to_date, title
--INTO mentorship_eligibilty
FROM test
WHERE to_date = '9999-01-01'
ORDER BY emp_no;


--problem is employee 12155, he comes up as sr engineer as opposed to engineer
--need to fig out syntax to make him engineer