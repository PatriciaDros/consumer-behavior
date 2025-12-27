# LuminaStyle Consumer Churn & Lifetime Value Analysis

## Company & Scenario

LuminaStyle is a fictitious ecommerce fashion retailer experiencing customer churn. While overall sales remain stable, leadership is concerned that customers may be disengaging and that valuable customers could be leaving the platform.

The analytics team was asked to analyze customer behavior and lifetime value data to better understand:

- How churned customers differ from active customers
- Whether high-value customers are being lost
- Which patterns may indicate churn risk

---

## Problem Statement

The goal of this analysis is to identify behavioral and financial differences between active and churned customers, with a focus on understanding whether high-value customers are churning and what signals precede churn.

---

## Dataset

- Source: Kaggle (Ecommerce Customer Churn Dataset)
- Total customers: 22,936
- Key variables include:
  - Login frequency
  - Total purchases
  - Average order value
  - Cart abandonment rate
  - Days since last purchase
  - Lifetime value (LTV)
  - Demographic and engagement metrics
  - Churn indicator

---

## Tools & Technologies

- **MySQL**

  - Data exploration
  - Aggregations
  - Churn segmentation
  - Quartile analysis (NTILE)

- **Python (pandas, matplotlib, seaborn)**
  - Validation of SQL results
  - Median and quartile analysis
  - Visualizations (boxplots, summary tables)

---

## Analytical Approach

1. Segmented customers into active and churned groups.
2. Compared behavioral metrics between the two groups.
3. Analyzed Lifetime Value using averages, medians, and quartiles.
4. Used visualizations to identify outliers and distribution differences.
5. Translated findings into executive- and technical-level insights.

---

## Key Findings

### Behavioral Metrics

- Active customers log in more frequently and make more total purchases.
- Churned customers have:
  - Higher cart abandonment rates
  - Longer time since last purchase
- These patterns align with expected churn behavior.

### Average Order Value

- Churned customers spend **more per order** than active customers.
- This result is counterintuitive and suggests disengagement is not driven by low spending.

### Lifetime Value (LTV)

- Average LTV is higher for churned customers than for active customers.
- Quartile analysis shows that churn is driven in part by the loss of **high-value customers in the top LTV quartile**.
- This indicates LuminaStyle is losing a small but financially significant segment of its customer base.

---

## Business Implications

- Churn is not limited to low-value customers.
- Retention efforts should prioritize high-LTV customers.
- Further analysis is recommended to understand which products or pages attract high-value churned customers and why they fail to remain engaged.

---
