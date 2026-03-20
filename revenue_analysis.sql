-- Which countries generate the most revenue?
SELECT BillingCountry, 
ROUND(SUM(Total),2) AS Revenue ,  
-- in the result, let the first column be the billing country and second column be the total revenue from the country
ROUND(SUM(Total)/(SELECT SUM(Total) FROM Invoice) *100, 1) AS Percentage
-- let the thrid column be the percentage of total revenue each country countributes, the section "SELECT SUM(Total) FROM Invoice" finds the total revenue
FROM  Invoice --from the Invoice data set 
GROUP BY BillingCountry  -- group the data points by the billing country
ORDER BY Revenue DESC  --  order the data by the revenue in desending order
LIMIT 10; -- limit to show only the first 10 data point 



