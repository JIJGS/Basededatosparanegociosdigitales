/*Objeten el nombre del producto y la cantidad total vendida 
para los productos vendidos en 1997, ordenados por lacantidad 
total en orden descendente
*/
use NORTHWND

select p.ProductName as 'nomrbreproducto', (od.Quantity * od.UnitPrice) as 'importe'
from [Order Details] as od
inner join Products as p
on p.ProductID = od.ProductID
inner join Orders as o
on o.OrderID = od.OrderID
where year (o.OrderDate)='1997'
order by 2

select c.CompanyName as 'cleinte', count(*)as 'cantidad compras'
from Orders as o
inner join Customers as c
on o.CustomerID = c.CustomerID
group by c.CompanyName
having count(*)>1
