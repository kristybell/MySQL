# How many male and how many female managers do we have in the 'employees' database?
SELECT 
    e.gender, COUNT(dm.emp_no)
FROM
    employees e
        JOIN
    dept_manager dm ON dm.emp_no = e.emp_no
GROUP BY e.gender;