-- Q: "How many customers made more than one purchase?"
-- to anwser to questions, and have a full customer loyal break down, I will have to count how many purchases each customer made
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
-- second, the cutomer data is grouped by their purchase count to reveal customer spending habits
ORDER BY purchase_count;
