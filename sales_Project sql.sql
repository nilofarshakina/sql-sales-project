SELECT * FROM sales.sales;
use sales;
-- Total Revenue
select sum(Price*quantity)as total_revenue from sales;
-- revenue by category
select category,sum(Price*quantity)as revenue from sales group by category;
-- Top Customer
select customer_name ,sum(Price*quantity) as total_spent from sales group by customer_name order by total_spent desc limit 1;
-- sales by region
select region,count(*)as orders,sum(price*quantity)as revenue from sales group by region;
-- Best selling product
select product,sum(quantity)as total_quantity from sales group by product order by total_quantity desc;
-- Customers who bought more than 40k
select customer_name from sales group by customer_name having sum(price*quantity)>40000;
-- Monthly sales trend
select date_format (order_date,'%y-%m')as month,sum(price*quantity)as revenue from sales group by month order by month;
-- Rank Customers(window function)
select customer_name,sum(price*quantity) as spent,rank() over (order by sum(price*quantity)desc)as rank_no from sales group by customer_name;
-- Customer Groups(case when)
select customer_name,sum(price*quantity)as spent,case when sum(price*quantity)>40000 then "Gold"when sum(price*quantity)>20000 then 'Silver' else 'normal'end as customer_group from sales group by customer_name;
-- Orders Per Customer
select customer_name,count(*)as order_count from sales group by customer_name;
-- Average Order value
select avg(price*quantity)as avg_order_value from sales;
-- Region With Highest Revenue
select region,sum(price*quantity) as revenue from sales group by region order by revenue desc limit 1;



