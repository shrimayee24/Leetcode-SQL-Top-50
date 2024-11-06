#sum up values of 2016 staisfying the conditions in where clause
#counts are stored in subquery
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM (
    #take count of occurence of values of tiv_2015 and lat lon pairs and attach to table
   SELECT *,
       COUNT(*)OVER(PARTITION BY tiv_2015) AS tiv_2015_cnt,
       COUNT(*)OVER(PARTITION BY lat, lon) AS loc_cnt
   FROM Insurance
#make alias of the table as t0
  )t0
  
#select sum of records of 2016 which have the same tiv_2015 value as one or more other policyholders
WHERE tiv_2015_cnt > 1
#and are not located in the same city:i.e pair of lat lon should be unique
AND loc_cnt = 1
