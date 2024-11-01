#select records having latest date using max function
#use where condition to filter latest dates before 2019-08-16
#join the filtered records to original table to filter out records from original table
WITH Newtable AS
(
    SELECT 
        P.product_id,
        P.new_price,
        P.change_date
    FROM
        Products P
    JOIN
        (
            SELECT
                product_id,
                MAX(change_date) AS change_date
            FROM 
                Products
            WHERE
                change_date <= '2019-08-16'
            GROUP BY
                product_id
        ) AS LatestDate
    ON 
        P.product_id = LatestDate.product_id 
        AND P.change_date = LatestDate.change_date
)

#use coalesce function to set default value of price as 10 to product ids which are not present in filtered records
SELECT 
    P.product_id,
    COALESCE(N.new_price, 10) AS price
FROM 
    (SELECT DISTINCT product_id FROM Products) AS P
LEFT JOIN 
    Newtable N 
ON 
    P.product_id = N.product_id
ORDER BY 
    P.product_id;
