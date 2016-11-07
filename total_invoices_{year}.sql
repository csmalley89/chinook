select (
select Count(*) from Invoice where InvoiceDate like "2009%" ) as TotalInvoicesIn2009, ( 
select Count(*) from Invoice where InvoiceDate like "2011%")  as TotalInvoicesIn2011 
