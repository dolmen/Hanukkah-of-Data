SELECT sku, desc
FROM products p
WHERE p.desc LIKE 'Noah''s Jersey%'
;

SELECT sku, desc
FROM products p
WHERE p.desc LIKE 'Noah%Market%'
;




SELECT c.name, c.phone, c.address, c.citystatezip, p.desc
FROM customers c
INNER JOIN orders o
	ON o.customerid = c.customerid 
INNER JOIN orders_items i 
	ON i.orderid = o.orderid
INNER JOIN products p
	ON p.sku = i.sku 
WHERE (c.citystatezip LIKE 'Queens Village%')
AND p.desc  LIKE 'Noah''s Jersey%'
;
-- No results :(


SELECT c.name, c.phone, c.address, c.citystatezip, p.desc
FROM customers c
INNER JOIN orders o
	ON o.customerid = c.customerid 
INNER JOIN orders_items i 
	ON i.orderid = o.orderid
INNER JOIN products p
	ON p.sku = i.sku 
WHERE p.desc  LIKE 'Noah''s Jersey%'
;
-- 


SELECT c.name, c.phone, c.address, c.citystatezip, p.desc
FROM customers c
INNER JOIN orders o
	ON o.customerid = c.customerid 
INNER JOIN orders_items i 
	ON i.orderid = o.orderid
INNER JOIN products p
	ON p.sku = i.sku 
WHERE (c.citystatezip LIKE 'Queens Village%')
AND p.desc  LIKE '%Cat%'
;

-- I choose the person with the most orders and won


SELECT c.name, c.phone, c.citystatezip, p.desc, i.qty
FROM customers c
INNER JOIN orders o
	ON o.customerid = c.customerid 
INNER JOIN orders_items i 
	ON i.orderid = o.orderid
INNER JOIN products p
	ON p.sku = i.sku 
WHERE (c.citystatezip LIKE 'Queens Village%')
AND p.desc  LIKE '%Senior Cat%'
AND i.qty > 8
ORDER BY i.qty DESC
LIMIT 1
;

