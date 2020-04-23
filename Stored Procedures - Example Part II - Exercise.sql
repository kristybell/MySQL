# Create a procedure that will provide the average salary of all employees.
# Then, call the procedure.
USE employees;

DROP PROCEDURE IF EXISTS avg_employee_salary;

DELIMITER $$
CREATE PROCEDURE avg_employee_salary()
BEGIN
SELECT AVG(salary) FROM salaries
LIMIT 1000;

END$$

DELIMITER ;

CALL avg_employee_salary();