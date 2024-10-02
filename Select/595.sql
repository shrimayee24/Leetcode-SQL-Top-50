-- Problem #595: Retrieve countries with area >= 3,000,000 or population >= 25,000,000
SELECT name, population, area 
FROM World 
WHERE area >= 3000000 
   OR population >= 25000000;
