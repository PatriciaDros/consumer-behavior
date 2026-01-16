# Check out the dataset again to ensure it is all there and looks good
SELECT * FROM cust_churn LIMIT 10;

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
	Signup_Quarter, COUNT(*) AS Total_Customers,
    SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) AS Churned_Customers,
    SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) / COUNT(*) AS Churn_Rate
FROM cust_churn
GROUP BY Signup_Quarter;

# Query 4 - True Ranking with Window Functions (Preview) not just GROUP BY or ORDER BY
SELECT
  Signup_Quarter,
  churn_rate,
  RANK() OVER (ORDER BY churn_rate DESC) AS churn_rank
FROM (
  SELECT
    Signup_Quarter,
    SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) / COUNT(*) AS churn_rate
  FROM cust_churn
  GROUP BY Signup_Quarter
) t;

SELECT
	Churned,
    AVG(Lifetime_Value) as AVG_ltv
FROM cust_churn
GROUP BY Churned;

SELECT
    Signup_Quarter,
    SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) / COUNT(*) AS churn_rate
FROM cust_churn
GROUP BY Signup_Quarter;

# Business Question -> Rank Signup_Quarters by churn rate, highest risk first.
SELECT 
	Signup_Quarter,
    COUNT(*) as Total_Customers,
    DENSE_RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_number
FROM cust_churn
GROUP BY Signup_Quarter;
# Why this is correct -> You aggregated first (COUNT(*)) -> Then you ranked the aggregated result
# The pattern is foundational GROUP -> then RANK (Burn that in. You’ll reuse it constantly.)

SELECT 
    Signup_Quarter,
    Churn_Rate,
    RANK() OVER (ORDER BY churn_rate DESC) AS Churn_Rank

FROM (
	SELECT 
		Signup_Quarter,
        SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) / COUNT(*) AS Churn_Rate
        FROM cust_churn
        GROUP BY Signup_Quarter
        ) t
ORDER BY Churn_Rank;
# Why the Subquery -> SQL order: FROM - WHERE - GROUP BY - SELECT - WINDOW FUNCTIONS - ORDER BY 
# You must compute churn_rate before ranking it.


# Find the top 3 cities in the US with the highest churn rate among customers with more than 1 year of membership, and rank them.
# INNER LAYER - Also confirmation my finished answer is correct
SELECT
	City,
	SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) / COUNT(*) AS Churn_Rate
FROM cust_churn
WHERE Country = 'USA' AND Membership_Years > 1
GROUP BY City
ORDER BY Churn_Rate desc
LIMIT 3;

# OUTER LAYER - Complete Answer
SELECT 
	City,
    RANK() OVER(ORDER BY Churn_Rate DESC) as Churn_Rank
FROM (
	SELECT
		City,
		SUM(CASE WHEN Churned = 1 THEN 1 ELSE 0 END) / COUNT(*) AS Churn_Rate
	FROM cust_churn
	WHERE Country = 'USA' AND Membership_Years > 1
	GROUP BY City) as t
LIMIT 3;
# Why This Works
# Churn_Rate exists before the RANK() sees it → avoids the “alias can’t be referenced” problem
# Filters + aggregation happen inside → clean separation of logic
# Outer query does only window / ranking / limiting → clear and readable

SELECT Lifetime_Value, Credit_Balance
FROM cust_churn
ORDER BY Lifetime_Value DESC
LIMIT 5;