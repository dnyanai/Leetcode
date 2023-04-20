select c.name as Customers 
from customers c
where id not in (select customerId from orders);


