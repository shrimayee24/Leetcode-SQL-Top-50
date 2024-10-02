-- 2.Basic Joins

-- Problem #1378: Left join Employees with EmployeeUNI on their id


-- Problem #1068: Join Sales and Product to retrieve product name, year, and price


-- Problem #1581: Count number of visits without a transaction per customer


-- Problem #197: Find weather records where temperature is higher than the previous day


--Problem #1661: Average Time of Process per Machine
SELECT s.machine_id,round(avg(e.timestamp-s.timestamp),3) AS processing_time
FROM Activity s JOIN Activity e ON
    s.machine_id = e.machine_id AND s.process_id = e.process_id AND
    s.activity_type = 'start' AND e.activity_type = 'end'
    GROUP BY s.machine_id

--Problem #577: Employee Bonus
# Write your MySQL query statement below
SELECT e.name,b.bonus 
FROM Employee e
LEFT JOIN Bonus b ON e.empId=b.empId 
WHERE b.bonus<1000 OR b.bonus IS NULL

