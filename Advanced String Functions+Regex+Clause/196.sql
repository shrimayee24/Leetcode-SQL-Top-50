#similiar to inner join
#create 2 aliases of table as p1 and p2
#map records of p1 having identical mails with p2 and delete those records from a single alias 
#p1.id>p2.id to map 2 different records having identical emails
DELETE p1 FROM person p1,
    person p2
WHERE
    p1.Email = p2.Email AND p1.Id > p2.Id
