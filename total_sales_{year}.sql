select (
select total(Total) from Invoice where InvoiceDate like "2009%" ) as TotalSalesIn2009, ( 
select total(Total) from Invoice where InvoiceDate like "2011%")  as TotalSalesIn2011 