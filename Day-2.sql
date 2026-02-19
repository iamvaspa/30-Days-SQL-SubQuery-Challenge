-- DAY - 2:

-- 1. Create a SQ_Students Table:
CREATE TABLE SQ_Students (
	Student_ID INT PRIMARY KEY,
    First_Name VARCHAR(100),
    Last_Name VARCHAR(100),
    Score INT
);

-- 2. Insert a Records Into a Table SQ_Students:
INSERT INTO SQ_Students (Student_ID, First_Name, Last_Name, Score) VALUES
(1, 'Aarav', 'Sharma', 85),
(2, 'Priya', 'Verma', 72),
(3, 'Rohan', 'Mehta', 90),
(4, 'Neha', 'Singh', 60),
(5, 'Karan', 'Patel', 78),
(6, 'Ananya', 'Iyer', 88),
(7, 'Vikram', 'Rao', 95),
(8, 'Sneha', 'Gupta', 70);

-- 3. Fetch All Records:
SELECT * FROM SQ_Students;

-- TASK-1 : Using SQL SubQuery Find Students Who Scored Above The Class Average:

-- SOLUTION:

SELECT
	Student_ID,
    First_Name,
    Last_Name,
    Score
FROM SQ_Students
WHERE Score > (
				SELECT
					AVG(Score) AS Class_Average
				FROM SQ_Students
);

-- TASK-2 : Using CTE Find Students Who Scored Above The Class Average:

-- SOLUTION:

WITH Class_Average AS (
	SELECT
		Student_ID,
        First_Name,
        Last_Name,
        Score,
		AVG(Score) OVER () AS Class_Average
	FROM SQ_Students
)
SELECT
	Student_ID,
        First_Name,
        Last_Name,
        Score
FROM Class_Average
WHERE Score > Class_Average;