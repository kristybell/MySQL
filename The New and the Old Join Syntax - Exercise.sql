# Extract a list containing information about all managers' employee number, first and last name, 
# department number, and hire date. Use the old type of join syntax to obtain the result.

# OLD SYNTAX
SELECT 
    dm.dept_no, e.emp_no, e.first_name, e.last_name, e.hire_date
FROM
    dept_manager_dup dm,
    employees e
WHERE
    dm.emp_no = e.emp_no
ORDER BY dm.dept_no;


# NEW SYNTAX
SELECT 
    dm.dept_no, e.emp_no, e.first_name, e.last_name, e.hire_date
FROM
    dept_manager_dup dm
    JOIN
    employees e ON dm.emp_no = e.emp_no
ORDER BY dm.dept_no;