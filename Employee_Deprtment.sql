CREATE DATABASE EMPLOYEE_DEPARTMENT;
USE EMPLOYEE_DEPARTMENT;

CREATE TABLE Departments (
    dept_id   INTEGER PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    emp_id   INTEGER PRIMARY KEY,
    name     VARCHAR(50) NOT NULL,
    salary   DECIMAL(10,2),
    dept_id  INTEGER,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

INSERT INTO Departments (dept_id, dept_name) VALUES
(1, 'HR'),
(2, 'IT'),
(3, 'Finance');

INSERT INTO Employees (emp_id, name, salary, dept_id) VALUES
(1, 'Priya', 50000, 1),
(2, 'Raj', 60000, 2),
(3, 'Anjali', 55000, 1),
(4, 'Kiran', 45000, 3);


-- (a) Simple View: only employee names & salaries
CREATE VIEW emp_salaries AS
SELECT name, salary
FROM Employees;

-- (b) Complex View with Join: employees + departments
CREATE VIEW emp_with_dept AS
SELECT e.emp_id, e.name, e.salary, d.dept_name
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id;

-- (c) Aggregation View: average salary by department
CREATE VIEW avg_salary_by_dept AS
SELECT d.dept_name, AVG(e.salary) AS avg_salary
FROM Employees e
JOIN Departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;

-- Simple View Usage
SELECT * FROM emp_salaries;

-- Complex View Usage
SELECT * FROM emp_with_dept WHERE dept_name = 'IT';

-- Aggregation View Usage
SELECT * FROM avg_salary_by_dept;

-- ========================================
-- 5. Updating Data via View (only works if view is simple)
-- ========================================

UPDATE emp_salaries
SET salary = 52000
WHERE name = 'Priya';

-- Check changes
SELECT * FROM Employees;
