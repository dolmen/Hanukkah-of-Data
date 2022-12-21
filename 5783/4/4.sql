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


SELECT c.name, c.phone, sku, strftime('%H:%M:%S', o.ordered) AS order_time
FROM customers c
INNER JOIN orders o
	ON o.customerid = c.customerid
INNER JOIN orders_items i
	ON i.orderid = o.orderid
WHERE strftime('%H', o.ordered) < '05'
AND i.sku LIKE 'BKY%'
ORDER BY order_time ASC
;

-- I choose the customer with the most orders near 5am
