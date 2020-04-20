# Join the 'employees' and the 'dept_manager' tables to return a subset of all the employees 
# whose last name is Markovitch. See if the output contains a manager with that name.
# Order by 'dept_no' descending, and then by 'emp_no'.

SELECT 
    dm.dept_no, e.emp_no, e.first_name, e.last_name, dm.from_date
FROM
    dept_manager dm
        LEFT JOIN
	employees e ON dm.emp_no = e.emp_no
    WHERE last_name = 'Markovitch' 
ORDER BY dm.dept_no DESC, e.emp_no;