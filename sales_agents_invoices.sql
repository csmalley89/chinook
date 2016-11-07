select e.LastName || ", " || e.FirstName as FullName, i.InvoiceId as InvoiceID
from Employee e join Customer c on e.EmployeeId = c.SupportRepId
join Invoice i on c.CustomerId = i.CustomerId
where e.Title = 'Sales Support Agent'
order by EmployeeId || InvoiceId