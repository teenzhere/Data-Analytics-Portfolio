   --Top 5 pizza by total quantity
select TOP 5 pizza_name ,sum(quantity)as total_quantity
  from pizza_sales group by pizza_name
   order by  total_quantity DESC ;
