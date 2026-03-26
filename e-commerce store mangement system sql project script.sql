#1.Creating the database - ecommerce_store 
CREATE DATABASE ecommerce_store;
#2.Using ecommerce_store database 
USE ecommerce_store;
#3.Creating Users Table
CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);
desc Users;


#4.Creating Products Table
CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    price DECIMAL(10,2)
);
desc Products;

#5.Creating Orders Table
CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (user_id) REFERENCES Users(user_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
desc Orders ;


#6.Adding user values in Users table 
INSERT INTO Users (name, email) VALUES 
('Alice', 'alice@example.com'),
('Bob', 'bob@example.com');

Select * from Users;

#7.Adding product values in Products  table 
INSERT INTO Products (name, price) VALUES
('Laptop', 1200.00),
('Phone', 800.00),
('Headphones', 150.00);
select * from Products;


#8.Adding order values in Orders table 
INSERT INTO Orders (user_id, product_id, quantity) VALUES
(1, 1, 1),   -- Alice buys 1 Laptop
(1, 3, 2),   -- Alice buys 2 Headphones
(2, 2, 1);   -- Bob buys 1 Phone

Select * from Orders;

#9.joins
#Displaying who bought what and how many products
SELECT 
    Users.name AS Customer,
    Products.name AS Product,
    Orders.quantity
FROM Orders
JOIN Users ON Orders.user_id = Users.user_id
JOIN Products ON Orders.product_id = Products.product_id;

#10.Trigger
#Creating backup database for Orders table
CREATE TABLE Orders_log
( order_id int ,
  user_id int,
  product_id int,
  quantity int ,
  action datetime
);
desc Orders_log;
#Creating a trigger 
 DELIMITER $$
CREATE TRIGGER after_delete_Orders
AFTER DELETE ON Orders
FOR EACH ROW
BEGIN 
	 INSERT INTO Orders_log (order_id,user_id,product_id,quantity,action) 
	 VALUES(OLD.order_id,OLD.user_id,OLD.product_id,OLD.quantity,NOW());
END$$
DELIMITER  ;



# Testing Trigger

delete from Orders where product_id =2;

#Displaying Backup data of Orders table after delete query occurred on Orders table
select * from Orders_log;


