
--Top 5 pizza by total order
select TOP 5 pizza_name ,count(distinct order_id)as total_order
  from pizza_sales group by pizza_name
   order by  total_order DESC ;
