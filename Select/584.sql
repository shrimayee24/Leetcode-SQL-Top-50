-- Problem #584: Find customers who either have no referee or their referee is not 2
SELECT name 
FROM Customer 
WHERE referee_id IS NULL 
   OR referee_id != 2;
