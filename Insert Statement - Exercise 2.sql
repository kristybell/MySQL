# Insert information about the individual with employee number 999903
# into the "dept_emp" table. He/She is working for department number 5,
# an has started work on October 1st 1997; her/his contract is for an 
# indefinite period of time

INSERT INTO dept_emp
VALUES
(
	 999903,
     'd005',
     '1997-10-01',
     '9999-01-01'
); 

SELECT 
    *
FROM
    dept_emp
ORDER BY emp_no DESC
LIMIT 10;