# 🚀 E-Commerce Sales Optimization (SQL-Based Analysis)

> Data-driven strategy to increase revenue and retention using SQL analytics

---

## 📊 Problem Statement

An e-commerce company generates **$1.77M+ in revenue**, yet shows a critical weakness:

**77% of customers make only one purchase**

Implications:

* Low customer lifetime value (CLTV)
* Inefficient acquisition spend
* Missed revenue from retention

---

## 🎯 Objective

Use SQL-based exploratory analysis to:

* Measure customer retention and behavior
* Identify revenue drivers and leakages
* Evaluate marketing and pricing strategies
* Detect operational and fraud risks

---

## 📦 Dataset Overview

| Metric           | Value   |
| ---------------- | ------- |
| Transactions     | 2,277   |
| Unique Customers | 1,100   |
| Products         | 8       |
| Revenue          | $1.77M+ |

Columns:

OrderID, Date, CustomerID, Product, Quantity, UnitPrice, TotalPrice,
ItemsInCart, PaymentMethod, OrderStatus, ReferralSource, CouponCode,
TrackingNumber, ShippingAddress

---

## 🔍 Key Analyses Performed (SQL)

### 1. Dataset Overview

* Total transactions, customers, products
* Revenue and Average Order Value (AOV)

### 2. Customer Retention

* One-time vs repeat customers
* Core insight: **high churn (77%)**

### 3. Coupon Impact

* AOV comparison (with vs without coupon)
* Identified **negative impact on revenue**

### 4. Marketing Channels

* Revenue and AOV per `ReferralSource`
* Email identified as **highest-performing channel**

### 5. Product Performance

* Revenue and AOV per product
* Result: **uniform performance → bundling opportunity**

### 6. Time Analysis

* Monthly revenue trends
* Seasonality patterns

### 7. Delivery Operations

* % of missing tracking numbers
* Identified **operational gap (~8%)**

### 8. Return Rate

* Distribution of `OrderStatus`
* Return rate ≈ **11%**

### 9. Customer Value

* Orders, total spend, AOV per customer
* Foundation for CLTV modeling

### 10. RFM Segmentation

* Recency, Frequency, Monetary scoring
* Enables targeting and personalization

### 11. Fraud Detection

* Outliers using statistical threshold
* ~1% suspicious transactions identified

### 12. Cart Behavior

* Average items per cart
* Input for upsell / bundling strategies

---

## 📈 Key Insights

### 1. Retention is the main issue

* Only **23% repeat customers**
* Largest growth lever

### 2. Coupons reduce profitability

* Lower AOV when coupons are used
* Misaligned discount strategy

### 3. Email drives the most value

* Highest revenue contribution
* Underutilized channel

### 4. Products perform uniformly

* No clear winner
* Opportunity for **cross-sell & bundles**

### 5. Operational inefficiency

* Missing tracking numbers
* Risk: customer dissatisfaction

### 6. Fraud risk exists

* Detectable via statistical anomalies
* Needs monitoring system

---

## 💡 Business Recommendations

### Priority 1 — Loyalty Program

* Goal: increase repeat purchases
* Expected impact: **+30–50% retention**

### Priority 2 — Coupon Strategy Redesign

* Reduce blanket discounts
* Introduce targeted incentives
* Impact: **+15–25% margin**

### Priority 3 — Email Optimization

* Scale high-performing channel
* Impact: **+20–30% revenue**

### Priority 4 — Product Bundling

* Increase cart size and AOV
* Impact: **+10–15% AOV**

### Priority 5 — Tracking Fix

* Eliminate missing tracking numbers
* Impact: reduced disputes and churn

### Priority 6 — Fraud Monitoring

* Deploy anomaly detection rules
* Reduce financial leakage

---

## 📊 Business Impact Estimate

| Action                | Impact          |
| --------------------- | --------------- |
| Retention improvement | +30–50%         |
| AOV increase          | +10–15%         |
| Email optimization    | +20–30% revenue |
| Coupon optimization   | +15–25% margin  |
| Total potential gain  | $200K – $500K+  |

---

## 🛠️ Tech Stack

* SQL Server (T-SQL)
* Analytical queries (CTE, window functions)
* Statistical detection (AVG, STDEV)

---

## 📁 Project Structure

```
ecommerce-sql-analysis/
│
├── sql/
│   └── eda_analysis.sql
│
├── data/
│   └── sales_data.xlsx
│
└── README.md
```

---

## 📌 Usage

1. Import dataset into SQL Server (`sales_data`)
2. Run `eda_analysis.sql`
3. Interpret outputs for decision-making

---

## 📊 Business Health Summary

| Area                 | Score |
| -------------------- | ----- |
| Revenue              | 80    |
| Retention            | 40    |
| Marketing Efficiency | 75    |
| Operations           | 70    |
| Data Quality         | 97    |

---

## 👤 Author

David Losasa
Data Analyst | Finance & Data Enthusiast
2026
