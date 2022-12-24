SELECT p.sku, p.desc
FROM products p
WHERE p.desc LIKE '% (%)'
GROUP BY p
ORDER BY p.desc ASC
;

SELECT SUBSTR(p.desc, 1, INSTR(p.desc, ' (')-1) AS product, p.sku, p.desc
FROM products p
WHERE p.desc LIKE '% (%)'
ORDER BY p.desc ASC
;

SELECT SUBSTR(p.desc, 1, INSTR(p.desc, ' (')-1) AS product, COUNT(p.sku)
FROM products p
WHERE p.desc LIKE '% (%)'
GROUP BY product
HAVING COUNT(p.sku) > 1
ORDER BY p.desc ASC
;



-- cutomer 8342
SELECT o1.ordered, o2.ordered, c.*
FROM orders o1
INNER JOIN orders o2
	ON o2.ordered BETWEEN datetime(o1.ordered, '-30 minutes') AND datetime(o1.ordered, '+30 minutes')
INNER JOIN customers c
	ON c.customerid = o2.customerid 
WHERE o1.customerid = 8342
;

SELECT o1.ordered, o2.ordered, i1.sku, i2.sku
FROM orders o1
INNER JOIN orders o2
	ON o2.ordered BETWEEN datetime(o1.ordered, '-30 minutes') AND datetime(o1.ordered, '+30 minutes')
INNER JOIN orders_items i1
	ON i1.orderid = o1.orderid 
INNER JOIN orders_items i2
	ON i2.orderid = o2.orderid
	AND SUBSTR(i2.sku, 1, 3) = SUBSTR(i1.sku, 1, 3)
WHERE o1.customerid = 8342
;

SELECT o1.ordered, o2.ordered, i1.sku, i2.sku, p1.desc, p2.desc, c.*
FROM orders o1
INNER JOIN orders o2
	ON o2.ordered BETWEEN datetime(o1.ordered, '-30 minutes') AND datetime(o1.ordered, '+30 minutes')
INNER JOIN orders_items i1
	ON i1.orderid = o1.orderid 
INNER JOIN orders_items i2
	ON i2.orderid = o2.orderid
	AND i2.sku <> i1.sku
	AND SUBSTR(i2.sku, 1, 3) = SUBSTR(i1.sku, 1, 3)
INNER JOIN products p1
	ON p1.sku = i1.sku
	AND p1.desc LIKE '% (%)'
INNER JOIN products p2
	ON p2.sku = i2.sku
	AND p2.desc LIKE '% (%)'
	AND SUBSTR(p2.desc, 1, INSTR(p2.desc, ' (')-1) = SUBSTR(p1.desc, 1, INSTR(p1.desc, ' (')-1)
INNER JOIN customers c
	ON c.customerid = o2.customerid 
WHERE o1.customerid = 8342
;
