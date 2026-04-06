# Write your MySQL query statement below
with d1 AS (

SELECT *
FROM employee


), d2 AS (

    SELECT d1.id, d1.name, COUNT(DISTINCT e.id ) AS cnt
    FROM employee e
    INNER JOIN d1 
    ON e.managerid = d1.id
    GROUP BY d1.name, d1.id


)
SELECT name 
FROM d2
WHERE cnt >= 5 ;
