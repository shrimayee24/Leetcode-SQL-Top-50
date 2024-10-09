#first select all unique numbers
#then select the maximum number out of them
SELECT MAX(num) AS num 
FROM
(
SELECT num FROM MyNumbers 
GROUP BY num HAVING COUNT(num)=1) AS t
