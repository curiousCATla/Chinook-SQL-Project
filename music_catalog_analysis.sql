-- Q: "Which music genres drive the most sales and revenue?"
SELECT
	g.Name,
	COUNT(il.InvoiceLineId) AS tracks_sold,
	ROUND(SUM(il.UnitPrice*il.Quantity), 2) AS revenue ,
	ROUND( 
		SUM(il.UnitPrice*il.Quantity) / 
		SUM(SUM(il.UnitPrice*il.Quantity)) OVER() * 100 , 1) 
		AS percent_of_revenue
		--sum over all the genres is the SUM(...)OVER()
FROM InvoiceLine il
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreID = g.GenreId
-- Here, 3 different tables are joined together, because InvoiceLine contains information on sales, but not the track name or genre
-- through the  Track table, the genre ID can be found for the track, to find genere name
-- This is done because the genre table contains information on the genre name and ID, but not the sales, and vice versa
GROUP BY g.GenreID
ORDER BY revenue DESC;
