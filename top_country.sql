select c.Country, sum(i.Total) as 'TotalSales in Country' 
from Customer c join Invoice i 
on c.CustomerId = i.CustomerId
group by c.Country
order by sum(i.Total)
desc limit 1
