/*  Assignment 9.sql 
    Tin Liu
    CS 155A, Spring 2018 */
    
\W

/* Query 0 */
SELECT user(), current_date(), version(), @@sql_mode\G

USE bookstore;

/* Query 1*/
SELECT DISTINCT category_name
FROM category c
WHERE c.category_id in (SELECT p.category_id FROM product p)
ORDER BY category_name;


/* Query 2*/
SELECT product_name, list_price
FROM product
WHERE list_price > ALL(SELECT AVG(list_price) FROM product)
ORDER BY list_price DESC;


/*Query 3*/
SELECT category_name
FROM category
WHERE EXISTS (SELECT * FROM product HAVING COUNT(category_id) >= 1);


/*Query 4*/
SELECT email_address, order_id, SUM(final_price) AS order_total
FROM (SELECT c.email_address, oi.order_id,
			(item_price - discount_amount) * quantity AS final_price
      FROM customer c JOIN orders o ON c.customer_id = o.customer_id
	  JOIN orderitems oi ON o.order_id = oi.order_id) joined_table
GROUP BY email_address, order_id;

/*Query 5*/
SELECT email_address, order_id, order_date
FROM (SELECT c.email_address , o.order_id, o.order_date
	  FROM customer c JOIN orders o ON c.customer_id = o.customer_id)
      joined_table
ORDER BY order_date;

/*Query 6*/
SELECT product_id, product_name, list_price
FROM product 
WHERE product_id IN (SELECT product_id 
					 FROM orderitems 
                     GROUP BY product_id 
                     HAVING COUNT(*)>1);


/*Query 7*/
SELECT DISTINCT c.last_name, c.first_name
FROM customer c JOIN orders o ON c.customer_id = o.customer_id
				JOIN orderitems oi ON o.order_id = oi.order_id
WHERE oi.item_price IN (SELECT item_price 
					 FROM orderitems
                     WHERE item_price > 300);


/*Query 8*/
SELECT c.last_name, c.first_name, c.email_address
FROM customer c JOIN orders o ON c.customer_id = o.customer_id
				JOIN orderitems oi ON o.order_id = oi.order_id
WHERE oi.order_id IN (SELECT order_id
					  FROM orderitems
                      WHERE order_id IN(1,2,3) );


/*Query 9*/
SELECT DISTINCT c.last_name, c.first_name, c.email_address
FROM customer c JOIN orders o ON c.customer_id = o.customer_id
				JOIN orderitems oi ON o.order_id = oi.order_id
                JOIN product p ON oi.product_id = p.product_id
                JOIN vendor v ON p.vendor_id = v.vendor_id
WHERE v.company_name  IN   (SELECT company_name
					       FROM vendor
						   WHERE company_name LIKE 'H%');
                           

/* Query 10*/
SELECT product_id, product_name, list_price
FROM product
WHERE product_id IN (SELECT product_id 
					 FROM orderitems 
                     GROUP BY product_id 
                     HAVING COUNT(*)>=2);

/* Query 11*/
SELECT order_id, SUM((item_price - discount_amount) * quantity) AS order_total
FROM orderitems
GROUP BY order_id
HAVING SUM((item_price - discount_amount) * quantity) > 
(SELECT SUM((item_price - discount_amount) * quantity)
 FROM orderitems
 WHERE order_id = 7);
 

 /*Query 12*/
 SELECT order_id, order_date, ship_date
 FROM orders
 WHERE ship_date - order_date = (SELECT MAX(ship_date-order_date)
								 FROM orders);
	   

