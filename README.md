[README.md](https://github.com/user-attachments/files/30541073/README.md)
# Spatial Analysis of Retail Sales Dashboard

## 📊 Project Description

This project analyzes the sales performance of a retail chain by integrating and processing raw transactional data using SQL, then visualizing it in an interactive Power BI dashboard. The objective was to identify profitability patterns by region, city, and product category, and to surface underperforming areas for business review.

> 📁 Dataset: [completează aici — ex: "Simulated retail dataset created for this project" SAU "Public dataset from Kaggle: [link]"]

## 🛠 Technologies Used

- **Data Cleaning & Preprocessing**: SQL (SQLite) — used for cleaning raw CSV data, handling nulls and duplicates, and standardizing formats before analysis.
- **Data Modeling & Storage**: SQLite — used for structuring relational tables (Products, Stores, Transactions, Customers) and creating optimized views for aggregation.
- **Data Visualization**: Power BI — used to build the interactive dashboard, including a Decomposition Tree for root-cause analysis.
- **Version Control**: Git & GitHub.

## 📈 Analysis Structure

The project followed these stages:

1. **Data Preparation**: Cleaned and imported raw CSV data into SQLite tables — [completează dacă ai cifre reale, ex: "removed X duplicate transaction records" / "handled Y missing region values"].
2. **SQL Modeling**: Built optimized SQL views to calculate:
   - Total sales and profit by region and city.
   - Profit margin percentage per product category.
3. **Visualization**: Built a multi-page Power BI dashboard including:
   - Sales and profit distribution analysis by region/category.
   - A Decomposition Tree for drill-down root-cause analysis.
   - Dynamic Year/Month filters for time-based comparison.

## 🖼️ Results Visualization

**General Dashboard – Page 1**
![General Analysis](https://github.com/andreeavasilica28-cloud/SPATIAL_SALES/raw/main/image_1aa15d.png)

**Detailed Analysis – Page 2 (Decomposition Tree)**
![Detailed Analysis](https://github.com/andreeavasilica28-cloud/SPATIAL_SALES/raw/main/image_1aa178.png)

## 💡 Key Conclusions

- The **East** region records the highest sales volume.
- The **Groceries** category consistently shows the highest profit margin, despite lower sales volume compared to Electronics or Fashion.
- The dashboard enables quick identification of underperforming cities and comparison of payment method efficiency.

## ▶️ How to Reproduce

1. Clone this repo.
2. Import the CSV files (`Products.csv`, `Stores.csv`, `Transactions.csv`, `customers.csv`) into SQLite.
3. Run the queries in `SPATIAL SALES.SQL` to build the analysis views.
4. Open `SPATIAL SALES.pbix` in Power BI to explore the dashboard.
