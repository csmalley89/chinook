select i.Total, c.LastName || ", " || c.FirstName as CustomerName, i.BillingCountry as Country, e.LastName || ", " || e.FirstName as SalesAgent
from Employee e join Customer c on e.EmployeeId = c.SupportRepId
join Invoice i on c.CustomerId = i.CustomerId
where e.Title = 'Sales Support Agent'
order by CustomerName