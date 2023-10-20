-- Where Clause and Operators
SELECT first_name, email FROM employees
WHERE salary > 110000 
AND gender = 'F'
AND department = 'Tools';

SELECT first_name, hire_date, department FROM employees
WHERE salary > 165000
OR (department = 'Sports'AND gender = 'F');


SELECT first_name, hire_date FROM employees
WHERE hire_date BETWEEN '2002-01-01' AND '2004-01-01';

SELECT * FROM employees
WHERE salary > 40000 AND salary < 100000
AND department = 'Automotive'
AND gender = 'M' 
OR (gender = 'F' and department = 'Toys');