SELECT DISTINCT c.citystatezip
FROM customers c
WHERE c.citystatezip LIKE '%Manhattan, NY 10%'
;

SELECT p.sku, p.desc
FROM products p
-- WHERE p.sku LIKE 'COL%'
WHERE p.desc LIKE 'Noah''s %'
ORDER BY p.desc ASC
;

SELECT COUNT(DISTINCT p.desc)
FROM products p
-- WHERE p.sku LIKE 'COL%'
WHERE p.desc LIKE 'Noah''s %'
;


SELECT c.name, c.phone, c.citystatezip, COUNT(DISTINCT p.desc) AS nb_noahs
FROM orders o
INNER JOIN customers c
	ON c.customerid = o.customerid
INNER JOIN orders_items i 
	ON i.orderid = o.orderid 
INNER JOIN products p 
	ON p.sku = i.sku
WHERE c.citystatezip LIKE 'Manhattan, NY 10%'
AND p.sku IN (
		SELECT p.sku
		FROM products p
		-- WHERE p.sku LIKE 'COL%'
		WHERE p.desc LIKE 'Noah''s %'
)
GROUP BY o.customerid 
HAVING COUNT(DISTINCT p.desc) > 10
ORDER BY nb_noahs DESC
LIMIT 1
;
