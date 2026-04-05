-- Write your PostgreSQL query statement below
WITH d1 AS (

SELECT * , STRING_TO_ARRAY(LOWER(content_text), ' ') AS ct
FROM user_content

), d2 AS(


SELECT *, UNNEST(ct) AS raw_col
FROM d1


), d3 AS (

    SELECT * , 
               CASE
           WHEN raw_col ~ '^[A-Za-z]+(-[A-Za-z]+)+$'
           THEN ARRAY_TO_STRING(
                    ARRAY(
                        SELECT UPPER(LEFT(part, 1)) || LOWER(SUBSTRING(part FROM 2))
                        FROM UNNEST(STRING_TO_ARRAY(LOWER(raw_col), '-')) AS part
                    ),
                    '-'
                )
           WHEN raw_col ~ '^[A-Za-z]'
           THEN UPPER(LEFT(LOWER(raw_col), 1)) || SUBSTRING(LOWER(raw_col) FROM 2)
           ELSE LOWER(raw_col)
       END AS cap
    FROM d2




)
SELECT content_id, content_text AS original_text, STRING_AGG(cap, ' ') AS converted_text
FROM d3
GROUP BY content_id, content_text
ORDER BY content_id
 ;
