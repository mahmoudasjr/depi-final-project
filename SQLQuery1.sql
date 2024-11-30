//--Retail Price Optimization Analysis........
------------------------------------------------


//--1. I need to know how many customers they are bought from us?

select sum(customers)
as "Total No of Customer"
from retail_price$

//--2. I need to know how many customers they are bought from us?

select count (distinct(product_id))
as "Total No of Product"
from retail_price$

//--3  I need to know how many Products we Have in our retail

select count (distinct [product_category_name])
as "Total No of product_category"
from retail_price$

//--4. I need to know how many quantities they are selling for the customers? 

select SUM([qty])
as "Total No of quantity selling"
from retail_price$

//--5. I need to know the Total sales?

select SUM ([total_price])
as "Total Sales"
from retail_price$

//--6. I need to know the Total freight Price

select SUM ([freight_price])
as "Total freight price"
from retail_price$

//--7. I need to know the different between the average price for each product this month and the past month 

select product_category_name as"product name",avg (unit_price) as "unit price" 
,avg(lag_price) as "lag unit price"
from retail_price$
group by [product_category_name] 
order by product_category_name asc
 
//--8. I need to know the total sales for each product category?

select product_category_name as"product name",SUM ([total_price]) as "Total Sales" 
from retail_price$
group by [product_category_name] 

//--9. I need to know the total freight price for each product category?

select product_category_name as"product name",SUM ([freight_price]) as "freight price" 
from retail_price$
group by [product_category_name] 

//--10. I need to know the No of quantity selling for each product category

select product_category_name as"product name",SUM ([qty]) as "Total No of quantity selling" 
from retail_price$
group by [product_category_name] 

//--11 I need to know the total sales for each month for each Product category?

select month_year as "month-year",SUM ([total_price]) as "Total Sales" 
from retail_price$
group by [month_year]

//--12 I need to know average weight for each product category?

select product_category_name as"product name",avg (product_weight_g) as "Average product weight" 
from retail_price$
group by [product_category_name]

//--13 I need to know the average user Rating for each product category?

select product_category_name as"product name",avg ([product_score]) as "Average user Rating" 
from retail_price$
group by [product_category_name]

//--14 I need to know total number of customers for each product category?

select product_category_name as"product name",sum ([customers]) as "Total No of customers" 
from retail_price$
group by [product_category_name]

//--15 I need to know the total number of product and quantity for each product category? 

select product_category_name as"product name",  COUNT (DISTINCT[product_id]) as "Total No of product", SUM ([qty]) as "Total quantity selling" 
from retail_price$
group by [product_category_name]

//--16 I need to know the Total No of product for each month for each Product category?

select month_year as "month-year",COUNT (DISTINCT[product_id]) as "Total No of product" 
from retail_price$
group by [month_year]

//--17 I need to know the different between  average unit price for us and for compatitors?

select product_category_name as"product name", Avg ([unit_price]) as "Average unit price", Avg ([comp_1]) as "Average unit price for first comp" 
,Avg ([comp_2]) as "Average unit price for second comp",Avg ([comp_3]) as "Average unit price for Third comp" 
from retail_price$
group by [product_category_name]

//--18 I need to know the different between  average User Rating for us and for compatitors?

select product_category_name as"product name", Avg ([product_score]) as "Average User Rating", Avg ([ps1]) as "Average User Rating for first comp" 
,Avg ([ps2]) as "Average User Rating for second comp",Avg ([ps3]) as "Average User Rating for Third comp" 
from retail_price$
group by [product_category_name]

//--19 I need to know the different between  average User Rating for us and for compatitors?

select product_category_name as"product name", Avg ([freight_price]) as "Average freight price", Avg ([fp1]) as "Average freight price for first comp" 
,Avg ([fp2]) as "Average freight price for second comp",Avg ([fp3]) as "Average freight price for Third comp" 
from retail_price$
group by [product_category_name]

//--20 I need to know the different between  average unit price for us and for compatitors for "health_beauty" product_category_name

select  Avg ([unit_price]) as "Average unit price", Avg ([comp_1]) as "Average unit price for first comp" 
,Avg ([comp_2]) as "Average unit price for second comp",Avg ([comp_3]) as "Average unit price for Third comp" 
from retail_price$
Where product_category_name like 'health_beauty'

