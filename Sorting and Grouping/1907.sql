#create a column category and selects values one by one along with the respective number of accounts
#combine values of all categories using union

#put low salary in category column
#put count of accounts under low salary
SELECT 'Low Salary' AS category,
SUM(CASE WHEN income<20000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts

#combine records
UNION

#put average salary in category column
#put count of accounts under medium salary
SELECT 'Average Salary' AS category,
SUM(CASE WHEN income>=20000 AND income<=50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts

UNION

#put high salary in category column
#put count of accounts under high salary
SELECT 'High Salary' AS category,
SUM(CASE WHEN income>50000 THEN 1 ELSE 0 END) AS accounts_count
FROM Accounts
