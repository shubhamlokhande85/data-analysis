
# Creating New Database - library

create database library;  
use library;

#Creating Table Branch 
create table Branch 
(
  Branch_no varchar(10) primary key,
  Manager_id varchar(10),
  Branch_address varchar(50),
  Branch_contact_no varchar(15)
);
desc Branch;

# Creating Table Employee_info
create table Employee_info
(
  Employee_id varchar(10) primary key,
  Employee_name varchar(50),
  Employee_position varchar(30),
  Employee_salary decimal(10,2),
  Employee_address varchar(50)
);
desc Employee_info;


#Creating Table Customer_info 
create table Customer_info
(
  Customer_id varchar(10) primary key,
  Customer_name varchar(50),
  Customer_address varchar(50),
  Customer_contact_no varchar(15)
);
 desc Customer_info;
 
#Creating Table Books
create table Books 
( Book_id varchar(10) primary key,
  Book_name varchar(80),
  Book_author varchar(50),
  Book_category varchar(30),
  Book_status enum("Yes","No"),
  Book_publisher varchar(50),
  Book_rental_price decimal(10,2) );
desc Books;

# Creating Table Issued_books
create table Issued_books 
(   Issued_id varchar(10) primary key,
    Issued_book_name varchar(50),
    Issued_book_id varchar(10),
    Issued_date date,
    Issued_customer_id varchar(10),
    foreign key (Issued_book_id) references Books(Book_id) on delete cascade,
    foreign key (Issued_customer_id) references Customer_info(Customer_id) on delete cascade);
desc Issued_books;


#Creating Table Returned_books

create table Returned_books 
(   Return_id varchar(10) primary key,
    Returned_book_id varchar(10),
    Return_date date,
    Returned_customer_id varchar(10),
    foreign key (Returned_book_id) references Books(Book_id) on delete cascade,
    foreign key (Returned_customer_id) references Customer_info(Customer_id) on delete cascade);
desc Returned_books;




#1.Showing All Tables 
show tables; 


#2.Inserting respective values into respective tables
insert into Branch (Branch_no, Manager_id, Branch_address, Branch_contact_no)
values
('B001', 'M001', '101 MG Road, Bengaluru, Karnataka', '080-23456789'),
('B002', 'M002', '22 Park Street, Kolkata, West Bengal', '033-45678901'),
('B003', 'M003', '5 Connaught Place, New Delhi, Delhi', '011-34567890'),
('B004', 'M004', '12 Marine Drive, Mumbai, Maharashtra', '022-67890123');
select * from Branch; 

insert into Employee_info (Employee_id, Employee_name, Employee_position, Employee_salary, Employee_address)values
('E001', 'Rohan Mehta', 'Library Manager', 50000.00, '45 MG Road, Bengaluru, Karnataka'),
('E002', 'Sanya Sharma', 'Accountant', 35000.00, '12 Park Street, Kolkata, West Bengal'),
('E003', 'Vikram Singh', 'Library Assistant', 30000.00, '78 Connaught Place, New Delhi, Delhi'),
('E004', 'Anjali Patel', 'Archivist', 40000.00, '23 Marine Drive, Mumbai, Maharashtra'),
('E005', 'Arjun Reddy', 'Clerk', 28000.00, '56 Residency Road, Bengaluru, Karnataka'),
('E006', 'Neha Gupta', 'Teller / Front Desk', 27000.00, '34 Park Street, Kolkata, West Bengal'),
('E007', 'Siddharth Verma', 'IT Support', 32000.00, '12 Lajpat Nagar, New Delhi, Delhi'),
('E008', 'Pooja Joshi', 'HR / Librarian', 36000.00, '8 Churchgate, Mumbai, Maharashtra');
select * from Employee_info ;  

insert into Customer_info (Customer_id, Customer_name, Customer_address, Customer_contact_no)values
('C001', 'Rahul Sharma', '101 MG Road, Bengaluru, Karnataka', '9876543210'),
('C002', 'Priya Singh', '22 Park Street, Kolkata, West Bengal', '9123456780'),
('C003', 'Amit Kumar', '78 Connaught Place, New Delhi, Delhi', '9988776655'),
('C004', 'Neha Patel', '23 Marine Drive, Mumbai, Maharashtra', '9871122334'),
('C005', 'Siddharth Verma', '56 Residency Road, Bengaluru, Karnataka', '9812345678'),
('C006', 'Pooja Joshi', '34 Park Street, Kolkata, West Bengal', '9900112233'),
('C007', 'Vikram Reddy', '12 Lajpat Nagar, New Delhi, Delhi', '9878901234'),
('C008', 'Anjali Gupta', '8 Churchgate, Mumbai, Maharashtra', '9765432109');
select * from Customer_info;


insert into Books (Book_id, Book_name, Book_author, Book_category, Book_status, Book_publisher, Book_rental_price)values
('B001', 'The Guide', 'R. K. Narayan', 'Fiction', 'Yes', 'Indian Thought Publications', 50.00),
('B002', 'Midnight\'s Children', 'Salman Rushdie', 'Historical Fiction', 'No', 'Vintage India', 75.00),
('B003', 'Gitanjali', 'Rabindranath Tagore', 'Poetry', 'Yes', 'Macmillan India', 40.00),
('B004', 'Train to Pakistan', 'Khushwant Singh', 'Historical Fiction', 'Yes', 'Rupa Publications', 60.00),
('B005', 'The White Tiger', 'Aravind Adiga', 'Fiction', 'No', 'HarperCollins India', 65.00),
('B006', '2 States', 'Chetan Bhagat', 'Romance', 'Yes', 'Rupa Publications', 55.00),
('B007', 'Palace of Illusions', 'Chitra Banerjee Divakaruni', 'Mythology', 'Yes', 'Speaking Tiger', 70.00),
('B008', 'India After Gandhi', 'Ramachandra Guha', 'History', 'Yes', 'HarperCollins India', 80.00),
('B009', 'The Immortals of Meluha', 'Amish Tripathi', 'Mythology', 'Yes', 'Westland Publications', 65.00),
('B010', 'The Alchemist', 'Paulo Coelho', 'Fiction', 'Yes', 'HarperCollins India', 60.00);
select * from Books;

