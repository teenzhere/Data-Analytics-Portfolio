select * from pizza_sales;
select sum(quantity)as TotalOrders, pizza_category from pizza_sales
group by pizza_category order by TotalOrders desc