SELECT name, phone, birthdate, address, citystatezip
FROM customers
-- Dog year
WHERE strftime('%Y', birthdate) % 12 = 2
-- Aries
AND strftime('%m-%d', birthdate) BETWEEN '03-21' AND '04-19'
-- Neighborhood same as JD
AND citystatezip LIKE '%11420%'
;
