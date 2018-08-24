/*  Assignment 8.sql 
    Tin Liu
    CS 155A, Spring 2018 */
    
\W

/* Query 0 */
SELECT user(), current_date(), version(), @@sql_mode\G


USE bookstore;

/*Query 1*/
SELECT count(*) AS 'Counts', Sum(tax_amount) AS 'Tax Amount'
FROM orders;

/*Query 2*/
SELECT product_id , COUNT(product_id) AS 'NumOfOrders'
FROM orderitems
GROUP BY product_id ORDER BY COUNT(product_id) DESC;

/*Query 3*/
SELECT c. category_name, COUNT(p.category_id) AS 'Product Counts', 
						 MAX(p.list_price) AS 'Most Expensive Product'
FROM category c JOIN product p ON c.category_id = p.category_id
GROUP BY category_name ORDER BY COUNT(*) desc;

/*Query 4*/
SELECT email_address, SUM(item_price*quantity) AS TotalItemPrice,
						 SUM(discount_amount*quantity) AS TotalDiscountedAmount
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON oi.order_id = o.order_id
GROUP BY email_address ORDER BY TotalItemPrice DESC;

/*Query 5*/
SELECT email_address, COUNT(oi.order_id) AS 'Order Count',
					  SUM((item_price - discount_amount)*quantity) AS totalprice 
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY email_address HAVING count(o.order_id)>1 ORDER BY totalprice  DESC;

/*Query 6*/
SELECT email_address, COUNT(oi.order_id) AS 'Order Count',
					  SUM((item_price - discount_amount)*quantity) AS totalprice 
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
WHERE item_price > 400
GROUP BY email_address HAVING count(o.order_id)>1 ORDER BY totalprice DESC;

/*Query 7*/
SELECT email_address, COUNT(DISTINCT oi.product_id) AS NumOfProducts
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
JOIN orderitems oi ON o.order_id = oi.order_id
GROUP BY email_address HAVING COUNT(DISTINCT oi.product_id)>1 ;

/*Query 8*/
SELECT vendor_id, COUNT(*)
FROM product
WHERE list_price >= 100
GROUP BY vendor_id;

/*Query 9*/
SELECT vendor_id, category_id, COUNT(*) AS NumOfProduct, AVG(list_price)
FROM product
GROUP BY vendor_id, category_id HAVING COUNT(*) >1;

/*Query 10*/
SELECT COUNT(*) AS NumOFPrinterProduct
FROM product
WHERE category_id = 61 ;

/*Query 11*/
SELECT SUM((item_price-discount_amount)*quantity) AS TotalProfit
FROM orderitems oi JOIN orders o ON oi.order_id = o.order_id
WHERE customer_id = 77779;




