<div align="center">

# 🛒 Zepto Data Analysis: End-to-End SQL Project

**Exploring, cleaning, and analysing quick-commerce inventory data with MySQL**

![MySQL](https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=mysql&logoColor=white)
![SQL](https://img.shields.io/badge/SQL-Data%20Analysis-orange?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Completed-success?style=for-the-badge)

</div>

---

## 📌 Table of Contents
- [Project Overview](#-project-overview)
- [Objectives](#-objectives)
- [Dataset Description](#-dataset-description)
- [Project Structure](#-project-structure)
- [Project Workflow](#-project-workflow)
- [Business Questions Answered](#-business-questions-answered)
- [Key SQL Concepts Used](#-key-sql-concepts-used)
- [How to Run](#-how-to-run)
- [Key Insights](#-key-insights)
- [Future Improvements](#-future-improvements)
- [Author](#-author)

---

## 📖 Project Overview

Quick-commerce platforms like **Zepto** manage thousands of SKUs across many categories, each with its own pricing, discounts, stock levels, and pack sizes. This project is a complete SQL data analysis workflow on a Zepto product-inventory dataset, from raw data exploration to business-focused insights.

The project follows a real-world analyst workflow:

**Data Exploration → Data Cleaning → Business Analysis**

---

## 🎯 Objectives

- Understand the structure and quality of the inventory dataset
- Detect and handle null values, invalid prices, and duplicate product names
- Standardise price units (paise → rupees)
- Answer practical business questions on pricing, discounts, stock availability, revenue, and inventory weight

---

## 📂 Dataset Description

| Property | Details |
|---|---|
| **Source file** | `zepto.csv` |
| **Rows** | 3,732 products |
| **Columns** | 9 |
| **Categories** | 14 |
| **Database / Table** | `analytics_db` / `zepto_data_analysis` |

### Column Dictionary

| Column | Description |
|---|---|
| `Category` | Product category (e.g., Munchies, Beverages, Dairy, Bread & Batter) |
| `name` | Product name |
| `mrp` | Maximum Retail Price (stored in **paise**, converted to ₹ during cleaning) |
| `discountPercent` | Discount offered on MRP (%) |
| `availableQuantity` | Units available in inventory |
| `discountedSellingPrice` | Final selling price after discount (paise → ₹) |
| `weightInGms` | Product weight in grams |
| `outOfStock` | Stock status flag (TRUE / FALSE) |
| `quantity` | Number of units per pack |

### Categories Covered
Fruits & Vegetables · Cooking Essentials · Munchies · Dairy, Bread & Batter · Beverages · Packaged Food · Ice Cream & Desserts · Chocolates & Candies · Meats, Fish & Eggs · Biscuits · Personal Care · Paan Corner · Home & Cleaning · Health & Hygiene

---

## 🗂 Project Structure

```
Zepto_Data_Analysis_SQL_End_To_End_Project/
│
├── zepto.csv                      # Raw dataset
├── Zepto_Data_Analysis_MYSQL.sql  # Complete SQL script (exploration, cleaning, analysis)
└── README.md                      # Project documentation
```

---

## 🔄 Project Workflow

### 1️⃣ Data Exploration
- Previewed the table and checked the total row count
- Checked for `NULL` values across all key columns
- Listed unique product categories
- Compared **in-stock vs out-of-stock** product counts
- Identified product names appearing multiple times (multiple SKUs/pack sizes)

### 2️⃣ Data Cleaning
- Found products with a **selling price of 0** (invalid records) and removed them
- Converted `mrp` and `discountedSellingPrice` from **paise to rupees** (÷ 100)

### 3️⃣ Data Analysis
Business-driven queries covering discounts, stock gaps, revenue, value-for-money, and inventory weight (see below).

---

## ❓ Business Questions Answered

| # | Business Question | Techniques Used |
|---|---|---|
| 1 | Which are the top 10 products with the highest discounts? | `GROUP BY`, `SUM`, `ORDER BY`, `LIMIT` |
| 2 | Which high-MRP products (> ₹300) are out of stock? | `WHERE`, filtering, `DISTINCT` |
| 3 | What is the estimated revenue for each category? | `SUM(price × quantity)`, `GROUP BY` |
| 4 | Which products have MRP > ₹500 but discount < 10%? | Multi-condition `WHERE` |
| 5 | Which top 5 categories offer the highest average discount? | `AVG`, `ROUND`, `LIMIT` |
| 6 | What is the price per gram for products above 100g (best value)? | Calculated columns, `ORDER BY` |
| 7 | How can products be grouped into Low / Medium / Bulk by weight? | `CASE WHEN` |
| 8 | What is the total inventory weight per category? | `SUM(weight × quantity)`, `GROUP BY` |

---

## 🧠 Key SQL Concepts Used

- `SELECT`, `WHERE`, `DISTINCT`, `ORDER BY`, `LIMIT`
- Aggregate functions: `COUNT`, `SUM`, `AVG`, `ROUND`
- `GROUP BY` with `HAVING`
- `CASE WHEN` for segmentation
- `UPDATE` and `DELETE` for data cleaning
- Handling `NULL` values
- Calculated / derived columns and aliases

---

## ⚙️ How to Run

1. **Clone the repository**
   ```bash
   git clone https://github.com/<your-username>/Zepto_Data_Analysis_SQL_End_To_End_Project.git
   ```
2. **Create the database and import the data**
   ```sql
   CREATE DATABASE analytics_db;
   USE analytics_db;
   ```
   Import `zepto.csv` into a table named `zepto_data_analysis` (e.g., using MySQL Workbench's *Table Data Import Wizard*).
3. **Run the SQL script**
   Open `Zepto_Data_Analysis_MYSQL.sql` in MySQL Workbench and execute it section by section.

> ⚠️ **Note:** The cleaning step (`UPDATE ... mrp/100`) should be run **only once**, otherwise prices will be divided by 100 again.

---

## 💡 Key Insights

> Add your own findings here after running the queries, for example:

- Which categories generate the highest estimated revenue
- Which categories give the deepest average discounts
- High-priced products that are frequently out of stock (lost-sales risk)
- Premium products (> ₹500) with very low discounts
- Categories that hold the heaviest inventory by weight

---

## 🚀 Future Improvements

- Add window functions (`RANK`, `DENSE_RANK`) for category-wise top products
- Use CTEs and subqueries for more advanced analysis
- Build a Power BI / Tableau dashboard on top of the cleaned data
- Create indexes and views to optimise frequently used queries

---

## 👤 Author

**Pinjari Mohammed Ashraf**
📧 pinjarimohammedashraf@gmail.com

⭐ *If you found this project useful, please consider giving it a star!*
