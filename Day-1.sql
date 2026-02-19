-- DAY - 1:

-- TASK - 1: Find The Employees Who Earn More Than The Average Salary Of All Employees:

-- 1. Fetch All Records:
SELECT * FROM Employees;

-- 2. Using Sub-Query:
SELECT
	Employee_ID,
    Employee_Name,
    Salary
FROM Employees
WHERE Salary > (
	SELECT
		AVG(Salary) AS Emp_Avg_Salary
	FROM Employees
);

-- 3. Using CTE:
WITH AVG_EMP_SALARY AS (
	SELECT
		Employee_ID,
        Employee_Name,
        Salary,
        AVG(Salary) OVER () AS Avg_Salary
	FROM Employees
)
SELECT
	Employee_ID,
	Employee_Name,
	Salary
FROM AVG_EMP_SALARY
WHERE Salary > Avg_Salary;
	