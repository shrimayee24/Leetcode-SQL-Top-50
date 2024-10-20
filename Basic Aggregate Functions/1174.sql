#create a table which contains first orders of a customer (using min function for oder date and delievery date)
WITH unique_records AS
(
   SELECT customer_id, MIN(order_date) AS order_date, MIN(customer_pref_delivery_date) AS customer_pref_delivery_date
   FROM Delivery
   GROUP BY customer_id
)

#calculate % of immediate orders (no. of records where order date and delievery date is same)
SELECT ROUND(SUM(CASE WHEN order_date=customer_pref_delivery_date THEN 1 ELSE 0 END)*100/COUNT(*),2) 
AS immediate_percentage
FROM unique_records
