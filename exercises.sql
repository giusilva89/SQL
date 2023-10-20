-- Write a query against the professors table that can output the following in the result: "Chong works in the Science department"
-- For all professors
SELECT last_name || ' ' || 'works in the' || ' ' || department || ' ' || 'department' as "sentence_column"
FROM professors;

-- For Chong
SELECT last_name || ' ' || 'works in the' || ' ' || department || ' ' || 'department' as "sentence_column"
FROM professors
WHERE last_name = 'Chong';


-- Write a SQL query against the professors table that would return the following result:

-- "It is false that professor Chong is highly paid"
-- "It is true that professor Brown is highly paid"
-- "It is false that professor Jones is highly paid"
-- "It is true that professor Wilson is highly paid"
-- "It is false that professor Miller is highly paid"
-- "It is true that professor Williams is highly paid"

-- NOTE: A professor is highly paid if they make greater than 95000.

-- First approach
SELECT 
  CASE 
    WHEN salary >= 95000 THEN 'It is true that professor ' || last_name || ' is highly paid'
    ELSE 'It is false that professor ' || last_name || ' is highly paid'
  END AS statement
FROM professors;

-- Second approach
SELECT 'It is ' || (salary > 95000) ||

' that professor ' || last_name || ' is highly paid'

FROM professors;

-- Write a query that returns all of the records and columns from the professors table but shortens the department names to only the first three characters in upper case.

SELECT last_name, UPPER(SUBSTRING(department FROM 1 FOR 3)), salary, hire_date 
FROM professors;

-- Write a query that returns the highest and lowest salary from the professors table excluding the professor named 'Wilson'.

SELECT MAX(salary), MIN(salary) 
FROM professors
WHERE last_name != 'Wilson';

-- Write a query that will display the hire date of the professor that has been teaching the longest.

SELECT MIN(hire_date) 
FROM professors;
