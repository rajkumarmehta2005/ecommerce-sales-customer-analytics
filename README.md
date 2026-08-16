# E-Commerce Sales & Customer Analytics

## 📊 Data Analyst Portfolio Project

An end-to-end E-Commerce Sales & Customer Analytics project analyzing sales, profitability, customers, products, and returns using Python, Pandas, MySQL, Excel, Power BI, and DAX.

---

## 🎯 Project Overview

The objective of this project is to transform e-commerce transactional data into actionable business insights.

The project covers:

* Sales performance
* Revenue and profit
* Customer performance
* Product performance
* Category analysis
* Monthly sales trends
* Returns and return reasons
* Profitability analysis

### Project Workflow

```text
Python/Pandas
      ↓
Data Cleaning
      ↓
Feature Engineering
      ↓
Excel
      ↓
MySQL Business Analysis
      ↓
Power BI
      ↓
DAX Measures
      ↓
Interactive Dashboard
      ↓
Business Insights
```

---

## 🛠️ Tools & Technologies

| Tool     | Purpose                               |
| -------- | ------------------------------------- |
| Python   | Data analysis and transformation      |
| Pandas   | Data cleaning and feature engineering |
| Excel    | Data preparation                      |
| MySQL    | Business analysis and SQL queries     |
| Power BI | Interactive dashboard                 |
| DAX      | Dynamic KPI calculations              |

---

## 📈 Key KPIs

| KPI             | Result |
| --------------- | -----: |
| Revenue         |   208M |
| Profit          |    49M |
| Orders          |  8,000 |
| Customers       |    500 |
| Units Sold      |    17K |
| Returned Orders |    651 |
| Return Rate     |  8.14% |

---

## 📊 Power BI Dashboard

The final Power BI report contains three pages.

### Page 1 — E-Commerce Executive Overview

* Revenue
* Profit
* Orders
* Return Rate
* Monthly Revenue
* Revenue by Category
* Profit by Category

### Page 2 — Product & Customer Performance

* Total Customers
* Total Products
* Total Units Sold
* Top 10 Customers
* Top Products
* Year and Category slicers

### Page 3 — Returns & Profitability Analysis

* Total Orders
* Returned Orders
* Return Rate
* Returns by Reason
* Returned Orders by Category
* Monthly Return Trend
* Revenue vs Cost by Category
* Year and Category slicers

---

## 🧮 DAX Measures

### Returned Orders

```DAX
Returned Orders =
DISTINCTCOUNT(returns[Order_ID])
```

### Total Orders

```DAX
Total Orders =
DISTINCTCOUNT(Sheet1[Order_ID])
```

### Return Rate

```DAX
Return Rate =
DIVIDE([Returned Orders], [Total Orders], 0)
```

The measures were tested with Year and Category slicers, and the KPI cards update dynamically.

---

## 🔗 Power BI Data Model

**Semantic Model:** `Ecommerce Project`

**Sales Table:** `Sheet1`

**Returns Table:** `returns`

**Relationship:**

```text
Sheet1[Order_ID] → returns[Order_ID]
```

**Relationship Type:** `1:1`

---

## 💡 Key Business Insights

### 1. Electronics is the strongest category

Electronics is the leading category in both revenue and profit.

### 2. Laptop Pro 14 is the top-performing product

Laptop Pro 14 ranks first by both revenue and profit.

### 3. June 2024 recorded the highest revenue

June 2024 was the best-performing month by revenue.

### 4. Riya Das is the highest-value customer

Riya Das is the top customer based on the project analysis.

### 5. Overall return rate is 8.14%

651 returned orders out of 8,000 total orders resulted in an 8.14% return rate.

### 6. Wrong Product is the leading return reason

This indicates a potential opportunity to improve product identification, order verification, picking, and packing processes.

### 7. Electronics has the most returned orders

Electronics is both the strongest sales category and the category with the highest return activity.

### 8. November 2025 had the highest return activity

This month should be investigated to understand the reasons behind the return spike.

---

## 💼 Business Recommendations

* Improve SKU verification and order-picking processes to reduce Wrong Product returns.
* Monitor Electronics closely because it contributes strongly to both revenue and returns.
* Analyze Laptop Pro 14 pricing, inventory, promotions, and return behavior.
* Investigate the factors behind the June 2024 revenue peak.
* Develop retention strategies for high-value customers.
* Investigate the November 2025 return spike.
* Monitor return rate by category alongside revenue and profit.

---

## 🧹 Data Cleaning & Analysis

Python/Pandas was used for:

* Data inspection
* Data cleaning
* Data type handling
* Missing/inconsistent data handling
* Date preparation
* Feature engineering
* Analytical dataset preparation

MySQL was used for:

* Revenue analysis
* Profit analysis
* Category analysis
* Product ranking
* Customer ranking
* Monthly trends
* Return analysis

---

## 📁 Project Structure

```text
ecommerce-sales-customer-analytics/
│
├── README.md
│
├── data/
├── python/
├── sql/
├── powerbi/
├── reports/
└── screenshots/
```

---

## 🚀 Future Improvements

* Customer RFM segmentation
* Customer Lifetime Value analysis
* Cohort analysis
* Sales forecasting
* Customer churn prediction
* Inventory analysis
* Machine Learning for demand prediction

---

## 🏁 Conclusion

This project demonstrates a complete Data Analyst workflow from data preparation to business decision-making.

It demonstrates practical skills in:

**Python | Pandas | SQL | MySQL | Excel | Power BI | DAX | Data Visualization | Business Analytics**

---

## 👨‍💻 Author

**Raj Kumar Mehta**

Data Analyst Portfolio Project

