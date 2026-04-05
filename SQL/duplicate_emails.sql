# Write your MySQL query statement below
WITH d1 AS (
SELECT email, COUNT(DISTINCT id) AS total_ids
FROM person 
GROUP BY email
)

SELECT email
FROM d1
WHERE total_ids > 1;
