# Chinook-SQL-Project
## Overview
This project analyses the Chinook database, which models a digital music store selling tracks across different countries. Using SQL, I explored revenue trends, customer behaviour, and catalog performance to reveal actionable business insights.

## Database Schema
The Chinook database models a digital music store with the following key tables:
- `Customer` — customer demographics and location
- `Invoice` / `InvoiceLine` — purchase transactions and line items
- `Track` / `Album` / `Artist` — music catalog
- `Genre` — genre classifications
- `Employee` — support rep assignments

## SQL Skills & Techniques Demonstrated
| Technique | Applied To | 
|---|---|
| 'JOIN' ('INNER', implicit) | Linking up to 4 tables, 'InovoiceLine', 'Track', 'Album', and 'Genre', to connect sales data with catalog information |

| 'GROUP BY' | Aggregating revenue and track sales by country, genre, artist, customer, and month |
| 'HAVING' | Filtering grouped results, e.g., excluding countries with fewer than 5 customers |
| 'ORDER BY' | Ordering results chronologically and by revenue in ascending and descending order |
| 'RANK()'/'PARTITION BY'| Ranking customers by total spending within each country, using window functions to preserve row-level detail (essentially preserving information) |
| 'LAG()' | Comparing each month's revenue to the previous to calculate percent change and classify trends as: growth, decline, or flat |
| 'SUM() OVER()'/'AVG() OVER()' | Computing cumulative running totals and a 3-month rolling average to identify revenue trends over time |
| 'CASE WHEN' | Classifying monthly revenue trends as 'growth', 'decline', or 'flat' based on comparing to the prior month| 
| 'strftime" | Formatting invoice dates into 'YYYY-MM' strings to enable monthly grouping and chronological sorting | |
| Subqueries / CTEs | Breaking multi-step logic into readable layers; e.g. calculating monthly totals in a CTE before computing month-over-month changes |

## Key Questions & Findings
Sales / Revenue Analysis
- "Which countries generate the most revenue?" -> The USA generates 22% of the total revenue, while being one of many markets, driven by a high volume of smaller purchases rather than large individual orders
- "Is our revenue growing, shrinking, or static over time?" -> Over time, the revenue has been growing, but In Q4 of 2024, revenue dipped 20%, which may warrant further investigation into the catalog or seasonal changes during that period. Additionally, in the most recent month of December 2025, the revenue saw a sudden decrease, which may also prompt further investigation

Artist / Track / Album Popularity: 
- "Which music genres drive the most sales and revenue? " -> Rock accounts for 36% of total revenue, selling a total of 835 tracks
- "Who are the Top 10 artists?" ->  Iron Maiden has the most sales out of all artists, with a total of 140 tracks sold. Followed by: U2, Metallica, etc...

Customer Behavior
- "Who are our most valuable customers, and where are they from?" -> The high spending customer is Helena Holý from the Czech Republic
- "Which countries have customers who spend the most per purchase?" -> Chile, on average, has the highest average order value despite being one of the smallest markets with a single customer. When only looking at countries with 5 or more customers, the USA has the highest average order value
- "How many customers made more than one purchase?" -> Almost every customer has made at least 7 purchases, and a single customer with 6 purchases.

## What I Learned
This was my first SQL project and my introduction to databases and data analysis using SQL.
Working with the Chinook database taught me the fundamentals of relational data, how tables connect through keys, and often multiple tables are necessary to answer basic business questions. A key takeaway was learning to break complex logic into readable steps using CTEs, rather than stacking nested subqueries. I also employed window functions, using 'RANK()' & 'PARTITION()' to compare customers within their own country, 'LAG()' to calculate monthly revenue change, and a rolling 3-month average to reduce noise in monthly revenue data. Beyond SQL syntax, I equally learned how to ask better questions about data, recognising, for instance, that a country's average order value is misleading without a minimum customer threshold. I look forward to building on this foundation and would like to visualize these findings next using Python. 



