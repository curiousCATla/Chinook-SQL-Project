-- Q: "Who are our most valuable customers, and where are they from?"
-- to do this, I will have to find the customer id with the highest total spending, and find the information of the customer in the customer table 
SELECT 
	RANK() OVER (ORDER BY total_spending DESC) AS rank,
	-- in order to rank each customer in terms of total spending, the total spending first needs to be found
	name, 
	Country,
	total_spending
FROM(
	SELECT 
	c.FirstName || ' ' || c.LastName AS name,
	-- two variables can be joined together using the '||} notation, while ' ' simply addes a space between the two 
	c.Country,
	ROUND(SUM(i.Total), 2) AS total_spending
	FROM Customer c
	JOIN Invoice i on c.CustomerId = i.CustomerId
	-- where the 
	GROUP BY c.CustomerId 
)
-- grouping by Customer ID to pervent duplicating names
ORDER BY rank
LIMIT 10; 

-- Q: "Which countries have customers who spend the most per purchase?"
-- To answer this question meaningfully, we have to exclude the outliers to know more about a country's spending capacity
-- Therefore, a lower limit for the number of customers per country needs to be applied in order to ensure the analysis is meaningful
SELECT 
	BillingCountry,
	COUNT(*) AS num_customers,
	ROUND(SUM(customer_total)/SUM(customer_num_order),2) AS avg_order_value
FROM (
SELECT 
BillingCountry,
COUNT(*) AS customer_num_order,
ROUND (SUM(Total),2) AS customer_total
FROM Invoice
GROUP BY CustomerId
)
GROUP BY BillingCountry
HAVING COUNT(*) >= 5
-- the having argument filter countries with a low number of customers, each data point having 5 or more counts
ORDER BY avg_order_value DESC;

