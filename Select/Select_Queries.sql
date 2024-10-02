--Select



-- Problem #584: Find customers who either have no referee or their referee is not 2
SELECT name 
FROM Customer 
WHERE referee_id IS NULL 
   OR referee_id != 2;

-- Problem #595: Retrieve countries with area >= 3,000,000 or population >= 25,000,000
SELECT name, population, area 
FROM World 
WHERE area >= 3000000 
   OR population >= 25000000;

-- Problem #1148: Find authors who have viewed their own articles
SELECT DISTINCT author_id AS 'id' 
FROM Views 
WHERE author_id = viewer_id 
ORDER BY author_id;

-- Problem #1683: Retrieve tweets where content length is greater than 15
SELECT tweet_id 
FROM tweets 
WHERE LENGTH(content) > 15;
