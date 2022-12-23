-- customerid is non unique
-- CREATE UNIQUE INDEX customers_pk ON customers (customerid);

CREATE INDEX customers_name ON customers (name);
CREATE INDEX customers_citystatezip ON customers (citystatezip);

CREATE UNIQUE INDEX products_pk ON products (sku);

CREATE UNIQUE INDEX orders_pk ON orders (orderid);
CREATE INDEX orders_customerid ON orders (customerid);

CREATE UNIQUE INDEX orders_items_pk ON orders_items (orderid, sku);

CREATE INDEX orders_items_sku ON orders_items (sku);
