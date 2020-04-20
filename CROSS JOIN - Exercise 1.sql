# Use a CROSS JOIN to return a list with all possible combinations between managers 
# from the 'dept_manager' table and department number 9.
SELECT
	dm.*, d.*
FROM
    departments d	
	CROSS JOIN
    dept_manager dm
WHERE
	d.dept_no = 'd009'
ORDER BY dm.emp_no, d.dept_no;