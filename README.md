# Data Warehouse and Analytics Project


Welcome to the **Data Warehouse and Analytics Project** repository!

This project demonstrates an end-to-end **data warehousing and analytics solution** built using **SQL Server**. It covers the complete data pipeline, from importing and cleaning raw data to building a modern data warehouse and generating actionable business insights.

The project is designed as a portfolio project and follows industry-oriented practices in **data engineering, data modeling, SQL development, data quality, and analytics**.

---

## 📌 Project Overview

The goal of this project is to build a modern data warehouse that consolidates sales data from multiple source systems and provides a reliable foundation for analytical reporting and business intelligence.

The project follows two major phases:

1. **Data Engineering** – Build and populate the data warehouse.
2. **Data Analytics** – Analyze the warehouse data and generate business insights.

### Architecture

```text
                 ┌─────────────────┐
                 │   CRM Source    │
                 │     CSV Files   │
                 └────────┬────────┘
                          │
                          │
                 ┌────────▼────────┐
                 │   ERP Source    │
                 │     CSV Files   │
                 └────────┬────────┘
                          │
                          ▼
                ┌───────────────────┐
                │   Data Cleaning   │
                │ & Transformation  │
                └─────────┬─────────┘
                          │
                          ▼
                ┌───────────────────┐
                │   SQL Server      │
                │  Data Warehouse   │
                └─────────┬─────────┘
                          │
                          ▼
                ┌───────────────────┐
                │ Data Analytics &  │
                │    Reporting      │
                └───────────────────┘
```

---

# 🏗️ Project Requirements

## 1. Building the Data Warehouse — Data Engineering

### 🎯 Objective

Develop a modern data warehouse using **SQL Server** to consolidate sales data from multiple source systems and provide a reliable foundation for analytical reporting and informed decision-making.

### 📂 Data Sources

The project uses data from two source systems:

* **ERP** — Enterprise Resource Planning data
* **CRM** — Customer Relationship Management data

The source data is provided in **CSV format**.

### 🧹 Data Quality

The raw data is cleaned and validated before being loaded into the data warehouse.

Data quality activities include:

* Identifying missing values
* Removing duplicate records
* Handling inconsistent formats
* Standardizing data values
* Validating customer and product information
* Resolving data inconsistencies
* Ensuring data types are appropriate for analysis

### 🔄 Data Integration

Data from the ERP and CRM systems is integrated into a **single centralized data warehouse**.

The integration process ensures that information from different systems can be analyzed together.

### 📅 Data Scope

The project focuses on the **latest available dataset**.

Historical data tracking and Slowly Changing Dimensions are outside the scope of this project.

### 📖 Documentation

The project includes documentation covering:

* Data sources
* Data flow
* Data transformation logic
* Data model
* Database structure
* Analytical queries
* Business rules

---

# 🗄️ Data Warehouse Design

The data warehouse follows a **layered architecture** to organize the data processing pipeline.

### Bronze Layer

The Bronze layer stores the raw data imported directly from the source CSV files.

**Purpose:**

* Preserve source data
* Maintain raw records
* Enable traceability
* Minimize transformations

### Silver Layer

The Silver layer contains cleaned and standardized data.

**Activities include:**

* Data cleansing
* Data validation
* Standardization
* Removing duplicates
* Handling missing values
* Data type conversions

### Gold Layer

The Gold layer contains business-ready data designed for analytical queries and reporting.

It includes a structured **star schema** consisting of:

* Fact tables
* Dimension tables

---

# ⭐ Data Model

The warehouse is designed to support both business stakeholders and analytics teams.

A typical analytical model includes:

### Fact Table

**Fact Sales**

Contains measurable business metrics such as:

* Sales amount
* Quantity
* Price
* Order information
* Customer references
* Product references
* Order date

### Dimension Tables

**Dim Customer**

Contains customer-related information:

* Customer ID
* Customer Name
* Country
* Gender
* Birth Date
* Customer attributes

**Dim Product**

Contains product-related information:

* Product ID
* Product Name
* Category
* Subcategory
* Product Line
* Cost
* Product attributes

**Dim Date**

Contains calendar information:

* Date
* Day
* Month
* Quarter
* Year

---

# 📊 BI: Analytics & Reporting

## 🎯 Objective

Develop SQL-based analytical queries to generate meaningful business insights from the data warehouse.

