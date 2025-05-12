
# E-Commerce Sales & Customer Insights Analysis for Strategic Growth

## Project Overview
TechNova, a fictional electronics retail company founded in 2020, operates in Malaysia, offering a wide range of consumer electronics including Accessories, Headphones, Laptops, Smartphones and Smartwatches
 from leading brands such as Apple, Samsung, Huawei, and Lenovo. With rapid growth and increasing competition in the digital marketplace, TechNova aims to enhance its decision-making through data-driven strategies.

## Executive Summary
This analysis for TechNova, a Malaysian electronics retailer, uncovered key insights to support growth in sales, customer engagement, and product strategy. Sales show strong seasonality, peaking in March–May and October–December, indicating opportunities to align marketing and inventory with demand cycles.

Mid-range products (RM 1,000–3,000) dominate revenue, while high-end items contribute minimally. Customer data reveals a heavy reliance on regular buyers (95%), with limited new and VIP customer engagement—signaling the need to improve acquisition and loyalty efforts.

Geographically, states like Johor and Selangor lead in sales. Product categories perform evenly, offering room to specialize through targeted promotions. Interactive dashboards in Power BI support data-driven decision-making across teams.

Strategic recommendations include enhancing customer segmentation, focusing on high-performing price ranges, and timing campaigns around seasonal trends to maximize impact.

