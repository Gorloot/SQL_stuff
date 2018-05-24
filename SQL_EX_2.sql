/* Query 1 */
SELECT last_name, 
	first_name, 
    customer_id
FROM customer
WHERE customer_id != 77779; 

/* Query 2 */
SELECT product_name, 
	description
FROM product
WHERE category_id > 21;

/* Query 3 */
SELECT last_name, 
	first_name, customer_id,
    email_address
FROM customer
WHERE customer_id = 11119;

/* Query 4 */
SELECT 
	item_id AS 'The item_id column' , 
    item_price 'The item_price column', 
    discount_amount 'The discount_amount column', 
    quantity 'The quantity_amount column', 
    item_price * quantity AS price_total, discount_amount * quantity AS discount_total, 
    (item_price - discount_amount) * quantity AS item_total
FROM orderitems
WHERE (item_price - discount_amount) * quantity > 900
ORDER BY  (item_price - discount_amount) * quantity DESC;

/* Query 5 */
SELECT store_id 'The store_id column', 
	region_id 'The region_id column', 
    region_name 'The region_name column'
FROM store;

/* Query 6 */
SELECT customer_id, email_address 
FROM customer;

/* Query 7 */
SELECT DISTINCT customer_id
FROM orders;

/* Query 8 */
SELECT product_name 'The product_name column', 
	list_price 'The list_price column', 
	discount_percent 'The discount_percent column', 
	list_price * discount_percent AS discount_amount, 
	list_price - (list_price * (discount_percent * 0.01)) AS discount_price
FROM product
LIMIT 5;

/* Query 9 */
SELECT line1 'Address 1', 
	line2 'Address 2', 
	CONCAT(city, ',', state) as 'City and State',
    zip_code 'Zip code'
FROM address;

/* Query 10 */
SELECT CONCAT(last_name, ', ', First_name) AS full_name
FROM customer;

/* Query 11 */
SELECT product_id, 
	category_id 
FROM product
ORDER BY category_id DESC;

/* Query 12 */
/*typo in the quesiton or we are only doing up to 10?*/
SELECT product_name, 
	list_price, 
	list_price - (list_price * (discount_percent * 0.01)) AS new_list_price
FROM product
WHERE discount_percent > 20
