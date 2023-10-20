-- Upper Case & Lower Case Example
SELECT UPPER (first_name), LOWER(department) 
FROM employees;

-- Length of characteres
SELECT LENGTH(first_name), LENGTH(department) 
FROM employees;

-- ext Functions
SELECT LENGTH(TRIM('        HELLO      '));
			  
-- Create a new column through Concatenation
SELECT first_name || ' ' || last_name as "full_name", department
FROM employees;


-- Create a new columns using boolean expression (salary 140000 : true or false)
SELECT first_name || ' ' || last_name as "full_name", (salary > 140000)
FROM employees;

-- Display all the true values on the top
SELECT first_name || ' ' || last_name as "full_name", (salary > 140000) as is_true
FROM employees
ORDER BY is_true DESC;

-- Another example of boolean expression
SELECT department, ('Clothing' IN ('clothing', 'furniture', 'phones')) as is_true
FROM employees;


SELECT department, (department LIKE '%oth%')
FROM employees;
