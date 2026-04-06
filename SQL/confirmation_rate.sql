ITH d1 AS (

    SELECT s.user_id
    ,ROUND(COUNT(CASE WHEN c.action = 'confirmed' THEN c.user_id END) / COUNT(*), 2) AS confirmation_rate
    FROM signups s
    LEFT JOIN confirmations c
    ON s.user_id = c.user_id
    GROUP BY s.user_id



)

SELECT * 
FROM d1;
