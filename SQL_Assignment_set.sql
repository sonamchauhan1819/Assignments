/* Q.3 Create a table called countries with the following columns
        name , population, capital    
- choose appropriate datatypes for the columns

a) Insert the following data into the table */
create table assignment.countries
(
name char (50) not null, 
population int, 
capital char (50),
primary key(name));    
insert into assignment.countries (name, population, capital) value ('China','1382','Beijing'),
('India', '1326','Delhi'),
('United States','324',	'Washington D.C.'),
('Indonesia','260','Jakarta'),
('Brazil','209', 'Brasilia'),
('Pakistan', '193',	'Islamabad'),
('Nigeria',	'187', 'Abuja'),
('Bangladesh', '163', 'Dhaka'),
('Russia', '143', 'Moscow'),
('Mexico', '128', 'Mexico City'),
('Japan', '126', 'Tokyo'),
('Philippines', '102', 'Manila'),
('Ethiopia', '101',	'Addis Ababa'),
('Vietnam', '94', 'Hanoi'),
('Egypt','93', 'Cairo'),
('Germany', '81', 'Berlin'),
('Iran', '80', 'Tehran'),
('Turkey', '79', 'Ankara'),
('Congo', '79',	'Kinshasa'),
('France', '64', 'Paris'),
('United Kingdom','65',	'London'),
('Italy','60', 'Rome'),
('South Africa', '55', 'Pretoria'),
('Myanmar', '54', 'Naypyidaw');

/* c) Change ‘Delhi' to ‘New Delhi' */
update big_countries set capital = 'New Delhi' where population = 1326;

/* 4. Rename the table countries to big_countries .*/
rename table countries to big_countries; 

/* 5. Create the following tables. Use auto increment wherever applicable 
   6. Enter some records into the three tables.*/
create table assignment.product
(
product_id int not null auto_increment,
product_name varchar(255) not null unique,
description text,
supplier_id int,
FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id),
primary key (product_id));
INSERT INTO product (product_name, description, supplier_id)
VALUES ('Furniture', 'Description for Furniture', 1),
       ('Table', 'Description for table', 2),
       ('Book', 'Description for Book', 3);
select * from product;

CREATE TABLE suppliers (
  supplier_id INT PRIMARY KEY AUTO_INCREMENT,
  supplier_name VARCHAR(255) NOT NULL,
  supplier_location VARCHAR(255)
);
INSERT INTO suppliers (supplier_name, supplier_location)
VALUES ('Ajit', 'Mumbai'),
       ('Rajesh', 'Pune'),
       ('Sumit', 'Surat');
select*from suppliers;

CREATE TABLE stock (
  id INT PRIMARY KEY AUTO_INCREMENT,
  product_id INT,
  balance_stock INT,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);
alter table stock
auto_increment = 1000;
INSERT INTO stock (product_id, balance_stock)
VALUES (1, 1000),
       (2, 5000),
       (3, 2000);

/* 7. Modify the supplier table to make supplier name unique and not null.*/
alter table suppliers modify column supplier_name varchar(255) not null unique;
desc suppliers;

/* 8. Modify the emp table as follows

a.	Add a column called deptno

b. Set the value of deptno in the following order

deptno = 20 where emp_id is divisible by 2
deptno = 30 where emp_id is divisible by 3
deptno = 40 where emp_id is divisible by 4
deptno = 50 where emp_id is divisible by 5
deptno = 10 for the remaining records. */
select *from emp;
alter table emp add deptno int;
update emp
set deptno = case
when emp_no % 2 = 0 then 20
when emp_no % 3 = 0 then 30
when emp_no % 4 = 0 then 40
when emp_no % 5 = 0 then 50
else 10
end;

/* 9. Create a unique index on the emp_id column. */
create unique index empid_index
on employee (empid);
desc employee;

/* 10. Create a view called emp_sal on the emp table by selecting the following fields in the order of highest salary to the lowest salary.
emp_no, first_name, last_name, salary */
create view emp_sal as
select emp_no, first_name, last_name, salary from emp
order by salary desc;

select * from emp_sal; 


-- assignment 2 
-- Q.1 select all employees in department 10 whose salary is greater than 3000. [table: employee]
select * from employee;
select * from employee where deptno = 10 and salary >3000;

/* Q.2 The grading of students based on the marks they have obtained is done as follows:

40 to 50 -> Second Class
50 to 60 -> First Class
60 to 80 -> First Class
80 to 100 -> Distinctions */

select * from students;
Alter table students
add Grading varchar (25) after marks;

update students
set Grading = case
when marks >= 40 and marks < 50 then "Second Class"
	when marks >= 50 and marks < 60 then "First Class"
	when marks >= 60 and marks < 80 then "First Class"
	when marks >= 80 and marks <= 100 then "Distinctions"
	else 'fail'
end;

select * from students;

# a. How many students have graduated with first class?

select count(grading) as Total_Stud from students
where grading = 'First Class';

# b. How many students have obtained distinction? 

select count(id) from students
where grading = 'Distinctions';

/* 3. Get a list of city names from station with even ID numbers only. Exclude duplicates from your answer.[table: station]*/
select * from station;
select distinct city, id from station
where id % 2 = 0;

