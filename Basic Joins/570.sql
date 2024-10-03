#create a table of count which is>=5 of manager ids 
#join table to count table based on id and manager id field
#select name column and print it

SELECT Name FROM Employee AS t1
JOIN(
    SELECT 
    managerId
FROM 
    Employee
GROUP BY managerId
HAVING COUNT(managerId) >= 5

) AS t2 ON t1.id=t2.managerId
