-- Problem #197: Find weather records where temperature is higher than the previous day
SELECT w1.id 
FROM Weather w1
JOIN Weather w2 
  ON w1.recordDate = DATE_ADD(w2.recordDate, INTERVAL 1 DAY)
WHERE w1.temperature > w2.temperature;
