SELECT sku, desc
FROM products
WHERE desc LIKE '%offee%'
OR desc LIKE '%agel%'
;

-- BKY5887  Sesame Bagel

SELECT c.name, c.phone
FROM customers c
INNER JOIN orders o
	ON o.customerid = c.customerid
INNER JOIN orders_items i
	ON i.orderid = o.orderid
WHERE c.name LIKE 'J% D%'
AND o.ordered BETWEEN '2017-01-01' AND '2018-01-01'
AND i.sku = 'BKY5887'
GROUP BY c.customerid
;

