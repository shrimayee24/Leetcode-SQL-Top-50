#create a window of current day joined to 6 previous days
#calculate average of each window and slide window by incrementing current day
SELECT DISTINCT visited_on,
        SUM(amount) OVER w AS amount,
        ROUND((SUM(amount) OVER w)/7, 2) as average_amount
    FROM customer
    WINDOW w AS ( 
           ORDER BY visited_on
           RANGE BETWEEN INTERVAL 6 DAY PRECEDING AND CURRENT ROW
    )
    #skip first 6 rows of the table because
    #window size of preceding days<6
    LIMIT 6,999
    
