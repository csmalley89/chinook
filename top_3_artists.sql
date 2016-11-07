select a.Name as Artist, count(il.TrackId)
from InvoiceLine il join Invoice i 
on i.InvoiceId = il.InvoiceId
join Track t on  t.TrackId = il.TrackId
join Album al on al.AlbumId = t.AlbumId
join Artist a on a.ArtistId = al.ArtistId
group by a.Name
order by count(il.TrackId)
desc limit 3