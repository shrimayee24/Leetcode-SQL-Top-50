 #select first 7 characters from left for YYYY-MM format
SELECT LEFT(trans_date,7) AS month,
country,

   #even though country is null,still id exists
COUNT(id) AS trans_count ,
  
   #where state is approved, the value is 1,sum all 1s
SUM(state='approved') AS approved_count,
  
   #sum total amount
SUM(amount) AS trans_total_amount,
  
   #sum all the respective amounts from approved states
SUM((state='approved')*amount) AS approved_total_amount
FROM Transactions 
GROUP BY month,country
