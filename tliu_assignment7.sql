/*  Assignment 7.sql 
    Tin Liu
    CS 155A, Spring 2018 */
 \W    



/* Query 0 */
SELECT user(), current_date(), version(), @@sql_mode\G


USE bookstore;

/*Query 1*/
SELECT category_name, product_name, list_price
FROM product 
JOIN category ON product.category_id = category.category_id
ORDER BY category_name, product_name;

/*Query 2*/
SELECT first_name, last_name, line1 , city, state, zip_code
FROM customer JOIN address
ON customer.customer_id = address.customer_id
AND customer.email_address = 'allan.sherwood@yahoo.com';

/*Query 3*/
SELECT first_name, last_name, line1, city, state, zip_code
FROM customer JOIN address 
ON (customer.shipping_address_id = address.address_id);

/* Query 4*/
SELECT last_name, first_name, order_date, product_name,
       item_price,quantity
FROM customer cus 
JOIN orders o ON cus.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
ORDER BY last_name, order_date;

/* Query 5*/
SELECT DISTINCT p1.product_name, p1.list_price
FROM product p1 JOIN product p2
ON (p1.list_price = p2.list_price)
AND (p1.product_id <> p2.product_id)
ORDER BY product_name; 

/* Query 6*/
SELECT product.product_id, product.product_name, vendor.company_name, product.list_price
FROM product 
JOIN vendor ON product.vendor_id = vendor.vendor_id;

/*Query 7*/
SELECT c.category_name, product_id
FROM category c 
LEFT JOIN product p ON c.category_id = p.category_id;

/*Query 8*/
SELECT orders.order_id, order_date, product_name, quantity, list_price * quantity as 'amount'
FROM product 
JOIN orderitems ON product.product_id = orderitems.product_id
JOIN orders ON orderitems.order_id = orders.order_id;

/* Query 9*/
SELECT first_name, last_name
FROM customer
JOIN orders ON customer.customer_id = orders.customer_id
WHERE ship_date IS NULL;

/* Query 10*/
SELECT product_name, o.order_id, ship_address_id
FROM orders o 
JOIN orderitems oi ON o.order_id = oi.order_id
JOIN product p ON oi.product_id = p.product_id
ORDER BY order_id, ship_address_id;

/* Query 11*/
SELECT product_name
FROM product p
JOIN orderitems oi ON p.product_id = oi.product_id
JOIN orders o ON oi.order_id = o.order_id
JOIN customer c ON o.customer_id = c.customer_id
WHERE last_name = 'Brown' AND first_name = 'Christine';

/* Query 12*/
SELECT last_name, first_name,o.order_id,order_date,p.product_id,product_name
FROM customer c
LEFT JOIN orders o ON c.customer_id = o.customer_id
LEFT JOIN orderitems oi ON o.order_id = oi.order_id
LEFT JOIN product p ON oi.product_id = p.product_id
WHERE product_name IS NOT NULL;

