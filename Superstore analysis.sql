select * from superstore_analysis limit 10;

#Which categories generate the highest revenue?
select category, sum(sales) as total_sales from superstore_analysis 
group by category
order by total_sales;

#Which categories are losing money?
select category, sum(profit) as total_profit
from superstore_analysis
group by category
order by total_profit;

#Which state generate maximum sales?
SELECT state,
SUM(Sales) AS total_sales
FROM superstore_analysis
GROUP BY state
ORDER BY total_sales DESC;

#Does high discount reduce profit?
select discount, avg(profit) as avg_profit 
from superstore_analysis
group by discount
order by discount;

#Which products should the company stop selling?
select product_name, sum(sales) as total_sales,
 sum(profit) as total_profit
from superstore_analysis
group by product_name
having total_profit<0
order by total_profit;

#Monthly sales trend
select monthname(order_date) as Month_name,
sum(sales) as montly_sales from superstore_analysis
group by Month(order_date), monthname(order_date)
order by Month(order_date);