
SELECT rowid, c.*
FROM customers c
INNER JOIN (
	SELECT c.customerid
	FROM customers c
	GROUP BY c.customerid
	HAVING COUNT(*) > 1
) ids
	ON c.customerid = ids.customerid
ORDER BY c.customerid, c.name
;

-- Fix duplicate customer
DELETE
FROM customers c
WHERE c.customerid = 4308
AND rowid = 10500
;

-- Show rounding error in orders.total
SELECT o.orderid, format("%g", o.total - SUM(i.unit_price*i.qty)) AS "diff"
FROM orders AS o
INNER JOIN orders_items AS i
	ON i.orderid = o.orderid
GROUP BY o.orderid
HAVING o.total <> SUM(i.unit_price*i.qty)
;

-- Fix decimal dust
UPDATE orders o
SET total = ROUND(total, 2)
;