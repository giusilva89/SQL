-- Upper Case & Lower Case Example
SELECT UPPER (first_name), LOWER(department) 
FROM employees;

-- Length of characteres
SELECT LENGTH(first_name), LENGTH(department) 
FROM employees;

-- Nested Text Functions: Inside executes first.
SELECT LENGTH(TRIM('        HELLO      '));
			  
-- Concatenation
SELECT first_name || last_name
FROM employees;

