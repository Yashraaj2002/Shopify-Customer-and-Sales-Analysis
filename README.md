# Shopify Sales & Customer Insights Dashboard 🛒📊

## Project Goal 🎯  
Address key business questions:

- How much are we selling and who are our customers?
- What’s the repeat customer behavior and how valuable are they over time?
- How do regional trends, product types, and payment methods affect performance?
- Which KPIs help the business monitor sales growth and customer loyalty?

Analyze Shopify order and customer data to extract actionable insights that help optimize marketing spend, improve customer retention, and guide business strategy.

---

## Data Preparation Process ⚙️

1. **Data Cleaning & Normalization:**  
   Used Excel and Power Query to standardize date formats, clean zip codes and city names, and ensure data types were consistent across the dataset.

2. **ETL & Storage:**  
   Loaded cleaned Shopify order data into PostgreSQL with well-defined data types (e.g., timestamps, numerics, text).

3. **Data Aggregation & Manipulation:**  
   Applied advanced SQL techniques including `GROUP BY`, `COUNT DISTINCT`, conditional filtering, and calculated KPIs to prepare analysis-ready tables.

4. **Business Logic Implementation:**  
   Built SQL logic for customer classification (single vs. repeat), lifetime value calculation, purchase frequency, and region-level performance.

5. **Visualization Setup:**  
   Developed interactive Power BI dashboards with card KPIs, slicers, dynamic filters, and drill-through tables for deep analysis.


---

## Tools & Technologies 🛠️

- **PostgreSQL:** KPI calculation, customer behavior segmentation, sales trend analysis
- **Excel Power Query:** Data transformation, cleaning, normalization
- **Power BI:** Interactive dashboards with DAX, filters, cards, trends, and drill-through reports

---

## Project Structure 📁

- `Dashboard_Report.pbix` — Power BI file containing two interactive dashboards with KPIs, regional trends, and drill-through table.
- `sql/kpi_queries.sql` — SQL queries for (Net Sales, AOV, LTV, Repeat Rate, Sales by region, Product type, and Payment method).

---

## Key Insights & Business Impact 💡

- Customer repeat rate and lifetime value calculated to identify high-value segments and optimize retention strategies.
- Sales breakdown by province and city revealed geographic hotspots to target with region-specific campaigns.
- Payment method analysis helped uncover preferred channels, guiding checkout optimizations.
- Net Sales trends highlighted seasonal spikes and dips, supporting more informed inventory and staffing decisions.
- Drill-through table enables granular order analysis and supports ad-hoc business questions from stakeholders.

---

## 📊 Dashboard 1: Sales & Customer KPIs  
![Dashboard 1](https://github.com/Yashraaj2002/Shopify-Customer-and-Sales-Analysis/blob/main/Shopify%20Dashboard%201.png) 
💡 Covers 8 core KPIs including Net Sales, Total Customers, Repeat Rate, AOV, Lifetime Value, Regional Sales, Product Performance, and Payment Gateway usage.

---

## 📋 Dashboard 2: Drillthrough Details  
![Dashboard 2](https://github.com/Yashraaj2002/Shopify-Customer-and-Sales-Analysis/blob/main/Shopify%20Dashboard%202.png)    
💡 Interactive table for exploring individual order-level details such as order number, date, customer, product type, location, and revenue.

