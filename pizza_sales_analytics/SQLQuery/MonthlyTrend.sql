 --Monthly trend(Total orders in each month)
  select DATENAME(MONTH, order_date) as month_name,
  count(distinct order_id)as total_orders_month
  from dbo.pizza_sales
  group by DATENAME(MONTH, order_date)
  order by total_orders_month DESC;
