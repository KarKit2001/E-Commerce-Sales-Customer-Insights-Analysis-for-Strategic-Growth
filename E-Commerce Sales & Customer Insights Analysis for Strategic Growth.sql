

SELECT *
FROM PortfolioProject..orders

SELECT
order_date,
SUM(total_amount) AS total_sales
FROM PortfolioProject..orders
GROUP BY order_date
ORDER BY order_date

SELECT
YEAR(order_date) as order_year,
SUM(total_amount) AS total_sales,
COUNT(DISTINCT customer_id) as total_customers
FROM PortfolioProject..orders
GROUP BY YEAR(order_date)
ORDER BY YEAR(order_date)

SELECT
YEAR(order_date) as order_year,
MONTH(order_date) as order_month,
SUM(total_amount) AS total_sales,
COUNT(DISTINCT customer_id) as total_customers
FROM PortfolioProject..orders
GROUP BY YEAR(order_date), MONTH(order_date)
ORDER BY YEAR(order_date), MONTH(order_date)

--Changes over time analysis
SELECT
CAST(DATETRUNC(month, order_date) AS DATE) AS order_date,
SUM(total_amount) AS total_sales,
COUNT(DISTINCT customer_id) as total_customers
FROM PortfolioProject..orders
GROUP BY DATETRUNC(month, order_date)
ORDER BY DATETRUNC(month, order_date)

SELECT *
FROM
(
    SELECT
        CAST(DATETRUNC(month, order_date) AS DATE) AS order_date,
        SUM(total_amount) AS total_sales,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM PortfolioProject..orders
    GROUP BY DATETRUNC(month, order_date)
) t

-- cumulative analysis
SELECT 
order_date,
total_sales,
SUM(total_sales) OVER (ORDER BY order_date) AS running_total_sales
FROM
(
    SELECT
        CAST(DATETRUNC(month, order_date) AS DATE) AS order_date,
        SUM(total_amount) AS total_sales,
        COUNT(DISTINCT customer_id) AS total_customers
    FROM PortfolioProject..orders
    GROUP BY DATETRUNC(month, order_date)
) t

/* analyse the yearly performance of products by comparing their sales
to both the average sales performance of the product and the previous yeaar's sales */
WITH yearly_category_sales AS(
SELECT 
YEAR(o.order_date) AS order_year,
p.category,
SUM(oi.quantity) as current_order_intake
FROM 
    orders o
LEFT JOIN 
    order_items oi ON o.order_id = oi.order_id
LEFT JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY
YEAR(o.order_date), p.category
)

SELECT *,
AVG(current_order_intake) OVER (PARTITION BY category) AS avg_order_intake,
(current_order_intake - AVG(current_order_intake) OVER (PARTITION BY category)) AS diff_avg,
CASE WHEN (current_order_intake - AVG(current_order_intake) OVER (PARTITION BY category)) > 0 THEN 'Above Avg'
	WHEN (current_order_intake - AVG(current_order_intake) OVER (PARTITION BY category)) < 0 THEN 'Below Avg'
	ELSE 'Avg'
END avg_change,
--Year-over-year analysis
LAG (current_order_intake) OVER (PARTITION BY category ORDER BY order_year) AS previous_order_intake,
current_order_intake - LAG (current_order_intake) OVER (PARTITION BY category ORDER BY order_year) AS diff_previous,
CASE WHEN current_order_intake - LAG (current_order_intake) OVER (PARTITION BY category ORDER BY order_year) > 0 THEN 'Increase'
	WHEN current_order_intake - LAG (current_order_intake) OVER (PARTITION BY category ORDER BY order_year) < 0 THEN 'Decrease'
	ELSE 'Maintain'
END diff_previous_change
FROM yearly_category_sales
ORDER BY category, order_year

--which categories contribute the most to overall sales?
WITH category_oi AS (
SELECT 
p.category,
SUM(oi.quantity) as total_order_intake
FROM order_items oi
LEFT JOIN 
    products p ON oi.product_id = p.product_id
GROUP BY
p.category)

SELECT
category,
total_order_intake,
SUM(total_order_intake) OVER () overall_oi,
CONCAT(ROUND(CAST (total_order_intake AS FLOAT)/SUM(total_order_intake) OVER () *100, 2), '%') AS percentage_of_total
FROM category_oi
ORDER BY percentage_of_total DESC

/*segment products into cost ranges and
count how many products fall into each segment*/
WITH product_segments AS(
SELECT product_id,
name,
category,
sale_price,
CASE WHEN sale_price < 1000 THEN 'Below 1000'
	WHEN sale_price BETWEEN 1000 and 2000 THEN '1000-2000'
	WHEN sale_price BETWEEN 2000 and 3000 THEN '2000-3000'
	ELSE 'Above 3000'
END sale_range
FROM products)

SELECT 
sale_range,
COUNT(*) as total_products
FROM product_segments
GROUP BY sale_range
ORDER BY total_products DESC

--top selling product
SELECT p.name,
SUM(oi.price * oi.quantity) AS total_revenue
FROM order_items oi
LEFT JOIN products p
ON oi.product_id=p.product_id
GROUP BY p.name
ORDER BY total_revenue

--profit of margin
SELECT
  name,
  cost_price,
  sale_price,
  CONCAT(ROUND(profit_percent, 2), '%') AS profit_margin
FROM (
  SELECT
    name,
    cost_price,
    sale_price,
    (sale_price - cost_price) / cost_price * 100 AS profit_percent
  FROM products
) AS sub
ORDER BY profit_percent DESC;


/* group customers into three segment based on their spending behaviour:
	-VIP: custoomers with at least 12 months of history and spending more than $10,000
	-Regular: customers with at least 12 months of history but spending $10,000 or less
	-New: customers with a lifepsna less than 12 months
And find the total number of customers by each group
*/
WITH customer_spending AS(
SELECT 
c.customer_id,
SUM(o.total_amount) AS total_spending,
MIN(o.order_date) AS first_order,
MAX(o.order_date) AS last_order,
DATEDIFF(month, MIN(o.order_date), MAX(o.order_date)) AS lifespan
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_id
)

SELECT customer_segment,
COUNT(customer_id) AS total_customers
FROM (
	SELECT
	customer_id,
	total_spending,
	lifespan,
	CASE WHEN total_spending > 100000 AND lifespan >= 12 THEN 'VIP'
		WHEN total_spending < 100000 AND lifespan >= 12 THEN 'Regular'
		ELSE 'New'
	END customer_segment
	FROM customer_spending) t
GROUP BY customer_segment
ORDER BY total_customers DESC

--high-value customer regions
SELECT 
c.location,
SUM(o.total_amount) AS total_spending
FROM orders o
LEFT JOIN customers c 
ON o.customer_id = c.customer_id
GROUP BY c.location
ORDER BY total_spending DESC