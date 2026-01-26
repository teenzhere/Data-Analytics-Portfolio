--Sales percent by  pizza size

select  pizza_size,sum(total_price)as total_sales  ,
  sum(total_price)*100/(select cast (sum(total_price)as decimal(10,2)) from dbo.pizza_sales)as percent_sales 
  from dbo.pizza_sales
  group by pizza_size
  order by percent_sales ; 
