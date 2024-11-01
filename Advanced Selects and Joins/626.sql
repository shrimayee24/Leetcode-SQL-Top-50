#exchange seats
SELECT
#swap ids,
    (CASE
    #counts-total number of rows
    #when seat id is odd and if its not the last seat,move id to next even position
        WHEN MOD(id, 2) != 0 AND counts != id THEN id + 1
        #when seat is odd and if ts the last seat,cannot move down,remain as it is.
        WHEN MOD(id, 2) != 0 AND counts = id THEN id

        #for all seats having even id,move id to previous odd position
        ELSE id - 1
    END) AS id,

    #select names of swapped ids
    student
FROM
    seat,
    #create table seat_counts to store total number of rows
    #cross join this table to access value of counts in seat table
    (SELECT
        COUNT(*) AS counts
    FROM
        seat) AS seat_counts
#after swapping ids,sort the records in ascending order
ORDER BY id ASC;
