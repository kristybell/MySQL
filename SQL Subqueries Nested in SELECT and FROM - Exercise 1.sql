# Starting the code with "DROP TABLE",create a table called "emp_manager"
# (emp_no - integer of 11, not null; dept_no - CHAR of 4, null; manager_no - integer of 11, not null)
# Then fill 'emp_manager' with data about employees, the number of the department they are
# work in , and their manager.
# Assign employee number 110022 as a manager to all employees from 10001 to 10020,
# and employee number 110039 as a manager to all employees from 10021 to 10040. 
# Assign employee number 110039 as manager to employee 110022.
# Then do the opposite and assign employee 110022 as manager to employee 110039.

# How to tackle the problem:
# Subset A --> employees from 10001 to 10020
# Subset B --> employees from 10021 to 10040
# Subset C --> employee 110022
# Subset D --> employee 110039

DROP TABLE IF EXISTS emp_manager;

CREATE TABLE emp_manager
(
	emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    manager_no INT(11) NOT NULL
);

INSERT INTO emp_manager
SELECT 
    U.*
FROM
    (SELECT 
        A.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no <= 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no) AS a UNION SELECT 
        B.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no > 10020
    GROUP BY e.emp_no
    ORDER BY e.emp_no
    LIMIT 20) AS B UNION SELECT 
        C.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110039) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110022
    GROUP BY e.emp_no) AS C UNION SELECT 
        D.*
    FROM
        (SELECT 
        e.emp_no AS employee_ID,
            MIN(de.dept_no) AS department_code,
            (SELECT 
                    emp_no
                FROM
                    dept_manager
                WHERE
                    emp_no = 110022) AS manager_ID
    FROM
        employees e
    JOIN dept_emp de ON e.emp_no = de.emp_no
    WHERE
        e.emp_no = 110039
    GROUP BY e.emp_no) AS D) AS U;