insert into Issued_books (Issued_id, Issued_book_id, Issued_book_name, Issued_date, Issued_customer_id)
values
('I001', 'B002', 'Midnight\'s Children', '2026-03-01', 'C001'),  
('I002', 'B005', 'The White Tiger', '2026-03-05', 'C004'),     
('I003', 'B001', 'The Guide', '2026-03-10', 'C002'),           
('I004', 'B006', '2 States', '2026-03-12', 'C003'),             
('I005', 'B003', 'Gitanjali', '2026-03-15', 'C005');            
select * from Issued_books;

insert into Returned_books (Return_id, Returned_book_id, Return_date, Returned_customer_id)
values 
('R001', 'B001', '2026-03-15', 'C002'), 
('R002', 'B003', '2026-03-20', 'C005'),  
('R003', 'B006', '2026-03-22', 'C003'), 
('R004', 'B002', '2026-03-25', 'C001'), 
('R005', 'B007', '2026-03-28', 'C006');  
select * from Returned_books;

# Queries 

#3. Retrieving available books from books table

select Book_id, Book_name,Book_category,Book_status from Books where Book_status ='Yes';


# 4.Displaying of employee and their respective salaries 

select Employee_id ,Employee_name ,Employee_salary from Employee_info ;

#5. Retrieving the book name and the corresponding customers who are currently issuing them
  
select Issued_books.Issued_book_name, Customer_info.Customer_name from Issued_books inner join Customer_info on 
Issued_books.Issued_customer_id = Customer_info.Customer_id;


#6. Displying total number of books by category 

select Book_category,  count(book_name) from Books group by Book_category;

#7. Retrieving the names and positions of employees whose salaries exceed Rs. 30,000.

select Employee_name, Employee_position from Employee_info where Employee_salary > 30000;
 
#8.Adding Register_date column in Customer_info table

alter table Customer_info add column Register_date date ;
desc customer_info;
select * from Customer_info;

#9.Adding Register dates in Customer_info table 
SET SQL_SAFE_UPDATES = 0;  # This disables safe update mode so you can run UPDATE or DELETE queries without restrictions.
update  Customer_info set Register_date = '2026-01-05' where Customer_name= 'Rahul Sharma';
update  Customer_info set Register_date = '2026-02-05' where Customer_name= 'Priya Singh';
update  Customer_info set Register_date = '2026-02-06' where Customer_name= 'Amit Kumar';
update  Customer_info set Register_date = '2026-02-25' where Customer_name= 'Neha Patel';
update  Customer_info set Register_date = '2026-02-25' where Customer_name= 'Siddharth Verma';
update  Customer_info set Register_date = '2026-02-05' where Customer_name= 'Pooja Joshi';
update  Customer_info set Register_date = '2026-01-06' where Customer_name= 'Vikram Reddy';
update  Customer_info set Register_date = '2026-01-07' where Customer_name= 'Anjali Gupta';
select * from Customer_info;

#10.List of the customer names who registered before 2026-02-01 and have not issued any books yet.

select Customer_name from Customer_info where Register_date < '2026-02-01' and Customer_id not in (select Issued_customer_id from Issued_books); 


#11.Displaying book details from Books table where field is history 

select * from Books where Book_category ="History" ;

#12. adding Returned_book_name column in Returned_books table 

alter table Returned_books add column Returned_book_name varchar(50); 
select * from Returned_books;

#13.Updating the Returned_book_name column in the Returned_books table 
update Returned_books SET Returned_book_name = 'The Guide' WHERE Returned_book_id = 'B001';
update Returned_books set Returned_book_name = 'Gitanjali' where Returned_book_id = 'B003';
update Returned_books set  Returned_book_name = '2 States' where Returned_book_id = 'B006';
update Returned_books  set Returned_book_name = 'Midnight\'s Children' where Returned_book_id = 'B002';
update Returned_books set  Returned_book_name = 'Palace of Illusions' where  Returned_book_id = 'B007';
select * from Returned_books;

#14.Displaying Returned books details date after the 25-03-2026. 
 select * from Returned_books where Return_date > '2026-03-25';
 
 
 #15. TRIGGER - STORED PROCEDURE 
 
 #A.Creating Books_log table for Books backup  
 
 create table Books_log
( Book_id varchar(10) primary key,
  Book_name varchar(80),
  Book_author varchar(50),
  Book_category varchar(30),
  Book_status enum("Yes","No"),
  Book_publisher varchar(50),
  Book_rental_price decimal(10,2), 
  action datetime );
desc Books;

#B.Creating trigger - AFTER DELETE BOOKS

 DELIMITER $$
 CREATE TRIGGER after_delete_Books
 AFTER DELETE ON Books
 FOR EACH ROW 
 BEGIN
       INSERT INTO Books_log(Book_id,Book_name,Book_author,Book_category,Book_status,Book_publisher,Book_rental_price,action)
       VALUES(OLD.Book_id,OLD.Book_name,OLD.Book_author,OLD.Book_category,OLD.Book_status,OLD.Book_publisher,OLD.Book_rental_price,now());
END$$
DELIMITER ;
 
#C.TRIGGER TESTING 

#Step 01
delete from Books where Book_id = 'B001';

#Step 02 
select * from Books ;


#D.backup data of Books table after delete query occurred on Books table  
select * from Books_log;



