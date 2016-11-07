select il.InvoiceLineId, t.Name as TrackName, a.Name as ArtistName
from InvoiceLine il, Track t, Artist a, Album al
where il.TrackId = t.TrackId and t.AlbumId = al.AlbumId and al.ArtistId = a.ArtistId
group by il.InvoiceLineId || t.Name