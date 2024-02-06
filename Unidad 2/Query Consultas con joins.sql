use NORTHWND

--iner join

--Selecionar las ordenes, el nombre del cliente y la fecha
Select orderid, CompanyName ,OrderDate 
from Orders as o
inner join Customers as c
on c.CustomerID= o.CustomerID

--Mostrar el numero de ordenes de cada cliente mostrandoel nombre de la compania
Select CompanyName ,count (*) as 'total' 
from Orders as o
inner join Customers as c
on c.CustomerID= o.CustomerID 
group by CompanyName
order by 2 desc

--Seleccionar el umero de producto, el nombre del producto y el 
--nombre de categoria , ordenados de forma ascendente con respecto al nombre 
--de la categoria

select Products 