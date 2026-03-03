--Total Customers
Select count(DISTINCT customer_id) as Total_Customers
 from shopping_data;

--Total Revenue
Select SUM(purchase_amount)as Total_Revenue from shopping_data;

--Average Purchase Amount
Select cast(SUM(purchase_amount *1.0)/ count(customer_id)as decimal(10,2))
as Avg_purchase_amount 
from shopping_data
Select CAST(AVG(purchase_amount) AS DECIMAL(10,2))as Avg_purchase_amount from shopping_data;

--Average Review Rating
Select AVG(review_rating) as Avg_review_rating from shopping_data;

--Revenue by age group
Select age_group,sum(purchase_amount)Revenue 
from shopping_data 
group by age_group;

--Revenue by gender
Select gender,sum(purchase_amount)Revenue 
from shopping_data 
group by gender;

--Revenue by Category
Select category,sum(purchase_amount)Revenue 
from shopping_data 
group by category;

--Purchase freq distribution
Select frequency_of_purchases,
count(DISTINCT customer_id)as customer_count
from shopping_data 
group by frequency_of_purchases;

--Revenue split by Category and age group
SELECT
    category,
    age_group,
    SUM(purchase_amount) AS total_revenue,
    COUNT(*) AS total_transactions,
    CAST(SUM(purchase_amount) * 1.0 / COUNT(*) AS DECIMAL(10,2)) AS avg_purchase
FROM shopping_data
GROUP BY category, age_group
ORDER BY category, age_group;

--Revenue distribution by Purchase Tier
SELECT 
    purchase_tier,
    SUM(purchase_amount) AS revenue_per_tier,
    CAST(
        SUM(purchase_amount) * 100.0 
        / CAST(SUM(SUM(purchase_amount)) OVER () AS DECIMAL(12,2))
    AS DECIMAL(5,2)) AS revenue_percent
FROM shopping_data
GROUP BY purchase_tier
ORDER BY revenue_percent DESC;

--Top 5 Products by Rating 

SELECT TOP 5
    item_purchased,
    COUNT(*) AS total_purchases,
    AVG(CAST(review_rating AS DECIMAL(4,2))) AS avg_rating
FROM shopping_data
GROUP BY item_purchased
ORDER BY avg_rating DESC, total_purchases DESC;

--Compare average purchase amount between Standard and Express

SELECT 
    shipping_type,
    COUNT(*) AS total_orders,
    CAST(AVG(CAST(purchase_amount AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS avg_purchase_amount
FROM shopping_data
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type;

----Subscribers vs Non-Subscribers
--Average spend + total revenue
SELECT 
    subscription_status,
    COUNT(*) AS total_orders,
    CAST(AVG(CAST(purchase_amount AS DECIMAL(10,2))) AS DECIMAL(10,2)) AS avg_spend,
    SUM(purchase_amount) AS total_revenue
FROM shopping_data
GROUP BY subscription_status;

-- Discount-Dependent Products
--Top 5 products with highest % of discounted purchases

SELECT TOP 5
    item_purchased,
    COUNT(*) AS total_orders,
    SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) AS discounted_orders,
    CAST(
        100.0 * SUM(CASE WHEN discount_applied = 'Yes' THEN 1 ELSE 0 END) 
        / COUNT(*) 
    AS DECIMAL(5,2)) AS discount_percentage
FROM shopping_data
GROUP BY item_purchased
ORDER BY discount_percentage DESC;

--Customer Segmentation
--New / Returning / Loyal (based on Previous Purchases)
--Example logic:
--New = 1 previous purchases
--Returning = 2–5
--Loyal = >5

select * from shopping_data where previous_purchases=0
SELECT
    CASE 
        WHEN previous_purchases = 1 THEN 'New'
        WHEN previous_purchases BETWEEN 1 AND 5 THEN 'Returning'
        ELSE 'Loyal'
    END AS customer_segment,
    COUNT(DISTINCT customer_id) AS total_customers
FROM shopping_data
GROUP BY
    CASE 
        WHEN previous_purchases = 1 THEN 'New'
        WHEN previous_purchases BETWEEN 1 AND 5 THEN 'Returning'
        ELSE 'Loyal'
    END
ORDER BY total_customers DESC;


--Top 3 Products per Category

WITH ranked_products AS (
    SELECT
        category,
        item_purchased,
        COUNT(*) AS total_purchases,
        ROW_NUMBER() OVER (
            PARTITION BY category 
            ORDER BY COUNT(*) DESC
        ) AS rank_num
    FROM shopping_data
    GROUP BY category, item_purchased
)
SELECT *
FROM ranked_products
WHERE rank_num <= 3
ORDER BY category, rank_num;

--Repeat Buyers & Subscriptions
--Are customers with >5 purchases more likely to subscribe?

SELECT
    subscription_status,
    COUNT(DISTINCT customer_id) AS total_customers
FROM shopping_data
WHERE previous_purchases > 5
GROUP BY subscription_status;