/*4. Find the difference between the total number of city entries in the table and the number of distinct city entries in the table. In other words, if N is the number of city entries in station, and N1 is the number of distinct city names in station, write a query to find the value of N-N1 from station.
[table: station]*/
select count(city) - count(distinct city) as diffrences from station;

/*5. Answer the following
a. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result cannot contain duplicates. [Hint: Use RIGHT() / LEFT() methods ]*/
 select * from station;
select distinct city from station
where left(city, 1) in ('A', 'E', 'I', 'O', 'U');

/*b. Query the list of CITY names from STATION which have vowels (i.e., a, e, i, o, and u) as both their first and last characters. Your result cannot contain duplicates.*/
select distinct city from station
where left(city, 1) in ('A', 'E', 'I', 'O', 'U') and right(city, 1) in ( 'a', 'e', 'i', 'o', 'u');

/*c. Query the list of CITY names from STATION that do not start with vowels. Your result cannot contain duplicates.*/
select distinct city from station
where left(city, 1) not in ('A', 'E', 'I', 'O', 'U');

/*d. Query the list of CITY names from STATION that either do not start with vowels or do not end with vowels. Your result cannot contain duplicates. [table: station]*/
select distinct city from station
where left(city, 1) not in ('A', 'E', 'I', 'O', 'U') and right(city, 1) not in ( 'a', 'e', 'i', 'o', 'u');


/*6. Write a query that prints a list of employee names having a salary greater than $2000 per month who have been employed for less than 36 months. Sort your result by descending order of salary. [table: emp]*/
select * from emp;
select * from emp where salary > 2000 and hire_date < date_sub(current_date, interval 36 month)
order by salary desc;

/*7. How much money does the company spend every month on salaries for each department? [table: employee]*/
select * from employee;
select deptno, sum(salary) as total_salary from employee
group by 1;

/*8. How many cities in the CITY table have a Population larger than 100000. [table: city]*/
select * from city;
 select * from city where population > 100000;
 
 /*9. What is the total population of California? [table: city]*/
 select sum(population) as total, district from city 
 where district = 'california';
 
 /*10. What is the average population of the districts in each country? [table: city]*/
 select avg(population) as avg_population, district from city
 group by district;
 
 /*11. Find the ordernumber, status, customernumber, customername and comments for all orders that are ‘Disputed=  [table: orders, customers]*/
 select * from orders;
select * from customers;
select o.orderNumber, o.status, o.comments, c.customerName from orders o 
left join customers c on c.customerNumber = o.customerNumber
where comments like '%disputed%';

-- Assignment 3
-- Q.1 Write a stored procedure that accepts the month and year as inputs and prints the ordernumber, orderdate and status of the orders placed in that month. 
DELIMITER //
Create procedure order_status( IN t_year INT, IN t_month INT )
begin
select orderNumber, orderdate, status from orders
where year(orderDate) = t_year AND month(orderDate) = t_month;
END //
DELIMITER ;

call order_status(2004, 1);

/*2. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]

if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
if amount > 50000 Platinum.*/
select * from payments;
select *,
case
when amount < 25000 then 'Silver'
when amount between 25000 and 50000 then 'Gold'
else 'Platinum'
end as  Status
from payments;

DELIMITER //
create procedure customer_status( cust_No INT )    
begin
select case
when amount < 25000 then 'Silver'
when amount between 25000 and 50000 then 'Gold'
else 'Platinum'
end as Status
from payments
where customerNumber = cust_No;
END //
DELIMITER ;

CALL customer_status( 103 );

/*b. Write a query that displays customerNumber, customername and purchase_status from customers table.*/
select c.customerNumber, c.customerName, o.status from customers c
left join orders o on o.customerNumber = c.customerNumber;

/*3. Replicate the functionality of 'on delete cascade' and 'on update cascade' using triggers on movies and rentals tables. Note: Both tables - movies and rentals - don't have primary or foreign keys. Use only triggers to implement the above.*/
DELIMITER //
create trigger delete_cascade
after delete on movies
for each row 
begin
update rentals
set movieid = null
where movieid
not in(select distinct id from movies );
end //
DELIMITER ;

drop trigger if exists delete_cascade;
select * from movies;

insert into movies(id, title, category )
Values ( 11, 'Avenger', 'Action');

insert into rentals ( memid, first_name, last_name, movieid ) 
Values (9, 'Peter', 'Garcia', 11 );

delete from movies where id = 11;

select id from movies;

select * from rentals;

DELIMITER //
create trigger update_cascade
after update on movies for each row
begin
update rentals
set movieid = new.id
where movieid = old.id;
end //
DELIMITER ;

drop trigger if exists update_cascade;

insert into movies (id, title, category )
Values ( 12, 'Avenger', 'Action'); 

update rentals
set movieid = 12
where memid = 9;

update movies
set id = 11
where title regexp 'Avenger';

select * from movies;

select * from rentals;

/*4. Select the first name of the employee who gets the third highest salary. [table: employee] */
select * from employee
order by salary desc
limit 2,1;

/*5. Assign a rank to each employee  based on their salary. The person having the highest salary has rank 1. [table: employee]*/
select *, dense_rank () OVER (order by salary desc) as salary_rank from employee;








