select e.FirstName ||' '|| e.LastName as 'Sales Agent', 
sum(i.Total) as 'Rep Sales Total' from Employee e 
join Customer c on c.SupportRepId = e.EmployeeId
join Invoice i on i.CustomerId = c.CustomerId 
where e.Title = 'Sales Support Agent' 
group by e.EmployeeId
order by sum(i.Total)
desc limit 1