--Top 5 pizza category which generated most revenue
  select TOP 5 pizza_name ,sum(total_price)as total_revenue
  from pizza_sales group by pizza_name
   order by  total_revenue DESC ;
