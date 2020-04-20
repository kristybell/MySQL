# Select ten records from the "titles" table to get a better idea about its content.
# Then, in the same table, insert information about employee number 999903. 
# State that he/she is a "Senior Engineer", who has started working in this position
# on October 1st 1997 until April 18 2020.
# At the end, sort the records from the "titles" table in descending order to check that
# it has successfully inserted the new record.

INSERT INTO titles
VALUES 
(
	'999903',
    'Senior Engineer',
    '1997-10-01',
    '2020-04-18'
 );   

SELECT 
    *
FROM
    titles
ORDER BY emp_no DESC
LIMIT 10;