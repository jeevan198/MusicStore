-- Query 1 --
-- list of clients that spent more than the average spent by client in the past month
-- using joins
select CONCAT(customers.customerFname, ' ', customers.customerLname) AS "Customer's Name", customers.customerId, (shipAmount + taxAmount) as totalAmount
from customers join orders on
customers.customerId = orders.customers_customerId
where (shipAmount + taxAmount) > (( select avg(shipAmount + taxAmount) from orders)) And (orderDate between '2021-02-25 22:59:52' and '2021-03-03 22:59:52');


-- query 2 -- 
-- The top sold products  over a week
select p.productName, oi.quantity, oi.itemId
from products p join order_items oi
on p.order_items_itemId=oi.itemId
-- where
order by quantity 
limit 1;

-- and least sold products over a week
select p.productName, oi.quantity, oi.itemId 
from products p join order_items oi
on p.order_items_itemId=oi.itemId
order by quantity desc
limit 1;

-- Query 3 -- answer for the 3rd qsn
-- The maximum price of products in the same genre 
-- GROUP BY to list all the genres and their maximum price.
SELECT categoryName, MAX(itemPrice) AS "Maximum Price Of a Product"
from products p join order_items oi
on p.order_items_itemId=oi.itemId
join categories c
on c.categoryId=p.categories_categoryId
group by categoryName;


-- Query 4 --
-- List of customers the system has by location and sorting them
select COUNT(customerFname) AS "Count Of Customers" ,city, location
from customers  join music_store 
On customers.music_store_storeId=music_store.storeId
join address 
on music_store.storeId=address.music_store_storeId
group by city
order by location asc;

-- Query 5 -- 
-- List of products the store has sold for a particular month.
select productName, orderDate, quantity
from products p join order_items oi
on p.order_items_itemId=oi.itemId
join orders o
on oi.orders_orderId=o.orderId
where orderDate between '2021-02-25 22:59:52' and '2021-03-03 22:59:52';


-- Query 6 --
-- List of distinct albums each singer has.
select singer_name, a.genre AS "Album Type" 
from singer s join audio a
On s.singerId=a.singer_singerId
join video v
on s.singerId=v.singer_singerId

UNION

select singer_name, v.genre AS "Album Type" 
from singer s join audio a
On s.singerId=a.singer_singerId
join video v
on s.singerId=v.singer_singerId;


-- Query 7 --
-- List of copies of an album are available of a particular singer.
select singer_name, count(audioId) AS "Audio Album", count(videoId) AS "Video Album" 
from singer s join audio a
On s.singerId = a.singer_singerId
join video v
on s.singerId=v.singer_singerId
group by singer_name;


-- Query 8 --
 -- list the employee details who works in Branch 4 --
 select employeeName, employeePhoneNumber, employeeAge, storeId from employees 
 inner join music_store on employees.music_store_storeId = music_store.storeId
 where music_store.storeId=4;


-- Query 9 --
-- list the count of orders for each customers and displaying customerId, CustomerName, NoOfOrders  and grouping by customerId

select customers.customerId, CONCAT(customerFname,' ', customerLname) AS customerName, count((orders.customers_customerId)) as NoOfOrders

from customers inner join orders on customers.customerId = orders.customers_customerId 

group by customers.customerId;