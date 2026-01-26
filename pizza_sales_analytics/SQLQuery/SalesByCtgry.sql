--Percent sales for each category of Pizza
select  pizza_category,sum(total_price)as total_sales ,
  sum(total_price)*100/(select sum(total_price) from dbo.pizza_sales)as percent_sales
  from dbo.pizza_sales
  group by pizza_category
  order by total_sales desc ;
