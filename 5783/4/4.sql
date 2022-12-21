-- We are looking at pastries from Noah's inventory.
-- Product's SKUs have a 3 letters prefix that is a category.
-- 
SELECT DISTINCT SUBSTR(sku, 1, 3) FROM products;
/*
DLI
PET
HOM
KIT
TOY
CMP
COL
BKY
*/

-- BKY => Bakery


SELECT c.name, c.phone, i.sku, strftime('%H:%M:%S', o.ordered) AS order_time
FROM customers c
INNER JOIN orders o
	ON o.customerid = c.customerid
INNER JOIN orders_items i
	ON i.orderid = o.orderid
-- Hour < 5
WHERE strftime('%H', o.ordered) < '05'
-- Backery
AND i.sku LIKE 'BKY%'
ORDER BY order_time ASC
;

-- I choose the customer with the most orders near 5am
-- but here is the final SQL:

SELECT c.name, c.phone, COUNT(DISTINCT o.orderid) AS nb_orders
FROM customers c
INNER JOIN orders o
	ON o.customerid = c.customerid
INNER JOIN orders_items i
	ON i.orderid = o.orderid
WHERE strftime('%H', o.ordered) < '05'
AND i.sku LIKE 'BKY%'
GROUP BY c.customerid
HAVING COUNT(DISTINCT o.orderid) > 1
ORDER BY nb_orders DESC
LIMIT 1
;
