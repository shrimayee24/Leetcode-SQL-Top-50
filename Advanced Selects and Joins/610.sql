#use case statement to check whether sides form a triangle or not
  #store case values in triangle column
SELECT x,y,z,
CASE WHEN x+y>z AND y+z>x AND x+z>y THEN 'Yes' ELSE 'No' END AS triangle
FROM Triangle
