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
-- The line above is the backbone to this question. Putting "ORDER BY" inside the OVER() tells the window function to sum progressively
-- sum all the `Total` values from the very first row up to and including the current row, in date order
FROM Invoice
GROUP BY InvoiceDate;
