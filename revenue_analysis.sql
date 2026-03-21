-- Which countries generate the most revenue?
SELECT BillingCountry, 
ROUND(SUM(Total),2) AS Revenue ,  
-- in the result, let the first column be the billing country and the second column be the total revenue from the country
ROUND(SUM(Total)/(SELECT SUM(Total) FROM Invoice) *100, 1) AS Percentage
-- let the thrid column be the percentage of total revenue each country contributes, the section "SELECT SUM(Total) FROM Invoice" finds the total revenue
FROM  Invoice --from the Invoice data set 
GROUP BY BillingCountry  -- group the data points by the billing country
ORDER BY Revenue DESC  --  order the data by the revenue in descending order
LIMIT 10; -- limit to show only the first 10 data points 


--"Is our revenue growing, shrinking, or seasonal over time?
SELECT 
strftime('%Y-%m', InvoiceDate)  AS month, 
-- strftime stands for "string format time", and the parameter '%Y-%m' formate the output as year and month together
ROUND(SUM(Total), 2) AS revenue
-- the first column will be the year &  month, the second column  will be the total sales per month 
FROM Invoice
GROUP BY month
ORDER BY month; 
-- Through this, I was able to sort data chronologically, ordering and grouping the data.



