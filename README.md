# chinook

## Instructions

1. In your cohort's Github account, create a github repository for your answers. If your instructor is using Github Classroom, the repository will be created for you. If not, name your repository `chinook-{your Github username]`.
1. If you are using the Firefox Add On, and you have trouble opening it once it has been installed, try opening Firefox, selecting "customize" at the bottom of the hamberger menu at the top right of the page. You can then drag SQLite Manager onto the toolbar where it will be easily accessible.
1. Go ahead and click around a little bit to familarize yourself with the database
1. **Recommended:** Draw an ERD of the Chinook database. Make sure to label primary keys, foreign keys, and indicate the type of relationship (one to one, one to many, many to many, etc) for each relationship. Use draw.io.
1. When you're ready to start the exercise, click the tab labeled "Execute SQL", type in your query and run it.
1. If your query is correct - meaning it returns the data requested - copy and the SQL statement and paste it into the corresponding file for the exercise (_see below_). If your query doesn't return the expected results, try try again.

For each of the following exercises, provide the appropriate query. Yes, even the ones that are expressed in the form of questions. Everything from class and the [Sqlite Documentation](http://www.sqlite.org/) is fair game.

**Please note on the answers below, if there was more then 24 lines of data, then you will need to run the sql file to get the correct response.

1. `non_usa_customers.sql`: Provide a query showing Customers (just their full names, customer ID and country) who are not in the US.
    
    >**Answer:** `46 rows returned in 3ms from: select FirstName, LastName, CustomerId, Country from Customer where Country != &quot;USA&quot;`
1. `brazil_customers.sql`: Provide a query only showing the Customers from Brazil.

    >**Answer:** `"Luís"	"Gonçalves"	"1"	"Brazil"
"Eduardo"	"Martins"	"10"	"Brazil"
"Alexandre"	"Rocha"	"11"	"Brazil"
"Roberto"	"Almeida"	"12"	"Brazil"
"Fernanda"	"Ramos"	"13"	"Brazil"`
1. `brazil_customers_invoices.sql`: Provide a query showing the Invoices of customers who are from Brazil. The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

    >**Answer:**
1. `sales_agents.sql`: Provide a query showing only the Employees who are Sales Agents.

     >**Answer:** `"Jane"	"Peacock"	"Sales Support Agent"
"Margaret"	"Park"	"Sales Support Agent"
"Steve"	"Johnson"	"Sales Support Agent"`
1. `unique_invoice_countries.sql`: Provide a query showing a unique/distinct list of billing countries from the Invoice table.

     >**Answer:** `"Germany"
"Norway"
"Belgium"
"Canada"
"USA"
"France"
"Ireland"
"United Kingdom"
"Australia"
"Chile"
"India"
"Brazil"
"Portugal"
"Netherlands"
"Spain"
"Sweden"
"Czech Republic"
"Finland"
"Denmark"
"Italy"
"Poland"
"Austria"
"Hungary"
"Argentina"`
1. `sales_agent_invoices.sql`: Provide a query that shows the invoices associated with each sales agent. The resultant table should include the Sales Agent's full name.

     >**Answer:** `412 rows returned in 14ms from: select e.LastName || &quot;, &quot; || e.FirstName as FullName, i.InvoiceId as InvoiceID
from Employee e join Customer c on e.EmployeeId = c.SupportRepId
join Invoice i on c.CustomerId = i.CustomerId
where e.Title = 'Sales Support Agent'
order by EmployeeId || InvoiceId`
1. `invoice_totals.sql`: Provide a query that shows the Invoice Total, Customer name, Country and Sale Agent name for all invoices and customers.

     >**Answer:** `412 rows returned in 16ms from: select i.Total, c.LastName || &quot;, &quot; || c.FirstName as CustomerName, i.BillingCountry as Country, e.LastName || &quot;, &quot; || e.FirstName as SalesAgent
from Employee e join Customer c on e.EmployeeId = c.SupportRepId
join Invoice i on c.CustomerId = i.CustomerId
where e.Title = 'Sales Support Agent'
order by CustomerName`
1. `total_invoices_{year}.sql`: How many Invoices were there in 2009 and 2011? 

     >**Answer:** `"83"	"83"`
1. `total_sales_{year}.sql`: What are the respective total sales for each of those years?

     >**Answer:** `"449.46"	"469.58"`
1. `invoice_37_line_item_count.sql`: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for Invoice ID 37.

    >**Answer:** `4`
1. `line_items_per_invoice.sql`: Looking at the InvoiceLine table, provide a query that COUNTs the number of line items for each Invoice. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)

    >**Answer:** `412 rows returned in 12ms from: select i.InvoiceId,
count(InvoiceId) as TotalLineItems
from InvoiceLine i
group by invoiceId`
1. `line_item_track.sql`: Provide a query that includes the purchased track name with each invoice line item.

     >**Answer:** `2240 rows returned in 17ms from: select il.InvoiceLineId, t.Name
from InvoiceLine il, Track t
where il.TrackId = t.TrackId
group by InvoiceLineId`
1. `line_item_track_artist.sql`: Provide a query that includes the purchased track name AND artist name with each invoice line item.

     >**Answer:** `2240 rows returned in 34ms from: select il.InvoiceLineId, t.Name as TrackName, a.Name as ArtistName
from InvoiceLine il, Track t, Artist a, Album al
where il.TrackId = t.TrackId and t.AlbumId = al.AlbumId and al.ArtistId = a.ArtistId
group by il.InvoiceLineId || t.Name`
1. `country_invoices.sql`: Provide a query that shows the # of invoices per country. HINT: [GROUP BY](http://www.sqlite.org/lang_select.html#resultset)

    >**Answer:** `"Argentina"	"7"
"Australia"	"7"
"Austria"	"7"
"Belgium"	"7"
"Brazil"	"35"
"Canada"	"56"
"Chile"	"7"
"Czech Republic"	"14"
"Denmark"	"7"
"Finland"	"7"
"France"	"35"
"Germany"	"28"
"Hungary"	"7"
"India"	"13"
"Ireland"	"7"
"Italy"	"7"
"Netherlands"	"7"
"Norway"	"7"
"Poland"	"7"
"Portugal"	"14"
"Spain"	"7"
"Sweden"	"7"
"USA"	"91"
"United Kingdom"	"21"`
1. `playlists_track_count.sql`: Provide a query that shows the total number of tracks in each playlist. The Playlist name should be include on the resulant table.

     >**Answer:** `"90’s Music"	"1477"
"Brazilian Music"	"39"
"Classical"	"75"
"Classical 101 - Deep Cuts"	"25"
"Classical 101 - Next Steps"	"25"
"Classical 101 - The Basics"	"25"
"Grunge"	"15"
"Heavy Metal Classic"	"26"
"Music"	"6580"
"Music Videos"	"1"
"On-The-Go 1"	"1"
"TV Shows"	"426"`
1. `tracks_no_id.sql`: Provide a query that shows all the Tracks, but displays no IDs. The result should include the Album name, Media type and Genre.

     >**Answer:** `3257 rows returned in 44ms from: select t.Name as 'Track Name', a.Title as 'Album Title' , mt.Name as 'Media Type', g.Name as 'Genre'
from Track t, Album a, MediaType mt, Genre g
where t.MediaTypeId = mt.MediaTypeId and t.GenreId = g.GenreId and t.AlbumId = a.AlbumId
group by t.Name`
1. `invoices_line_item_count.sql`: Provide a query that shows all Invoices but includes the # of invoice line items.

     >**Answer:** `412 rows returned in 12ms from: select i.InvoiceId, count(il.InvoiceLineId)
from Invoice i join InvoiceLine il on il.InvoiceId = i.InvoiceId
group by i.InvoiceId`
1. `sales_agent_total_sales.sql`: Provide a query that shows total sales made by each sales agent.

     >**Answer:** `"Jane Peacock"	"833.040000000002"
"Margaret Park"	"775.400000000001"
"Steve Johnson"	"720.160000000001"`
1. `top_2009_agent.sql`: Which sales agent made the most in sales in 2009?

    > **Hint:** Use the [MAX](https://www.sqlite.org/lang_aggfunc.html#maxggunc) function on a [subquery](http://beginner-sql-tutorial.com/sql-subquery.htm).
    
     >**Answer:** `"Steve Johnson"	"164.34"`

1. `top_agent.sql`: Which sales agent made the most in sales over all?

    >**Answer:** `"Jane Peacock"	"833.040000000002"`
1. `sales_agent_customer_count.sql`: Provide a query that shows the count of customers assigned to each sales agent.

     >**Answer:** `"Jane Peacock"	"146"
"Margaret Park"	"140"
"Steve Johnson"	"126"1
1. `sales_per_country.sql`: Provide a query that shows the total sales per country.

     >**Answer:** `"Argentina"	"37.62"
"Australia"	"37.62"
"Austria"	"42.62"
"Belgium"	"37.62"
"Brazil"	"190.1"
"Canada"	"303.96"
"Chile"	"46.62"
"Czech Republic"	"90.24"
"Denmark"	"37.62"
"Finland"	"41.62"
"France"	"195.1"
"Germany"	"156.48"
"Hungary"	"45.62"
"India"	"75.26"
"Ireland"	"45.62"
"Italy"	"37.62"
"Netherlands"	"40.62"
"Norway"	"39.62"
"Poland"	"37.62"
"Portugal"	"77.24"
"Spain"	"37.62"
"Sweden"	"38.62"
"USA"	"523.06"
"United Kingdom"	"112.86"`
1. `top_country.sql`: Which country's customers spent the most?

     >**Answer:** `"USA"	"523.06"`
1. `top_2013_track.sql`: Provide a query that shows the most purchased track of 2013.

    >**Answer:**   `"Eruption"	"2"`
1. `top_5_tracks.sql`: Provide a query that shows the top 5 most purchased tracks over all.

     >**Answer:** `"The Trooper"	"5"
"Eruption"	"4"
"Hallowed Be Thy Name"	"4"
"Sure Know Something"	"4"
"The Number Of The Beast"	"4"`
1. `top_3_artists.sql`: Provide a query that shows the top 3 best selling artists.

     >**Answer:** `"Iron Maiden"	"140"
"U2"	"107"
"Metallica"	"91"`
1. `top_media_type.sql`: Provide a query that shows the most purchased Media Type.

    >**Answer:** `"MPEG audio file"	"1976"`
