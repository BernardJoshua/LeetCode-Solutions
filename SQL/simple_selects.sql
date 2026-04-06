# Big Countries
SELECT name, population, `area`
FROM world
WHERE `area` >= 3000000 or population >= 25000000;

# Article Views I
SELECT DISTINCT author_id AS id
FROM views
WHERE author_id = viewer_id
GROUP BY author_id
HAVING COUNT(*) >= 1
ORDER BY author_id ASC;

# Invalid Tweets
SELECT tweet_id
FROM tweets 
WHERE LENGTH(content) > 15;
