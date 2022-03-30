-- Q1: Find all the offices and display only their city, phone and country
select city, phone, country from offices;

-- Q2:  Find all rows in the orders table that mentions FedEx in the comments
select * from orders where comments like "%fedex%";

-- Q3: 3 - Show the contact first name and contact last name of all customers in descending order by the customer's name
select contactFirstName, contactLastName from customers
 order by contactFirstName desc

 -- Q4: 4 - Find all sales rep who are in office code 1, 2 or 3 and their first name or last name contains the substring 'son'
 select firstName, lastName from employees where officeCode IN (1,2,3) and (lastName like "%son%" or firstName like "%son%") and
 jobTitle like "sales rep";

 -- Q5: Display all the orders bought by the customer with the customer number 124, along with the customer name, the contact's first name and contact's last name.
 select orders.*, customerName, contactLastName, contactFirstName
 from orders join customers on orders.customerNumber = customers.customerNumber
 where orders.customerNumber = 124;

 -- Q6: Show the name of the product, together with the order details,  for each order line from the orderdetails table
 SELECT orderdetails.*, products.productName  FROM products JOIN orderdetails
ON products.productCode = orderdetails.productCode;

