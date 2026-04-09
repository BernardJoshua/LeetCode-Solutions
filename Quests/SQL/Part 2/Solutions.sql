-- 1. Customer with the largest number of orders 

SELECT customer_number
FROM (
    SELECT customer_number, COUNT(DISTINCT order_number) AS o
    FROM orders
    GROUP BY customer_number
    ORDER BY o DESC 
    LIMIT 1

) t;

-- 2. Classes with Atleast 5 students.

SELECT class
FROM courses 
GROUP BY class
HAVING COUNT(DISTINCT student) >= 5;


-- 3. Monthly Transactions I
SELECT LEFT(trans_date, 7) AS `month` 
      , country
      , COUNT(DISTINCT id) AS trans_count
      , COALESCE(COUNT(DISTINCT CASE WHEN state = 'approved' THEN id END),0) AS approved_count
      , SUM(amount) AS trans_total_amount
      , COALESCE(SUM(CASE WHEN state = 'approved' THEN amount END),0) AS approved_total_amount
FROM transactions
GROUP BY `month`, country;


-- 4. User Activity for The Past 30 Days

SELECT activity_date AS `day`, COUNT(DISTINCT user_id) AS active_users
FROM activity
WHERE  activity_date  BETWEEN DATE_SUB('2019-07-27', INTERVAL 29 DAY) AND '2019-07-27'
GROUP BY activity_date;
