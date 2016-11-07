select i.InvoiceId, count(il.InvoiceLineId)
from Invoice i join InvoiceLine il on il.InvoiceId = i.InvoiceId
group by i.InvoiceId