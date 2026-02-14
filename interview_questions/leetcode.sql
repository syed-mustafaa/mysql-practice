-- Problem:
-- Find the second highest salary

-- Schema:
/*
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    salary INT
);
*/

-- Solution 1: Using LIMIT with OFFSET
SELECT DISTINCT salary AS SecondHighestSalary
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- Solution 2: Using subquery
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- Solution 3: Handling NULL case (if no second highest)
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

-- Expected Output:
-- Returns the second highest salary value
-- Returns NULL if there's no second highest (only 1 distinct salary)

-------------------------------------------

-- Problem:
-- Find employees earning more than their managers

-- Schema:
/*
CREATE TABLE Employee (
    id INT PRIMARY KEY,
    name VARCHAR(100),
    salary INT,
    managerId INT
);
*/

-- Solution:
SELECT 
    e.name AS Employee
FROM Employee e
INNER JOIN Employee m ON e.managerId = m.id
WHERE e.salary > m.salary;

-- Expected Output:
-- List of employee names who earn more than their direct manager

-------------------------------------------

-- Problem:
-- Find duplicate emails

-- Schema:
/*
CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);
*/

-- Solution 1: Using GROUP BY and HAVING
SELECT email
FROM Person
GROUP BY email
HAVING COUNT(*) > 1;

-- Solution 2: Using self-join
SELECT DISTINCT p1.email
FROM Person p1
INNER JOIN Person p2 
    ON p1.email = p2.email 
    AND p1.id != p2.id;

-- Expected Output:
-- List of email addresses that appear more than once

-------------------------------------------

-- Problem:
-- Delete duplicate emails, keeping the one with smallest id

-- Schema:
/*
CREATE TABLE Person (
    id INT PRIMARY KEY,
    email VARCHAR(100)
);
*/

-- Solution:
DELETE p1 FROM Person p1
INNER JOIN Person p2 
WHERE p1.email = p2.email 
  AND p1.id > p2.id;

-- Expected Output:
-- Removes duplicate records, keeps only the first occurrence (lowest id)
