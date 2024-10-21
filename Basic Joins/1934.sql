#join user id of signups with confirmation rate calculated from confirmations
#map records using user_ids
#if id in signup not present in confirmation-coalesce to replace by zero
SELECT S.user_id,ROUND(COALESCE(SUM(C.action="confirmed")/COUNT(C.user_id),0),2) AS confirmation_rate FROM Signups AS S
LEFT JOIN Confirmations AS C 
ON S.user_id=C.user_id
GROUP BY S.user_id
