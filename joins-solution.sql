-- 1. Get all customers and their addresses.
SELECT * FROM customers
JOIN addresses ON customer_id = customers.id;

-- 2. Get all orders and their line items.
SELECT * FROM orders
JOIN line_items ON order_id = orders.id;

-- 3. Which warehouses have cheetos?
SELECT * FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_id
JOIN products ON product_id = products.id
WHERE products.description = 'cheetos';

-- 4. Which warehouses have diet pepsi?
SELECT * FROM warehouse
JOIN warehouse_product ON warehouse.id = warehouse_id
JOIN products ON product_id = products.id
WHERE products.description = 'diet pepsi';

-- 5. Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.
SELECT COUNT(*), customers.first_name, customers.last_name
	FROM orders
	JOIN addresses ON (addresses.id = orders.address_id)
	JOIN customers ON (customers.id = addresses.customer_id)
	GROUP BY customers.id;

-- 6. How many customers do we have?
SELECT COUNT (*) FROM customers;

-- 7. How many products do we carry?
SELECT COUNT (*) FROM products;

-- 8. What is the total available on-hand quantity of diet pepsi?
SELECT SUM (warehouse_product.on_hand) FROM warehouse_product
WHERE product_id = 6;
