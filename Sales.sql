-- Create a database sales to store the tables 
 CREATE DATABASE sales;
 USE sales;
 
 
 -- Create table salesman to store data in salesman
 
 CREATE TABLE salesman (
 salesman_id INTEGER NOT NULL PRIMARY KEY,
 name VARCHAR(50), 
 city VARCHAR(50),
 commission DECIMAL(3,2)
 );
 
 -- Create table customer to store data of customers  
 CREATE TABLE customer (
 customer_id INTEGER NOT NULL PRIMARY KEY,
 customer_name VARCHAR(50),
 city VARCHAR(25),
 grade INTEGER,
 salesman_id INTEGER,
 FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id)
 );
 
 -- Create table orders to store data about the orders 
 CREATE TABLE orders (
 order_no INTEGER NOT NULL PRIMARY KEY,
 purchase_amt DECIMAL(6,2),
 order_date DATE,
 customer_id INTEGER ,
 salesman_id INTEGER,
 FOREIGN KEY(salesman_id) REFERENCES salesman(salesman_id),
 FOREIGN KEY(customer_id) REFERENCES customer(customer_id)
 );
 
 -- Lets insert the data into the tables 
 
 INSERT INTO salesman(salesman_id, name, city, commission)
 VALUES (5001, 'James Hoog','New York',0.15),
 (5002,'Nail Knite', 'Paris', 0.13),
 (5005,'Pit Alex','London',0.11),
 (5006, 'Mc Lyon', 'Paris', 0.14),
 (5003,'Lauson Hen','Germany', 0.12),
 (5007,'Paul Adam','Rome',0.13);
 
 -- Lets see the data inserted into salesman table 
 
 SELECT * FROM salesman;
 
 
 -- Lets Insert the data into table customer
 
 INSERT INTO customer(customer_id, customer_name, city, grade, salesman_id)
 VALUES( 3002, 'Eleven','New York',100,5001),
 (3005,'Max Mayfield','Seattle',200,5002),
 (3001, 'Steve Harrington','London',300,5003),
 (3004,'Dustin Henderson','Paris',300,5006),
 (3007, 'Mike Wheeler','New York',200,5001),
 (3009,'Nancy Wheeler','Berlin',100,5002),
 (3008,'Will Byers','London',300,5002),
 (3003,'Jim Hopper','Moscow',200,5007);
 
 
 -- Lets see the data inserted into the table customer 
 SELECT * FROM customer;
 
 
 -- Lets insert the data into the table orders 
 
 INSERT INTO orders( order_no, purchase_amt,order_date,customer_id,salesman_id)
 VALUES (70001,150.5,'2016-10-05',3005,5002);
  INSERT INTO orders( order_no, purchase_amt,order_date,customer_id,salesman_id)
 VALUES (70009,270.65,'2016-09-10',3001,5002),
 (70002,65.26,'2016-10-05',3002,5001),
 (70004,110.5,'2016-08-17',3009,5002),
 (70007,948.5,'2016-09-10',3005,5002),
(70005,2400.6,'2016-07-27',3007,5001),
(70008,5760,'2016-09-10',3002,5001),
(70010,1983.43,'2016-10-10',3004,5006),
(70003,2480.4,'2016-10-10',3009,5002),
(70012,250.45,'2016-06-27',3008,5002),
(70011,75.29,'2016-08-17',3003,5007);

-- Lets see the data inserted into the table orders

SELECT * FROM orders;

-- QUERY 1
-- Display the name and commission of all the salesman

SELECT name,
commission 
FROM salesman;


-- QUERY 2
-- Retrieve the salesman id of all the salesman from the orders table without any repeats 

SELECT DISTINCT salesman_id 
FROM orders;

-- QUERY 3
-- Display names and city of saleman, who belongs to the city of Paris 

SELECT name, city 
FROM salesman
WHERE city = 'Paris';

-- QUERY 4
-- Display all the information for those customers with a grade of 200

SELECT * FROM customer
WHERE  grade = 200;

-- QUERY 5
-- Display the order number, order date and the purchase amount 
-- for the order(s) which will be delivered by salesman with ID 5001

SELECT order_no, order_date, purchase_amt
FROM orders
WHERE salesman_id = 5001;

-- QUERY 6
-- Display all the customers, who either belongs to New York or not had a grade above 100

SELECT * FROM customer 
WHERE city = 'New York' OR grade <= 100;

-- QUERY 7 
-- Display all those salesman with all information who get sthe commission within a range of 0.12 and 0.14 

