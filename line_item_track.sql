select il.InvoiceLineId, t.Name
from InvoiceLine il, Track t
where il.TrackId = t.TrackId
group by InvoiceLineId