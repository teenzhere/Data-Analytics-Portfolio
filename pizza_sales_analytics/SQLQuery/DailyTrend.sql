--Daily trend (total orders in each day of the week)
select DATENAME(DW, order_date) as day_of_week,
  count(distinct order_id)as total_orders_dw 
  from dbo.pizza_sales
  group by DATENAME(DW, order_date)
  order by total_orders_dw DESC;
