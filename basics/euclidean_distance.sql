-- Topic: Euclidean Distance in MySQL
-- Formula: distance = SQRT((x2 - x1)^2 + (y2 - y1)^2)
-- MySQL functions used: SQRT(), POW(), ABS()

-- ============================================
-- Schema Used
-- ============================================
/*
CREATE TABLE points (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    x DECIMAL(10, 4),
    y DECIMAL(10, 4)
);

INSERT INTO points (name, x, y) VALUES
('A', 0, 0),
('B', 3, 4),
('C', 6, 8),
('D', 1, 1),
('E', 5, 5);
*/

-- ============================================
-- Problem 1: Distance Between Two Fixed Points
-- ============================================
-- Find the Euclidean distance between point (0, 0) and point (3, 4)

-- Solution:
SELECT SQRT(POW(3 - 0, 2) + POW(4 - 0, 2)) AS distance;

-- Expected Output: 5.0000
-- (Classic 3-4-5 right triangle!)


-- ============================================
-- Problem 2: Distance of Each Point from Origin
-- ============================================
-- For each point in the table, calculate its distance from the origin (0, 0)

-- Solution:
SELECT 
    name,
    x,
    y,
    ROUND(SQRT(POW(x, 2) + POW(y, 2)), 4) AS distance_from_origin
FROM points
ORDER BY distance_from_origin ASC;


-- ============================================
-- Problem 3: Distance Between Every Pair of Points
-- ============================================
-- Calculate the distance between all unique pairs of points (self-join)

-- Solution:
SELECT 
    p1.name AS point1,
    p2.name AS point2,
    p1.x AS x1, p1.y AS y1,
    p2.x AS x2, p2.y AS y2,
    ROUND(SQRT(POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2)), 4) AS distance
FROM points p1
JOIN points p2 ON p1.id < p2.id  -- avoid duplicates and self-pairs
ORDER BY distance ASC;


-- ============================================
-- Problem 4: Find the Two Closest Points
-- ============================================
-- Which two points are nearest to each other?

-- Solution:
SELECT 
    p1.name AS point1,
    p2.name AS point2,
    ROUND(SQRT(POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2)), 4) AS distance
FROM points p1
JOIN points p2 ON p1.id < p2.id
ORDER BY distance ASC
LIMIT 1;


-- ============================================
-- Problem 5: Find the Two Farthest Points
-- ============================================
-- Which two points are farthest apart?

-- Solution:
SELECT 
    p1.name AS point1,
    p2.name AS point2,
    ROUND(SQRT(POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2)), 4) AS distance
FROM points p1
JOIN points p2 ON p1.id < p2.id
ORDER BY distance DESC
LIMIT 1;


-- ============================================
-- Problem 6: Points Within a Given Radius
-- ============================================
-- Find all points within distance 5 from the origin (0, 0)

-- Solution:
SELECT 
    name,
    x,
    y,
    ROUND(SQRT(POW(x, 2) + POW(y, 2)), 4) AS distance_from_origin
FROM points
WHERE SQRT(POW(x, 2) + POW(y, 2)) <= 5
ORDER BY distance_from_origin;


-- ============================================
-- Problem 7: Nearest Point to a Given Location
-- ============================================
-- Find the point nearest to location (4, 4)

-- Solution:
SELECT 
    name,
    x,
    y,
    ROUND(SQRT(POW(x - 4, 2) + POW(y - 4, 2)), 4) AS distance_to_target
FROM points
ORDER BY distance_to_target ASC
LIMIT 1;


-- ============================================
-- Problem 8: Average Distance from Origin
-- ============================================
-- What is the average Euclidean distance of all points from (0, 0)?

-- Solution:
SELECT 
    ROUND(AVG(SQRT(POW(x, 2) + POW(y, 2))), 4) AS avg_distance
FROM points;


-- ============================================
-- Problem 9: LeetCode Style - Shortest Distance in a Plane
-- ============================================
-- Table: Point2D (x INT, y INT)
-- Find the shortest distance between any two points, rounded to 2 decimal places

-- Solution:
SELECT 
    ROUND(SQRT(MIN(POW(p2.x - p1.x, 2) + POW(p2.y - p1.y, 2))), 2) AS shortest
FROM Point2D p1
JOIN Point2D p2 ON (p1.x, p1.y) <> (p2.x, p2.y);


-- ============================================
-- Problem 10: Classify Points by Distance
-- ============================================
-- Classify each point as 'Near' (< 5), 'Medium' (5-10), or 'Far' (> 10)
-- based on its distance from the origin

-- Solution:
SELECT 
    name,
    x,
    y,
    ROUND(SQRT(POW(x, 2) + POW(y, 2)), 4) AS distance,
    CASE
        WHEN SQRT(POW(x, 2) + POW(y, 2)) < 5  THEN 'Near'
        WHEN SQRT(POW(x, 2) + POW(y, 2)) <= 10 THEN 'Medium'
        ELSE 'Far'
    END AS zone
FROM points
ORDER BY distance;


-- Key Points:
-- 1. SQRT(POW(x2-x1, 2) + POW(y2-y1, 2)) is the core formula
-- 2. Use ROUND() to limit decimal places
-- 3. Self-join (p1.id < p2.id) is used to avoid duplicate pairs
-- 4. Can be combined with LIMIT for nearest/farthest queries
-- 5. CASE + distance = classify points into zones (geo-filtering)


-- ============================================
-- HackerRank Problem: Weather Observation Station 18
-- ============================================
-- Source: HackerRank SQL Advanced (Weather Observation Station 18)
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-18
--
-- Table: STATION
-- Columns: ID, CITY, STATE, LAT_N, LONG_W
--
-- Problem:
-- Consider P1(a, c) and P2(b, d) to be two points on a 2D plane where
-- (a, c) is the minimum LAT_N and LONG_W, and
-- (b, d) is the maximum LAT_N and LONG_W.
-- Query the Manhattan Distance (|a - b| + |c - d|) rounded to 4 decimal places.

-- Solution (Manhattan Distance):
SELECT ROUND(ABS(MIN(LAT_N) - MAX(LAT_N)) + ABS(MIN(LONG_W) - MAX(LONG_W)), 4)
FROM STATION;


-- ============================================
-- HackerRank Problem: Weather Observation Station 19
-- ============================================
-- Source: HackerRank SQL Advanced (Weather Observation Station 19)
-- Link: https://www.hackerrank.com/challenges/weather-observation-station-19
--
-- Problem:
-- Same P1(a, c) and P2(b, d) as above.
-- Query the EUCLIDEAN distance between P1 and P2, rounded to 4 decimal places.
-- This is the more advanced version of Station 18 (Euclidean instead of Manhattan)

-- Solution (Euclidean Distance - the one you did!):
SELECT ROUND(SQRT(POW(MAX(LAT_N) - MIN(LAT_N), 2) + POW(MAX(LONG_W) - MIN(LONG_W), 2)), 4)
FROM STATION;

-- Breakdown:
-- MIN(LAT_N)  → x1 (smallest latitude)
-- MAX(LAT_N)  → x2 (largest latitude)
-- MIN(LONG_W) → y1 (smallest longitude)
-- MAX(LONG_W) → y2 (largest longitude)
-- SQRT((x2-x1)^2 + (y2-y1)^2) → classic Euclidean formula
-- ROUND(..., 4) → 4 decimal places as required

-- Key Difference:
-- Station 18 → Manhattan Distance  = |a-b| + |c-d|    (add absolute differences)
-- Station 19 → Euclidean Distance  = SQRT((a-b)^2 + (c-d)^2) (Pythagoras theorem)
