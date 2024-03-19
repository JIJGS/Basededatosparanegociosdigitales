use NORTHWND

create view vistaConsula1
as
select c.CompanyName as 'Nombre Cliente'
,min(o.OrderDate) as 'Fecha Primera compra',
sum(od.Quantity * od.UnitPrice) as 'Total de compras del cliente'
from Orders as o
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Customers as c
on c.CustomerID = o.CustomerID
group by c.CompanyName
having sum(od.Quantity * od.UnitPrice) >1000

select * from vistaConsula1
where [Nombre Cliente]= 'vaffeljernet'

select sum([Total de compras del cliente]) as totla
from vistaConsula1
where year ([Fecha Primera compra]) = '1997'


