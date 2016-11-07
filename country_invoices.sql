select c.Country, count(InvoiceId)
from Customer c
join Invoice i on i.CustomerId =c.CustomerId
group by Country
