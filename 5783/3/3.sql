SELECT name, phone, birthdate, address
FROM customers
WHERE strftime('%Y', birthdate) % 12 = 2
AND strftime('%m-%d', birthdate) BETWEEN '03-21' AND '04-19'
AND citystatezip LIKE '%11420%'
;
