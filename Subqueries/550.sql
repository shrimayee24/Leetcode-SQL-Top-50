#make a temporary table first_logins to filter out records based on first login date
WITH first_logins AS 
(
  SELECT
    A.player_id,
    #use min function to extract first login date for each player
    MIN(A.event_date) AS first_login
  FROM
    Activity A
  GROUP BY
    A.player_id
) 
#make a temp table to count number of players who logged in on consecutive days
,consec_logins AS 
(
    
  SELECT
  #count the players whose dates are mapped in 'and' clause
    COUNT(A.player_id) AS num_logins
  FROM
    first_logins F
    #find first login dates by joining activity table to itself based on first login dates
    INNER JOIN Activity A ON F.player_id = A.player_id
    #find the date of in activity table which is next to first login date for each player
    #store the count of such players in consec_logins table
    AND F.first_login = DATE_SUB(A.event_date, INTERVAL 1 DAY)
)

SELECT
  ROUND(
    #select number of players who logged in consecutively after first login
    (SELECT C.num_logins FROM consec_logins C)
    / 
    #select total number of players who logged in for 1st time (no of players in general)
    (SELECT COUNT(F.player_id) FROM first_logins F)
  , 2) 
  #divide the values and round off to 2 decimal places
  AS fraction;
