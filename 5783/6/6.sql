SELECT *
FROM customers c 
WHERE c.name LIKE '% Koch';


SELECT c.name, c.phone, o.total - SUM(i.qty*p.wholesale_cost), o.total < SUM(i.qty*p.wholesale_cost)
FROM customers c 
INNER JOIN orders o 
	ON o.customerid = c.customerid 
INNER JOIN orders_items i
	ON i.orderid = o.orderid 
INNER JOIN products p
	ON p.sku = i.sku
-- Cousin?
WHERE c.name LIKE '% Koch'
AND c.name <> 'Anita Koch'
GROUP BY o.orderid 
ORDER BY c.name, o.ordered
;


-- SELECT * FROM products WHERE sku LIKE 'HOM%' ORDER BY desc;

-- Customers for which all of their orders are below wholesale cost (no benefit for Noah)
SELECT c.*, x.nb_orders
FROM customers c 
INNER JOIN (
	SELECT y.customerid, MIN(y.order_deficit) AS deficit, COUNT(y.orderid) AS nb_orders
	FROM (
		SELECT o.customerid, o.orderid, o.total < SUM(i.qty*p.wholesale_cost) AS order_deficit
		FROM orders o 
		INNER JOIN orders_items i
			ON i.orderid = o.orderid 
		INNER JOIN products p
			ON p.sku = i.sku
		GROUP BY o.customerid, o.orderid
	) y
	GROUP BY customerid
	HAVING MIN(y.order_deficit) = 1 
) x
	ON c.customerid = x.customerid
INNER JOIN orders AS o
	ON o.customerid = x.customerid
INNER JOIN orders_items i
	ON i.orderid = o.orderid 
INNER JOIN products p
	ON p.sku = i.sku
-- WHERE x.deficiit
-- WHERE c.name LIKE '% Koch'
-- AND c.name <> 'Anita Koch'
GROUP BY c.customerid, p.sku 
ORDER BY nb_orders DESC
LIMIT 1
;

-- I choose the first name


/*
SELECT c.*, nb_orders, p.sku, p.desc
FROM customers c 
INNER JOIN (
	SELECT y.customerid, MIN(y.order_deficit) AS deficit, COUNT(y.orderid) AS nb_orders
	FROM (
		SELECT o.customerid, o.orderid, o.total < SUM(i.qty*p.wholesale_cost) AS order_deficit
		FROM orders o 
		INNER JOIN orders_items i
			ON i.orderid = o.orderid 
		INNER JOIN products p
			ON p.sku = i.sku
		GROUP BY o.customerid, o.orderid
	) y
	GROUP BY customerid
	HAVING MIN(y.order_deficit) = 1 
) x
	ON c.customerid = x.customerid
INNER JOIN orders AS o
	ON o.customerid = x.customerid
INNER JOIN orders_items i
	ON i.orderid = o.orderid 
INNER JOIN products p
	ON p.sku = i.sku
-- WHERE x.deficiit
-- WHERE c.name LIKE '% Koch'
-- AND c.name <> 'Anita Koch'
GROUP BY c.customerid, p.sku 
ORDER BY nb_orders DESC, p.desc -- c.name, o.ordered
;
*/