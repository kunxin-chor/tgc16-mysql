-- select all columns
select * from employees;

-- display only certain columns
select firstName, lastName, email from employees;

-- select all job titles but remove duplicates
select distinct(jobTitle) from employees;

-- select columns and rename them at the same time
select firstName as "First Name",
  lastName as "Last Name",
  email as "Email" from employees;

-- use `where` to filter rows:
-- select all employees from officeCode 1
select * from employees where officeCode=1;

-- display the first name, last name and email from employees
-- working in officeCode 1
select firstName, lastName, email from employees where officeCode=1;

-- we can use `like` for string comparsion
select * from employees where jobTitle like "Sales Rep";

-- find all employees whose job title begins with "sales"
select * from employees where jobTitle like "Sales%";

-- find all employees whose job title end with "sales"
select * from employees where jobTitle like "%Sales";

-- find all employees whose job title has the sales anywhere
select * from employees where jobTitle like "%Sales%";

-- find all products whose name begins with 1969
SELECT * FROM products where productName like "1969%";

-- find all products whose name contains "Davidson" anywhere
SELECT * FROM products where productName LIKE "%Davidson%";

-- show all sales rep from office code = 1
SELECT * FROM employees where officeCode = 1 and jobTitle = "Sales Rep";

-- show all employees from office code 2
SELECT * FROM employees where officeCode = 1 or officeCode=2;

-- show all sales rep from office code 1 and 2
SELECT * FROM employees where (officeCode = 1 or officeCode=2) 
              and jobTitle="Sales Rep";

-- show all customers from USA in the state of NV who has
-- credit limit greater than 5000
SELECT * FROM customers where state="NV" 
      and country="USA" 
	  and creditLimit > 5000;

-- JOINS
-- display the first and last name of all employees along with their office address
select lastName, firstName, city, addressLine1, addressLine2 from employees JOIN offices
 ON employees.officeCode = offices.officeCode;

 -- display the first, last name, city, country and officecode
 -- NOTE: because there are two officeCode columns, we have to use the table
 -- name to specify which table to use
 SELECT firstName, lastName, city, country, employees.officeCode FROM
employees JOIN offices on employees.officeCode = offices.officeCode;

--- same as above, but only from USA and order by the first name in ASCENDING order
select firstName, lastName, city, country, employees.officeCode from employees JOIN offices
 ON employees.officeCode = offices.officeCode
 WHERE country="USA"
 ORDER BY firstName;

-- count how many customers have sales rep
-- due to inner join, for a row in the left hand table to appear in the joined table,
-- it must have a corresponding row in the right hand table
select count(*) from customers join employees 
	ON customers.salesRepEmployeeNumber = employees.employeeNumber

-- show all customers with their sales rep, even for customers with no sales rep
select * from customers left join employees 
	ON customers.salesRepEmployeeNumber = employees.employeeNumber;

-- AGGREGATES
-- find the average creditlimit among all customers
SELECT AVG(creditLimit) FROM customers;

-- count how many rows there are in the customers table
-- i.e how many customers there are
SELECT count(*) FROM customers;

-- select by date
SELECT * FROM payments where paymentDate > "2004-04-01"
SELECT * FROM payments where paymentDate >= "2004-04-01" and paymentDate <= "2005-04-01"

-- extract out the day, month and year component of a date
SELECT YEAR(paymentDate), MONTH(paymentDate), DAY(paymentDate), amount from payments;

-- find the total amount paid out in the month of June across all yeears
SELECT sum(amount) from payments where month(paymentDate) = 6;

-- show how many customers there per country
SELECT country, count(*) FROM customers GROUP BY country

-- show the average credit limit per country
SELECT country, avg(creditLimit) FROM customers GROUP BY country

-- show the average credit limit and number of customers per country:
SELECT country, avg(creditLimit), count(*) FROM customers GROUP BY country

-- show how  many times each product from the classic cars line
-- has been ordered
SELECT COUNT(*), products.productCode, productName FROM orderdetails
join products on products.productCode = orderdetails.productCode
where productLine = "Classic Cars"
group by productCode, productName
having count(*) >= 28
order by count(*) desc
limit 10;

-- Q8
select customerName, amount from customers join payments
on customers.customerNumber = payments.customerNumber
where country="USA"

-- or to display the sum per customer from USA
select sum(amount), customerName from 
  payments join customers
  on payments.customerNumber = customers.customerNumber
  where country="USA"
  group by customers.customerNumber, customerName

-- Q8
select count(*), state from offices join employees
on offices.officeCode = employees.officeCode
where offices.country = "USA"
group by state

-- Q9
select avg(amount), customerName from 
  payments join customers
  on payments.customerNumber = customers.customerNumber
  group by customers.customerNumber, customerName

-- Q10
select customerName, avg(amount), sum(amount) from customers
 join payments on customers.customerNumber = payments.customerNumber
group by customers.customerNumber
having sum(amount) >= 10000
order by avg(amount)

-- Q11
select sum(quantityOrdered), orderdetails.productCode, productName from orderdetails join products
 on orderdetails.productCode = products.productCode
 group by orderdetails.productCode, productName
 order by sum(quantityOrdered) DESC
 limit 10

-- Q12
select * from orders where orderDate BETWEEN "2003-01-01" AND "2003-12-31"
select * from orders where year(orderDate) =  "2003"

-- Q13
select MONTH(orderDate), COUNT(*) from orders join orderdetails
 ON orders.orderNumber = orderdetails.orderNumber
 WHERE YEAR(orderDate) = 2003
 GROUP BY MONTH(orderDate)

-- Q13B
select YEAR(orderDate), MONTH(orderDate), COUNT(*) from orders join orderdetails
 ON orders.orderNumber = orderdetails.orderNumber
 WHERE YEAR(orderDate) >= 2003 AND YEAR(orderDate) <=2004
 GROUP BY YEAR(orderDate), MONTH(orderDate)