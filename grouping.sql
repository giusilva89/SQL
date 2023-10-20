-- Grouping Functions: Single value
SELECT MAX(salary) as "max_salary"
FROM employees;

SELECT MIN(salary) as "min_salary"
FROM employees;

SELECT ROUND(AVG(salary)) as "average_salary"
FROM employees;

SELECT COUNT(salary) "salary_count"
FROM employees;

SELECT COUNT(email) as "email_count"
FROM employees;

SELECT COUNT(*) as "employee_count"
FROM employees;

SELECT SUM(salary) as "total_salary"
FROM employees;

SELECT SUM(salary) as "clothing_salary"
FROM employees
WHERE department = 'Clothing' 

