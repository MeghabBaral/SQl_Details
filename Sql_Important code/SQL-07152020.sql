use classicmodels;

SELECT customerName, phone,country, city , creditLimit
FROM classicmodels.customers
where country='USA'
limit 100;

SELECT customerName, phone,country, city , creditLimit
FROM classicmodels.customers
where country='USA' and creditLimit > 100000
limit 100;

SELECT customerName, phone,country, city , creditLimit
FROM classicmodels.customers
where country='USA' or creditLimit > 100000
limit 100;

SELECT customerName, phone,country, city , creditLimit
FROM classicmodels.customers
where country='USA' or creditLimit > 100000
order by country, creditLimit 
limit 100;

select a.customerNumber, customerName, phone,country, city , creditLimit, b.orderNumber, 
orderDate, productName, quantityOrdered, priceEach
from customers as a 
join orders  as b
on a.customerNumber=b.customerNumber
join orderdetails as c
on c.orderNumber=b.orderNumber
join products as d
on c.productCode=d.productcode
limit 10;

select creditlimit from customers order by creditlimit;

Create View CustomerOrderwithProduct11
as
select a.customerNumber, customerName, phone,country, city , creditLimit, case when creditLimit=0 then 'No Credit'
when creditLimit>0 and creditLimit<50000 then 'Bronze'
when creditLimit>50000 and creditLimit<100000 then 'Silver'
when creditLimit>100000 and creditLimit<200000 then 'Gold'
else 'Platinum' end as 'CreditGroup', b.orderNumber, 
orderDate, productName, quantityOrdered, priceEach, quantityOrdered * Priceeach as cost 
from customers as a 
join orders  as b
on a.customerNumber=b.customerNumber
join orderdetails as c
on c.orderNumber=b.orderNumber
join products as d
on c.productCode=d.productcodecustomerorderwithproductcustomerorderwithproduct11
limit 10;

