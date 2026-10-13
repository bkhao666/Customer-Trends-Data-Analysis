-- Customer shopping behavior analysis
USE customer_behavior;

-- 1. Revenue and average purchase by gender
SELECT
    gender,
    COUNT(*) AS customers,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase
FROM customer
GROUP BY gender
ORDER BY total_revenue DESC;

-- 2. Discounted purchases above the overall average purchase amount
SELECT customer_id, purchase_amount
FROM customer
WHERE discount_applied = 'Yes'
  AND purchase_amount > (SELECT AVG(purchase_amount) FROM customer)
ORDER BY purchase_amount DESC;

-- 3. Five highest-rated products
SELECT
    item_purchased,
    COUNT(*) AS customers,
    ROUND(AVG(review_rating), 2) AS average_product_rating
FROM customer
GROUP BY item_purchased
ORDER BY average_product_rating DESC
LIMIT 5;

-- 4. Standard versus Express shipping
SELECT
    shipping_type,
    COUNT(*) AS customers,
    ROUND(AVG(purchase_amount), 2) AS average_purchase
FROM customer
WHERE shipping_type IN ('Standard', 'Express')
GROUP BY shipping_type;

-- 5. Subscription performance
SELECT
    subscription_status,
    COUNT(*) AS customers,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase,
    ROUND(AVG(previous_purchases), 2) AS average_previous_purchases
FROM customer
GROUP BY subscription_status
ORDER BY total_revenue DESC;

-- 6. Products with the highest discount usage
SELECT
    item_purchased,
    COUNT(*) AS customers,
    ROUND(100 * AVG(discount_applied = 'Yes'), 2) AS discount_rate_pct
FROM customer
GROUP BY item_purchased
ORDER BY discount_rate_pct DESC
LIMIT 5;

-- 7. Customer lifecycle segments
WITH customer_segments AS (
    SELECT
        customer_id,
        purchase_amount,
        CASE
            WHEN previous_purchases = 1 THEN 'New'
            WHEN previous_purchases BETWEEN 2 AND 10 THEN 'Returning'
            ELSE 'Loyal'
        END AS customer_segment
    FROM customer
)
SELECT
    customer_segment,
    COUNT(*) AS customers,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase
FROM customer_segments
GROUP BY customer_segment
ORDER BY customers DESC;

-- 8. Three most-purchased products in each category
WITH item_counts AS (
    SELECT
        category,
        item_purchased,
        COUNT(*) AS total_orders,
        ROW_NUMBER() OVER (
            PARTITION BY category
            ORDER BY COUNT(*) DESC, item_purchased
        ) AS item_rank
    FROM customer
    GROUP BY category, item_purchased
)
SELECT category, item_purchased, total_orders
FROM item_counts
WHERE item_rank <= 3
ORDER BY category, item_rank;

-- 9. Repeat buyers by subscription status
SELECT
    subscription_status,
    COUNT(*) AS repeat_buyers
FROM customer
WHERE previous_purchases > 5
GROUP BY subscription_status;

-- 10. Revenue and average purchase by age group
SELECT
    age_group,
    COUNT(*) AS customers,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;

-- 11. Revenue and average purchase by category
SELECT
    category,
    COUNT(*) AS customers,
    ROUND(SUM(purchase_amount), 2) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;