The analytics phase focuses on three major areas:

### 👥 Customer Behavior

Analyze customer-related metrics such as:

* Total customers
* Customer purchasing behavior
* Customer lifetime value
* Customer segmentation
* Repeat customers
* Customer sales contribution

### 📦 Product Performance

Analyze product-level performance including:

* Best-selling products
* Product revenue
* Product quantity sold
* Product profitability
* Product category performance
* Low-performing products

### 📈 Sales Trends

Analyze sales performance over time using:

* Daily sales
* Monthly sales
* Yearly sales
* Revenue trends
* Quantity trends
* Average order value
* Sales growth

---

# 💡 Key Business Metrics

The project can generate important KPIs such as:

| KPI                 | Description                    |
| ------------------- | ------------------------------ |
| Total Sales         | Total revenue generated        |
| Total Customers     | Number of unique customers     |
| Total Orders        | Number of orders placed        |
| Total Quantity      | Total products sold            |
| Average Order Value | Average revenue per order      |
| Customer Revenue    | Revenue generated by customers |
| Product Revenue     | Revenue generated by products  |
| Sales Growth        | Change in sales over time      |

---

# 🛠️ Technologies Used

* **SQL Server**
* **T-SQL**
* **SQL Server Management Studio (SSMS)**
* **CSV**
* **Git & GitHub**

---

# 📁 Project Structure

```text
Data-Warehouse-and-Analytics-Project/
│
├── datasets/
│   ├── source_erp/
│   └── source_crm/
│
├── docs/
│   ├── data_catalog.md
│   ├── data_model.md
│   └── architecture.md
│
├── scripts/
│   ├── bronze/
│   ├── silver/
│   └── gold/
│
├── sql/
│   ├── database_setup.sql
│   ├── data_loading.sql
│   ├── data_cleaning.sql
│   └── analytics.sql
│
├── tests/
│   └── data_quality_checks.sql
│
└── README.md
```

---

# 🔄 ETL Workflow

The project follows an ETL-style workflow:

```text
Extract
   ↓
Load Raw Data
   ↓
Data Quality Checks
   ↓
Transform & Clean
   ↓
Integrate ERP + CRM
   ↓
Load Data Warehouse
   ↓
Create Analytical Model
   ↓
Run SQL Analytics
   ↓
Generate Business Insights
```

---

# 🔍 Example Analytical Questions

The warehouse can be used to answer questions such as:

### Customer Analysis

* Who are the highest-value customers?
* How many customers have made purchases?
* Which customers generate the most revenue?
* What is the average revenue per customer?

### Product Analysis

* Which products generate the highest revenue?
* Which products have the highest sales volume?
* Which product categories perform best?
* Which products have declining sales?

### Sales Analysis

* How are sales changing over time?
* What are the monthly sales trends?
* What is the average order value?
* Which periods generate the highest revenue?

---

# 🧪 Data Quality Checks

Data validation is performed throughout the pipeline.

Examples include:

* Checking for NULL values
* Detecting duplicate records
* Validating primary keys
* Checking foreign-key relationships
* Validating date ranges
* Checking invalid product/customer references
* Identifying inconsistent data formats
* Validating numerical values

---

# 📚 Documentation

The repository provides documentation for:

* Data architecture
* Data sources
* Data flow
* Data dictionary
* Data model
* Transformation rules
* Data quality checks
* Analytical SQL queries
* Business metrics

---

# 🎯 Project Goals

The main goals of this project are to demonstrate practical knowledge of:

* Data Warehousing
* SQL Server
* T-SQL
* ETL concepts
* Data Cleaning
* Data Integration
* Data Modeling
* Star Schema
* Fact and Dimension Tables
* Data Quality
* SQL Analytics
* Business Intelligence
* Git & GitHub

---

# 🚀 Future Improvements

Potential future enhancements include:

* Adding historical data tracking
* Implementing Slowly Changing Dimensions
* Building Power BI dashboards
* Automating ETL pipelines
* Adding scheduled data refreshes
* Implementing advanced customer segmentation
* Adding predictive analytics
* Deploying the warehouse to a cloud platform

---

# 👨‍💻 Author

**Barin Ghosh**

B.Tech — Computer Science & Engineering

This project was developed as part of a portfolio to demonstrate practical skills in **SQL, Data Engineering, Data Warehousing, and Data Analytics**.
