-- Q: "Which countries generate the most revenue?"
SELECT BillingCountry, 
ROUND(SUM(Total),2) AS Revenue ,  
-- in the result, let the first column be the billing country and the second column be the total revenue from the country
ROUND(SUM(Total)/(SELECT SUM(Total) FROM Invoice) *100, 1) AS Percentage
-- let the thrid column be the percentage of total revenue each country contributes, the section "SELECT SUM(Total) FROM Invoice" finds the total revenue
FROM  Invoice --from the Invoice data set 
GROUP BY BillingCountry  -- group the data points by the billing country
ORDER BY Revenue DESC  --  order the data by the revenue in descending order
LIMIT 10; -- limit to show only the first 10 data points 


--Q: "Is our revenue growing, shrinking, or seasonal over time?"
SELECT 
strftime('%Y-%m', InvoiceDate)  AS month, 
-- strftime stands for "string format time", and the parameter '%Y-%m' formats the output as year and month together
ROUND(SUM(Total), 2) AS revenue
-- the first column will be the year &  month, the second column  will be the total sales per month 
FROM Invoice
GROUP BY month
ORDER BY month; 
-- Through this, I was able to sort data chronologically, ordering and grouping the data.
-- to expand on this, from a data analysis standpoint, monthly revenue can be noise, subjected to all sorts of deviations 
-- To see macro trends, I can  add a 3-month moving average
SELECT
month, 
revenue, 
ROUND( 
	AVG(revenue) OVER (
		ORDER BY month  --sorting the data in order of month
		ROWS BETWEEN 2 PRECEDING AND CURRENT ROW --here it means the two rows before this, and the current row (so this month and the two months before
		)
		, 2) AS moving_avg_3m
FROM  ( -- here, there is a subquery inside the FROM clause, so whatever is inside the bracket gets calculated first
	SELECT 
		strftime('%Y-%m', InvoiceDate) AS month,
        ROUND(SUM(Total), 2)           AS revenue
		FROM Invoice
		GROUP BY month
		-- The data from the Invoice table first needs to be grouped, and the monthly average needs to be calculated before the 3 month moving average can be found
)
ORDER BY month 

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

