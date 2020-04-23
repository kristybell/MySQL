# Create a stored procedure that whenever applied, it returns the first 1,000 rows from 
# the 'employees' table
USE employees;

DROP PROCEDURE IF EXISTS select_employees;

DELIMITER $$
CREATE PROCEDURE select_employees()
BEGIN
SELECT * FROM employees
LIMIT 1000;

END$$

DELIMITER ;

CALL select_employees();