SELECT query_name, 

#calculate sum of rating/position for all query names
#divide sum by total query names
#round off to 2 decimal names
ROUND(SUM(rating/position)/COUNT(query_name),2) AS quality,

#when rating<3 value of rating is changed to 1 else it is changed to 0
#sum of all 1s gives us count of ratings<3
#divide sum by count of query names
#round off to 2 decimal places
ROUND(SUM(CASE WHEN rating < 3 THEN 1 ELSE 0 END)*100/COUNT(query_name),2) AS poor_query_percentage

FROM Queries

#makes sure only non-null query_names are selected
WHERE query_name IS NOT NULL
#do all counting w.r.t query names column
GROUP BY query_name 
