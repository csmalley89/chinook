select i.InvoiceId,
count(InvoiceId) as TotalLineItems
from InvoiceLine i
group by invoiceId