-- Text
SELECT 'This is test data' as "text_data";

-- Extract part of a string
-- FROM STARTING POSITION; FOR NUMBER OF CHARACTERS
SELECT SUBSTRING('This is test data' FROM 1 FOR 4);

SELECT SUBSTRING('This is test data' FROM 9 FOR 4);

SELECT SUBSTRING('This is test data' FROM 3);

-- REPLACE
SELECT department, REPLACE(department, 'Clothing', 'Attire') as "modified_data"
FROM departments;

-- Column that show Deparment name + "department"
SELECT department, 
REPLACE(department, 'Clothing', 'Attire') as "modified_data",
department ||' ' || 'Department' as "department_modified"
FROM departments;

-- Position: Find the email domain (+1 to only pick out domains)
SELECT email, SUBSTRING(email, POSITION('@' IN email) + 1) as "domain"
FROM employees;

-- COALESCE: replace missing data with something else 
-- Function useful when aggregating data
SELECT COALESCE(email, 'NONE') AS "email"
FROM employees;
