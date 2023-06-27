/* 

Suppose you’re an analyst for an e-commerce store. You’re trying to identify the top selling products in Q4 2017 by 
region, and you have 2 tables that you can query:

Table: all_products

Column Name	Data Type	Description
product_id	integer		id of the product
product_name	string		name of the product
sku		integer		universal stock keeping unit number
distributor_id	integer		id for distributor

Table: orders

Column Name	Data Type	Description
date		string		format is "YYYY-MM-DD"
user_id		integer		id of purchaser
order_id	integer		id of order number
product_id	integer		id of product
no_units	integer		number of units sold in the order
price		integer		price per item
shipping_id	integer		id of shipment
region		string		region being shipped to

Using the tables above, write a SQL query to find the top 5 selling products (in terms of total units sold) by region in 
Q4 of 2017. Include both the distributor id as well as the name of the product in your results. 
*/

-- find the TOP 5 selling products in terms of total units sold in Q4 2017 by region
--		what? 		    when?	by?

--Solution: 

/*CTE objective: To get the ranking of products by region*/
with product_rank as (
    select
	    o.product_id,
        dense_rank() over(order by sum(o.no_units) desc) as top_rank
from orders o
where 
	extract('year' from o.date::date) = 2017
	and extract('quarter' from o.date::date) = 4
group by
    o.region,
    o.product_id
)
/*
Select is getting the Top 5 products, since output requires distributor_id as well we are joining with all_products table
*/
select
    pr.product_id,
    p.distributor_id
from product_rank pr
    join all_products p
    on p.product_id = pr.product_id
where
	pr.top_rank < 6;