SELECT * FROM salesman
WHERE commission > 0.12 AND commission < 0.14;
-- or if we want to include 0.12 and 0.14 as well then 
SELECT * FROM salesman
WHERE commission BETWEEN 0.12 AND 0.14;
 
 -- QUERY 8
 -- Find all the customers(with all information) whose names ends with letter 'n'
 
 SELECT * 
 FROM customer 
 WHERE customer_name LIKE '%n';
 
 -- QUERY 9
 -- Find those customers with all the information whose name containing the 1st character is 'N'
 -- and the 4th character is 'c' and rest can be any character 
 
 SELECT * FROM customer 
 WHERE customer_name LIKE 'N__c%';
 
 -- QUERY 10 
 -- Find the total purchase amount of all orders 
 
 SELECT SUM(purchase_amt) as total_purchase_amt
 FROM orders;
 
 
 -- QUERY 11
 -- Find the number of salesman currently listing for all of their customers 
 
 SELECT COUNT(DISTINCT salesman_id )
 FROM orders;
 
 -- QUERY 12
 -- Find the highest grade for each of the cities of customers 
 
 SELECT city, MAX(grade)
 FROM customer 
 GROUP BY city;
 
 -- QUERY 13
 -- Find the highest purchase amount ordered by each customer with their id and highest purchase amount 
 
 SELECT customer_id, MAX(purchase_amt)
 FROM orders
 GROUP BY customer_id;
 
 -- QUERY 14 
 -- Find the highest purchase amount ordered by each customer on a particular date with their ID,
 -- order date and highest purchase amount
 
 SELECT customer_id, order_date, MAX(purchase_amt)
 FROM orders
 GROUP BY customer_id, order_date;
 
 -- QUERY 15 
 -- Find the highest purchase amount on a date '2012-08-17' for each salesman with their id 
 
 SELECT salesman_id, MAX(purchase_amt)
 FROM orders 
 WHERE order_date = '2016-08-17'
 GROUP BY salesman_id;
 
 -- QUERY 16
 -- Find the highest purchase amount with their customer id and order date,
 -- for only those customers who have the highest purchase amount in a day is more than 2000
 
 SELECT customer_id, 
 MAX(purchase_amt) AS highest_purchase_amnt ,
 order_date 
 FROM orders 
 GROUP BY customer_id,order_date
 HAVING MAX(purchase_amt) > 2000
 ;
 
 -- QUERY 17
 -- Write a SQL query that counts all orders for a date August 17th, 2016
 
 SELECT COUNT(order_no) AS total_orders
 FROM orders
 WHERE order_date = '2016-08-17';
 
 -- JOINS BASED EXERCISES 
 -- QUERY 18 
 -- Find the name and city of those customers and salesman who lives in the same city 
 
 SELECT name,customer_name, salesman.city 
 FROM customer
 INNER JOIN salesman
 ON 
 salesman.salesman_id = customer.salesman_id 
 WHERE salesman.city = customer.city;
 
 
 -- QUERY 19
 -- Find the names of all customers along with the salesman who works for them.
 
  SELECT customer.customer_name, salesman.name AS salesman_name
  FROM customer
  INNER JOIN salesman
  ON
  salesman.salesman_id = customer.salesman_id;
  
  -- QUERY 20
  -- Display all those orders by the customers not located in the same cities 
  -- where their salesmen live. 
  
  SELECT order_no, customer.customer_name,customer.city,salesman.name,salesman.city
  FROM orders
  INNER JOIN customer ON 
  customer.customer_id = orders.customer_id 
  INNER JOIN salesman ON
  salesman.salesman_id = orders.salesman_id 
  WHERE salesman.city != customer.city;
  
  -- QUERY 21 
  -- Display all the orders issued by the salesman 'Paul Adam' from the orders table.
  -- USING JOIN 
  SELECT * 
  FROM orders
  INNER JOIN salesman
  ON
  salesman.salesman_id = orders.salesman_id 
  WHERE salesman.name =  'Paul Adam';
  
  -- USING A SUB-QUERY 
  SELECT * 
  FROM orders
  WHERE salesman_id = 
  ( SELECT salesman_id  FROM salesman
		WHERE name = 'Paul Adam');
        
-- QUERY 22
-- Display all the orders which values are greater than the average order value 
-- for 10th October 2016.	
-- Lets first calculate the average value for orders for 10th October 2012 

SELECT order_no, purchase_amt
 FROM orders
WHERE purchase_amt > 
(
SELECT AVG(purchase_amt) FROM orders
WHERE order_date = '2016-10-10'
);		

-- QUERY 23
-- Extract the data from the orders table for the salesman who earned the maximum commission.

SELECT * 
FROM orders
WHERE salesman_id = 
(
SELECT salesman_id 
FROM salesman
ORDER BY commission DESC 
LIMIT 1
);

-- OR 

SELECT *
FROM orders
WHERE salesman_id IN (
SELECT salesman_id
FROM salesman
WHERE commission = (
SELECT MAX(commission)
FROM salesman)
);

-- QUERY 24
-- Find the name and ids of all salesmen who had more than one customer.

SELECT salesman_id, name 
FROM salesman
WHERE  
(
SELECT COUNT(*) 
FROM customer 
WHERE customer.salesman_id = salesman.salesman_id 
) > 1
;
-- OR WITHOUT USING A SUB QUERY 
SELECT c.salesman_id, s.name 
FROM salesman AS s, customer AS c
WHERE  s.salesman_id = c.salesman_id
GROUP BY  c.salesman_id, s.name 
HAVING  count(c.salesman_id) > 1;


-- QUERY 25 
-- Write a query to find all the salesmen who worked for only one customer.
-- USING INNER JOIN 
SELECT customer.customer_name , salesman.name, salesman.salesman_id 
FROM customer 
INNER JOIN salesman ON 
salesman.salesman_id = customer.salesman_id 
GROUP BY customer.salesman_id 
HAVING COUNT(customer.salesman_id) = 1;

-- or
-- USING A SUB QUERY 

SELECT salesman_id, name 
  FROM salesman 
WHERE salesman_id IN 
(SELECT salesman_id 
 FROM customer 
GROUP BY salesman_id 
HAVING COUNT(salesman_id) = 1) ;

-- QUERY 26
-- Display all the orders that had amounts that were greater than at
-- least one of the orders from September 10th 2016.

-- lets first check the amount for the given date 
SELECT * 
FROM orders 
WHERE purchase_amt > ANY  
(
SELECT purchase_amt
FROM orders 
WHERE order_date = '2016-09-10'
);

-- QUERY 27 
-- Display only those customers whose grade are higher than every customer in New York.
SELECT customer_name, grade, city 
FROM customer 
WHERE grade > ALL 
( SELECT grade
FROM customer 
WHERE city = 'New York'
);
-- lets check the grade for New York 
SELECT * FROM customer WHERE city = 'New York';



  
  
  
  
 
 
 
 
 
 
 
 
 
 