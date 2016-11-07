select t.Name as TrackName, count(il.TrackId)
from InvoiceLine il join Invoice i 
on i.InvoiceId = il.InvoiceId
join Track t on  t.TrackId = il.TrackId
group by t.Name
order by count(il.TrackId)
desc limit 5