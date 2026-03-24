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
| 'GROUP BY' / 'PARTITION BY"| Aggregating revenue and sales by country, genre, and artist |
| 'ORDER BY' | Ordering revenue by chronology and amount in ascending and descending order |
| 'JOIN on' | Linking customers, invoices, tracks, genres, and artists across tables |
| 'OVER' |  Used with window functions to perform calculations, such as average, partition, and summation |
| 'strftime" | Coverting string-form inputs into dates to determine chronology |
| Subqueries / CTEs | Structuring multi-step logic (e.g., calculating totals before ranking) |

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



