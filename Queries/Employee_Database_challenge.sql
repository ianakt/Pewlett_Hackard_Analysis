SELECT em.emp_no, em.first_name, em.last_name, ti.title, ti.from_date, ti.to_date
INTO retirement_titles
FROM employees as em
RIGHT JOIN titles as ti
ON (em.emp_no = ti.emp_no)
WHERE (em.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY(em.emp_no)


-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (rt.emp_no) rt.emp_no, rt.first_name, rt.last_name, rt.title
INTO unique_titles
FROM retirement_titles as rt
WHERE rt.to_date = ('9999-01-01')
ORDER BY  rt.emp_no ASC, rt.to_date DESC

SELECT COUNT(ut.title), ut.title
INTO retiring_titles
FROM unique_titles AS ut GROUP BY ut.title
ORDER BY COUNT(ut.title) DESC


SELECT DISTINCT ON (em.emp_no) em.emp_no, em.first_name, em.last_name, em.birth_date, demp.from_date, demp.to_date, ti.title
INTO mentorship_eligibilty
FROM employees as em
LEFT JOIN dept_emp AS demp
ON (em.emp_no = demp.emp_no)
LEFT JOIN titles AS ti
ON (em.emp_no = ti.emp_no)
WHERE demp.to_date = ('9999-01-01') AND (em.birth_date BETWEEN '1965-01-01 ' AND '1965-12-31')
ORDER BY (em.emp_no)