## Insights Deep-Dive
### Trend Analysis: Sales & Customers
![image](https://github.com/user-attachments/assets/a3710f92-3af0-4b7a-9da6-f539baf0d6a5)

- Both customer and sales counts showed significant monthly variation throughout 2021-2022.
- Peaks typically occurred in Spring (Mar/May) and Q4 (Oct-Dec), while lows were common in February and late summer (Aug/Sep).
- Sales volume generally tracked customer counts but exhibited greater relative peaks and troughs.
- Performance in early 2022 (Jan-May) appeared stronger than in the corresponding months of 2021.

### Cumulative Sales Trend
![image](https://github.com/user-attachments/assets/c4ca4980-fbce-4333-a05d-10ec72b36485)

- The chart clearly shows a consistent and positive accumulation of sales throughout the period from January 2021 to the end of 2022.
- The relatively straight line indicates a generally steady pace of sales accumulation month over month across the two years. There are no major flat periods or downturns in the cumulative total.
- While largely linear, the slope might be slightly steeper in 2022 compared to 2021, suggesting that the rate of adding new sales could have increased moderately in the second year.
- Starting from near zero, the cumulative sales reached approximately $50 million by the end of the observed period (around December 2022).

### Customer Segmentation
![image](https://github.com/user-attachments/assets/f0295196-7fb0-463a-9014-fc9648efaaa7)

- The customer base is overwhelmingly dominated by 'Regular' customers, constituting 95.6% of the total. This suggests a strong core or potentially long-standing customer relationship.
- In contrast, 'New' customers make up only 3.5%, while the 'VIP' segment is exceptionally small at approximately 0.9%.

### Geographic Spending Analysis
![image](https://github.com/user-attachments/assets/8dd1ae9b-833d-4f40-968a-7fcbf2bf626c)


- High Spending Cluster: A large group of locations demonstrates substantial spending, generally ranging between approximately 3.1 million and 3.8 million units. In descending order of spending, this tier includes:
    - Johor
    - Labuan
    - Sarawak
    - Kelantan
    - Negeri Sembilan
    - Selangor
    - Perlis
    - Sabah
    - Penang
    - Pahang
- Lower Spending Cluster: Another distinct group shows lower spending levels, typically between 2.5 million and 2.9 million units. This group comprises:
    - Terengganu
    - Kedah
    - Kuala Lumpur
    - Perak
    - Putrajaya
    - Malacca
### Analysis of Total Sales by Product Name
![image](https://github.com/user-attachments/assets/f01d20ad-278f-4b5e-90a4-63ccf345509d)
- Basic computer peripherals (Keyboard, Laptop Stand) surprisingly lead total sales, potentially indicating high volume, strong demand (perhaps work-from-home related), or healthy margins.
- High-value items, particularly from Apple, contribute significantly to total sales.
- Wide Sales Distribution: There is a wide spread in sales performance across the product range, with a concentration of products in the 1.0M to 2.9M sales bracket and a sharp drop-off for the lowest-performing items.

### Product Sale Price Range
![image](https://github.com/user-attachments/assets/072d5315-1a91-4f01-992b-57ce241c4fb1)

- 1000-2000 Range is the single largest segment, accounting for 36% of sales, suggesting this price point holds the broadest appeal.
- 2000-3000 Range segment is also very significant, contributing 32% of sales, highlighting strong demand for products at this slightly higher price level.
- Products priced below 1000 constitute a substantial portion of sales (24%). This signifies a notable market for more affordable or entry-level items.
- High-end products priced above 3000 represent the smallest share of sales at only 8%. This suggests that while potentially valuable in terms of revenue per item, these premium products make up a niche portion of the overall sales volume.

### Sales by Product Category
![image](https://github.com/user-attachments/assets/26c4c11b-32bc-4ee4-8620-61335d3520ae)

- The most striking insight is the exceptionally even distribution of sales across all five product categories. Each category contributes roughly 20% of the total sales.
- Unlike many businesses where one or two categories might heavily outweigh others, these sales figures show near-equal performance across the board. Accessories, Laptops, and Smartwatches have a marginal edge, but the difference is minimal.

## Recommendations
### 1. Boost Customer Growth by Targeting 'New' and 'VIP' Segments:
The current customer base shows potential stagnation with 95.6% 'Regular' customers and very low 'New' (3.5%) and 'VIP' (lesser than 1%) segments. Driving future growth necessitates acquiring new customers and developing high-value VIP relationships.

Implement targeted digital marketing for customer acquisition. Concurrently, review and enhance the VIP program (criteria, benefits, promotion) to increase engagement from the large 'Regular' base. These actions utilize existing data and standard business practices.

### 2. Align Product & Marketing Strategy with Price Point Performance:
Sales are heavily concentrated in the 1000-3000 price range (68%), with significant volume below 1000 (24%) and a small niche above 3000 (8%). Focusing strategy on these performance tiers ensures resources are allocated effectively for maximum impact.

Prioritize marketing, promotions, and inventory for the popular 1000-3000 range. Ensure value in the sub-1000 segment. Make strategic decisions about the >3000 range based on profitability and target audience reach. This leverages readily available sales data for strategic planning.

### 3. Synchronize Marketing & Operations with Sales Seasonality:
Clear sales peaks (Spring: Mar-May, Q4: Oct-Dec) and troughs (Feb, Aug-Sep) offer opportunities to maximize revenue during high-demand periods and control costs during slower times.

Plan major campaigns, product launches, and increased marketing efforts for peak seasons. Adjust inventory purchasing and potentially staffing based on these predictable cycles. This involves standard retail planning informed by historical data analysis.

## Data Analysis Overview  
### 1. Exploratory Data Analysis (EDA) using SQL
SQL queries were used to join and analyze data from multiple relational tables, including orders, customers, products, and order items. Key business metrics—such as total revenue, average order value, top-selling product categories, and customer distribution by region—were extracted and summarized. The cleaned and aggregated dataset was prepared for visualization.

### 2. Interactive Dashboard Development in Power BI
The processed dataset was imported into Power BI to develop a suite of interactive dashboards. These visualizations highlighted revenue trends over time, customer acquisition patterns, regional sales performance, and profit margins by product category.

### 3. Insights and Business Recommendations
Based on the analytical findings, several actionable recommendations were formulated. These included prioritizing marketing in high-performing regions, optimizing stock for top-selling items, and reassessing pricing strategies for products with low margins. The insights supported data-driven decisions aimed at improving overall business performance.
