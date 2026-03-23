-- Q: "How many customers made more than one purchase?"
-- To answer questions and have a full customer loyalty breakdown, I will have to count how many purchases each customer made
SELECT
	purchase_count,
	COUNT(*) AS num_customers 
FROM(
	SELECT CustomerId,
	COUNT(*) AS purchase_count
	FROM Invoice
	GROUP BY CustomerId
	--first, the Inovice data is grouped by customer ID to avoid overlaps
)AS customer_totals
GROUP BY purchase_count
-- second, the customer data is grouped by their purchase count to reveal customer spending habits
ORDER BY purchase_count;


-- Q: "How does our cumulative revenue grow over time — and are there periods where growth stalls?" 
SELECT
InvoiceDate,
Total,
ROUND (SUM(Total) OVER(ORDER BY InvoiceDate), 2)  AS running_total
-- The line above is the backbone of this question. Putting "ORDER BY" inside the OVER() tells the window function to sum progressively
-- sum all the `Total` values from the very first row up to and including the current row, in date order
FROM Invoice
GROUP BY InvoiceDate;

-- Taking this to the next level, the invoice can be grouped by month, which reveals the monthly progression 
SELECT
	month, 
	monthly_revenue,
	ROUND(
	SUM(monthly_revenue) OVER ( ORDER BY month), 2) AS running_total
-- here, the same progressive summation is performed
FROM(
SELECT
	strftime('%Y-%m', InvoiceDate) AS month,
	ROUND(SUM(Total),2) AS monthly_revenue 
FROM Invoice
GROUP BY month
--first, the data is grouped by 'month' 
) AS monthly
ORDER BY month; 


SELECT
    customer_name,
    country,
    total_spent,
    country_rank
FROM (
    SELECT
        c.FirstName || ' ' || c.LastName         AS customer_name,
        i.BillingCountry                          AS country,
        ROUND(SUM(i.Total), 2)                    AS total_spent,
        RANK() OVER (
		--The RANK() assigns a position number to each data point; if two are tied, it will skip the next rank. Here, it is ranking OVER() a custom ORDER
		-- the customers are partitioned by countries, and is ordered in terms of total spending 
            PARTITION BY i.BillingCountry
            ORDER BY SUM(i.Total) DESC
        )                                         AS country_rank
    FROM Customer c
    JOIN Invoice i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId
) AS ranked_customers
WHERE country_rank <= 3
ORDER BY country, country_rank;

