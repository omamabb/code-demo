USE college;

DROP TABLE IF EXISTS office;

CREATE TABLE office(
    id INT PRIMARY KEY,
    name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2),
    join_date DATE
);

INSERT INTO office (id, name, department, salary, join_date) VALUES
(1, 'Rahim', 'HR', 50000, '2023-01-10'),
(2, 'Karim', 'IT', 75000, '2022-12-01'),
(3, 'Fatema', 'Finance', 80000, '2023-03-15'),
(4, 'Sakib', 'IT', 60000, '2022-11-20'),
(5, 'Taslima', 'HR', 55000, '2023-02-05'),
(6, 'Rony', 'Finance', 70000, '2022-10-30'),
(7, 'Jannat', 'IT', 65000, '2023-01-25'),
(8, 'Arif', 'Finance', 90000, '2023-04-01'),
(9, 'Nabila', 'HR', 48000, '2023-03-10'),
(10, 'Rashed', 'IT', 72000, '2022-12-15');
SHOW tables;
SELECT * FROM office;
-- Employee with highest salary
SELECT name, salary
FROM office
WHERE salary = (
    SELECT MAX(salary) FROM office
);
-- Employees with salary above average
SELECT name, salary
FROM office
WHERE salary > (
    SELECT AVG(salary) FROM office
);
-- Employees earning less than the highest salary in IT department
SELECT name, salary
FROM office
WHERE salary < (
    SELECT MAX(salary) 
    FROM office
    WHERE department = 'IT'
);
--Employee(s) in Finance whose salary equals 
-- the average salary of Finance department 
SELECT name, salary
FROM office
WHERE department = 'Finance'
AND salary = (
    SELECT AVG(salary) 
    FROM office
    WHERE department = 'Finance'
);
-- Employee(s) who earn more than all
--  HR department employees
SELECT name, salary
FROM office
WHERE salary > ALL (
    SELECT salary FROM office WHERE department = 'HR'
);
-- Employee(s)
--  who earn the second highest salary
SELECT name, salary
FROM office
WHERE salary = (
    SELECT MAX(salary) 
    FROM office
    WHERE salary < (SELECT MAX(salary) FROM office)
);
-- Suppose HR salaries: 50000, 55000, NULL
SELECT salary FROM office WHERE department = 'HR';
-- returns: 50000, 55000, NULL

-- Now
SELECT name FROM office 
WHERE department='IT' 
AND salary NOT IN (50000, 55000, NULL);
-- use mot exists
SELECT o1.name, o1.salary
FROM office o1
WHERE o1.department='IT'
AND NOT EXISTS (
    SELECT 1 
    FROM office o2
    WHERE o2.department='HR' 
    AND o2.salary = o1.salary
);







