# ---------------------------------- SQL CHALLENGES -------------------------------------------------

# Query 1 - How many customers do we have in each Signup_Quarter?
SELECT Signup_Quarter, COUNT(*) AS Total_Customers
FROM cust_churn
GROUP BY Signup_Quarter;

# Query 2 - How many churned customers do we have in each Signup_Quarter?
SELECT Signup_Quarter, COUNT(*) AS Churned_Customers
FROM cust_churn
WHERE Churned = 1
GROUP BY Signup_Quarter;

# Query 3 - What is the churn rate for each Signup_Quarter?
SELECT 
	Signup_Quarter, COUNT(*) AS total_customers,
    SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) / COUNT(*) AS Churn_Rate
FROM cust_churn
GROUP BY Signup_Quarter;