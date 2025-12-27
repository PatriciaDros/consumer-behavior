# Check out the ecommerce dataset
SELECT * FROM ecommerce_db.ecommerce_customer_churn_dataset;

USE ecommerce_db;
SHOW TABLES;

# Rename to something easier to work with
RENAME TABLE ecommerce_db.ecommerce_customer_churn_dataset
TO ecommerce_db.cust_churn;

# Check out the dataset again to ensure it is all there and looks good
SELECT * FROM cust_churn LIMIT 10;


# Query 1 - How many customers are active or churned
SELECT COUNT(*) AS total_customers
FROM cust_churn
GROUP BY Churned;


# Query 1 - Presented as percentages 
SELECT 
	COUNT(*) AS total_customers,
	SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) AS churned_customers, 
    ROUND(SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Pct_Churned_Customers,
    SUM(CASE WHEN Churned = 0 THEN 1 ELSE 0 END) AS active_customers,
    ROUND(SUM(CASE WHEN Churned = 0 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Pct_Active_Customers
FROM cust_churn;


# Query 2 - How many customers churn by quarter
SELECT 
	Signup_Quarter,
	COUNT(*) AS total_customers,
	SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) AS churned_customers, 
    ROUND(SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) / COUNT(*) * 100, 2) AS Pct_Churned_Customers
FROM cust_churn
GROUP BY Signup_Quarter
ORDER BY Signup_Quarter;


# Query 3 - Evaluate churn behavior metrics - Login Frequency, Total Purchases, Avg Order Total, Cart Abandonment Rate, Days Since Last Purchase
SELECT 
	Churned, 
	COUNT(*) AS customer_count,
    ROUND(AVG(Login_Frequency), 2) AS avg_login_frequency,
    ROUND(AVG(Total_Purchases), 2) AS avg_total_purchases,
    ROUND(AVG(Average_Order_Value), 2) AS avg_order_value,
    ROUND(AVG(Cart_Abandonment_Rate), 2) AS avg_cart_abandonment,
    ROUND(AVG(Days_Since_Last_Purchase), 2) AS avg_days_since_last_purchase
FROM cust_churn
GROUP BY Churned;


# Query 4 - Customer Lifetime Value Quartile Analysis
SELECT 
	Churned,
	COUNT(*) AS customer_count,
	ROUND(AVG(Lifetime_Value), 2) AS avg_ltv
FROM cust_churn
GROUP BY Churned;


SELECT 
    Churned,
    LTV_Quartile,
    COUNT(*) AS cust_count,
    ROUND(AVG(Lifetime_Value), 2) AS avg_ltv
FROM (
    SELECT 
        Churned,
        Lifetime_Value,
        NTILE(4) OVER (PARTITION BY Churned ORDER BY Lifetime_Value) AS LTV_Quartile
    FROM ecommerce_db.cust_churn
) AS sub
GROUP BY Churned, LTV_Quartile
ORDER BY Churned, LTV_Quartile;
