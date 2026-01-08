# Data Cleaning & Preparation – Excel

## 1. Dataset Overview
The raw dataset contains e-commerce transaction data including orders, customers, products, pricing, discounts, delivery details, and regions.  
The objective of this step was to validate data quality, prepare business-ready fields, and create an analysis-ready dataset for SQL and Power BI.

---

## 2. Initial Data Validation
- Reviewed all column names and structure
- Checked for duplicate records using order_id and product_id
- Reviewed missing values across all columns
- Validated that data types were already correct:
  - order_date verified as Date format
  - price, discount, quantity, shipping_cost, total_amount verified as numeric

---

## 3. Cleaning & Quality Checks
- Standardized column naming conventions
- Verified categorical fields (payment_method, category, region, returned) for consistency
- Reviewed discount values and quantity ranges for anomalies
- Ensured order_date was consistently formatted as Short Date

---

## 4. Feature Engineering (New Columns)
The following business-focused columns were created to support analysis:
- order_year – extracted from order_date  
- order_month – extracted from order_date  
- discount_flag – identifies whether a discount was applied  
- net_revenue – total_amount minus shipping_cost  
- age_group – customer age grouped into business segments  

---

## 5. Final Output
- Saved validated and enhanced dataset as cleaned_data.xlsx  
- Exported analysis-ready file as cleaned_data.csv for MySQL import  

The final dataset is consistent, structured, and ready for KPI analysis and dashboard development.
