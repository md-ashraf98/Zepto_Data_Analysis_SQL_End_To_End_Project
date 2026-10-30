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

### 🔍 Data Exploration & Cleaning
- The dataset has **3,732 products** across **14 categories**, with **no NULL values**.
- **453 products (≈12.1%)** are out of stock; **3,279 (≈87.9%)** are available.
- **1,214 product names appear more than once**. The same product is listed in several pack sizes or variants, with up to **10 listings** for a single product (e.g., Quaker Oats).
- **1 invalid record** had a selling price of ₹0 (*Cherry Blossom Liquid Shoe Polish*) and was removed, leaving **3,731 clean rows**.
- Prices were stored in **paise** and converted to **rupees**.

### 🏷️ Discounts & Pricing
- The average discount across all products is **7.62%**, and the highest single discount is **51%**.
- **Top 5 categories by average discount:**

| Rank | Category | Avg. Discount |
|---|---|---|
| 1 | Fruits & Vegetables | **15.46%** |
| 2 | Meats, Fish & Eggs | **11.03%** |
| 3 | Packaged Food | 8.32% |
| 4 | Ice Cream & Desserts | 8.32% |
| 5 | Chocolates & Candies | 8.32% |

- **Home & Cleaning** offers the lowest average discount (**5.70%**), followed by Paan Corner and Personal Care (6.25%).
- The top discounted products are mostly **pasta, instant masalas, and gravy mixes** (Chef's Basket, Ceres Foods, Kitchens of India).
- **38 premium products (MRP > ₹500) have a discount below 10%**. These are mostly **edible oil jars** (Dhara, Saffola, Fortune) and **Surf Excel detergent**, so high-value staples are rarely discounted heavily.

### 📦 Stock & Inventory
- Only **4 high-MRP products (MRP > ₹300) are out of stock**:
  Patanjali Cow's Ghee (₹565), MamyPoko Pants Diapers XL (₹399), Aashirvaad Atta with Multigrains (₹315), and Everest Kashmiri Lal Chilli Powder (₹310). These are the highest revenue-risk items to restock first.
- **Biscuits** has the highest out-of-stock rate (**≈28.6%**), followed by Dairy, Bread & Batter and Beverages (**≈21.7%**).
- **Munchies** and **Cooking Essentials** hold the heaviest inventory (**≈1,405 kg each**). **Meats, Fish & Eggs** holds the lightest (**≈48 kg**).

### 💰 Revenue Potential
- The estimated total inventory revenue is **≈ ₹22.4 lakh** (selling price × available quantity).
- **Munchies** and **Cooking Essentials** lead with **≈ ₹3.37 lakh each**, followed by **Personal Care** and **Paan Corner** (**≈ ₹2.71 lakh each**).
- **Fruits & Vegetables** has the lowest estimated revenue (**≈ ₹10.8 thousand**), even though it offers the deepest discounts.

### ⚖️ Value for Money & Pack Sizes
- Fresh produce (onion, tomato, potato, lemon) gives the **best value per gram**, at roughly ₹0.00–0.05 per gram.
- Personal care items such as **L'Oréal hair colour** are the most expensive per gram, at about **₹3.00 per gram**.
- By weight, **3,605 products (≈96.6%) are "Low"** (≤ 1 kg), **122 are "Medium"** (1–6 kg), and only **4 are "Bulk"** (> 6 kg). Zepto's catalogue is dominated by small, convenience-sized packs.

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
