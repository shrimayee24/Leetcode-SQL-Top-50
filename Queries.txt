--1.Select

-- Problem #1537: Find products that are both low fat and recyclable
SELECT product_id 
FROM Products 
WHERE low_fats = 'Y' 
  AND recyclable = 'Y';

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

-- 2.Basic Joins

-- Problem #1378: Left join Employees with EmployeeUNI on their id
SELECT EU.unique_id, E.name 
FROM Employees E
LEFT JOIN EmployeeUNI EU 
  ON EU.id = E.id;

-- Problem #1068: Join Sales and Product to retrieve product name, year, and price
SELECT P.product_name, S.year, S.price 
FROM Sales AS S
JOIN Product AS P 
  ON S.product_id = P.product_id;

-- Problem #1581: Count number of visits without a transaction per customer
SELECT v.customer_id, COUNT(v.visit_id) AS count_no_trans 
FROM Visits v
LEFT JOIN Transactions t 
  ON t.visit_id = v.visit_id 
WHERE t.transaction_id IS NULL
GROUP BY v.customer_id;

-- Problem #197: Find weather records where temperature is higher than the previous day
SELECT w1.id 
FROM Weather w1
JOIN Weather w2 
  ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;

