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

Create View CustomerOrderwithProduct
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
on c.productCode=d.productcode;

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
on c.productCode=d.productcode;

select Customernumber, orderNumber,cost
from customerorderwithproduct;


select Customernumber, orderNumber,sum(cost)  
from customerorderwithproduct
group by customernumber, ordernumber;

select Customernumber, orderNumber,sum(cost)  
from customerorderwithproduct
group by ordernumber, customernumber ;

select Customernumber, sum(cost)  
from customerorderwithproduct
group by customernumber;

/**
Left, Right, Self, Full Outer
Union
Sum, Avg, Count
Min, Max
Like
Having
CTE
Sub query- Exist
Nested Query

**/
select count(*) from employees;
select Count(*) from offices;

Create view offices_USA
as
select * from offices
where country='USA';

select e.employeenumber,firstname, lastname, e.officecode, addressline1 
from employees e
inner join offices  o
on e.officecode=o.officecode;

select e.employeenumber,firstname, lastname, e.officecode, addressline1 
from employees e
join offices  o
on e.officecode=o.officecode;

select e.employeenumber,firstname, lastname, e.officecode, addressline1, city
from employees e
left join offices_usa  o
on e.officecode=o.officecode;

select e.employeenumber,firstname, lastname, e.officecode, addressline1, city
from employees e
right join offices_usa  o
on e.officecode=o.officecode;

select * 
from offices_usa
;

select CustomerName, orderdate
from Customers c
Full outer join  orders o
on c.customernumber=o.customernumber

Create view offices_INT
as
select * from offices
where country<>'USA';

select * from offices
union all
select * from offices_USA
union all
select * from offices_INT

with CTE as
(
select c.customernumber, CustomerName, ordernumber, orderdate
from Customers c
join  orders o
on c.customernumber=o.customernumber 
where creditlimit >200000
)
select *
from Cte

with CTE as
(
select c.customernumber, CustomerName, ordernumber, orderdate
from Customers c
join  orders o
on c.customernumber=o.customernumber 
where creditlimit >200000
)
select a.ordernumber , productname, p.*
from Cte
join orderdetails a
on cte.ordernumber=a.ordernumber
join  products p
on a.productcode=p.productcode

with cte as
(
select e.officecode,firstname,  jobtitle
from employees as e
inner join offices  as o
on e.officecode=o.officecode
)
select officecode,firstname,  jobtitle
from cte
where jobtitle='President'

Select * from customers 
where state in
(
select state from Offices where country ='USA'
)

select * from products where productname like '%Ford%'