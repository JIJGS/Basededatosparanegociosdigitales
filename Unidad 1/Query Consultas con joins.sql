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

select CompanyName, count (*) as 'Total de Pedido'
from Orders as o
inner join Customers as c
on c.CustomerID = o.CustomerID
group by CompanyName
order by 2 desc

--Seleccionar el numero de producto, el nombre del producto y el 
--nombre de categoria , ordenados de forma ascendente con respecto al nombre 
--de la categoria

-- 7 DE FEBRERO

--Seleccionar todas la ordenes de compra 
--mostrando las fechas ordenes de compra 
--nombre del shipper y el nombre del ciente 
--al que se le vendio (inner joi)

select c.CompanyName as 'Cliente',
o.OrderDate as 'Fecha de orden',
s.CompanyName as 'Nombre flete'
from 
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join Shippers as s
on o.ShipVia = s.ShipperID

--Seleccionar el nombre del producto  y su categoria

Select p.ProductName as 'Nobre de productos',
c.CategoryName as 'Nombre de catogria'
from 
Products as p
inner join Categories as c
on c.CategoryID = p.CategoryID



--Listar el nombre del cliente, a fecha de la orden,
--los nombres de los producto que fueron vendidos

select c.CompanyName as 'Cliente', o.OrderDate as 'Fecha', p.ProductName as 'Productos'
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID

--Seleccionar los nobres completos de los epleados,
--Los nombres de los productos que vendio y la catidad 
--de ellos y calcular el importe

Select CONCAT(e.FirstName, '', e.LastName) as 'Nombre completo',p.ProductName as 'Descripcion', 
od.Quantity as 'Cantidad', 
(od.Quantity * od.UnitPrice) as 'Importe'
from
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID


-- Sellecionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad 
--de ellos y calcular el imoorte 
--pero solo los enviados a suiza, alemania y francia 

Select CONCAT(e.FirstName, '', e.LastName) as 'Nombre completo',p.ProductName as 'Descripcion', 
od.Quantity as 'Cantidad', 
(od.Quantity * od.UnitPrice) as 'Importe'
from
Employees as e
inner join Orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on o.OrderID = od.OrderID
inner join Products as p
on od.ProductID = p.ProductID
where o.ShipCountry in ('France', 'Germany','switzerland')

-- Sellecionar los nombres completos de los empleados,
--los nombres de los productos que vendio y la cantidad 
--de ellos y calcular el imoorte 
--pero solo los enviados a suiza, alemania y francia 
--Agrupados por la catidad total de ordenes echas por los empleados

select CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo',o.ShipCountry ,count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName), o.ShipCountry
order by 1

-- Total de ordenes enviadas a Francia, alemania y suiza
select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')


-- Seleccionar el numero de ordenes enviadas a alemania, suiza y francia
-- agrupadas por el empleado
select count(*) as 'Total de Ordenes', CONCAT(e.FirstName, ' ', e.LastName)
as 'Nombre Completo'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland')
group by CONCAT(e.FirstName, ' ', e.LastName)

--8 de febrero

--seleccionar solo las ordenes hechas por Andrew Fuller a los paises francia, alemania y suiza

select count(*) as 'Total de Ordenes'
from
employees as e
inner join orders as o
on e.EmployeeID = o.EmployeeID
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner join Products as p
on p.ProductID = od.ProductID
where o.ShipCountry in ('France', 'Germany','Switzerland') and e.EmployeeID = 2
order by 1


--seleccionar el total de dinero que se le ha
--vendido a cada uno de los clientes 
-- de 1996

select c.CompanyName as 'Cliente', 
sum(od.UnitPrice * od.Quantity) as 'Total de ventas'
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where year (o.OrderDate) = '1996'
group by CompanyName
Order by 2 desc


--seleccionar el total de dinero que se le ha
--vendido a cada uno de los clientes 
-- por cada año

select c.CompanyName as 'Cliente', year(o.OrderDate) as 'Años Transcurridos',
sum(od.UnitPrice * od.Quantity) as 'Total de ventas'
from
Customers as c
inner join Orders as o
on c.CustomerID = o.CustomerID
inner join [Order Details] as od
on od.OrderID = o.OrderID
where year (o.OrderDate) in (1996, 1997, 1998)
group by CompanyName, year(o.OrderDate)
Order by 1 asc


--seleccionar el importe total que se ha vendido por categoria de productos

select ca.CategoryName as 'Categoria',
sum(od.UnitPrice * od.Quantity) as 'Total de ventas'
from
Orders as o
inner join [Order Details] as od
on od.OrderID = o.OrderID
inner Join Products as pr
on pr.ProductID = od.ProductID
inner join Categories as ca
on ca.CategoryID = pr.CategoryID
group by ca.CategoryName
Order by 1 asc


--
--seleccionar el importe total que se ha vendido por categoria de productos 
--por categoria y nombre de producto que permita visualisar el producto mas vendido


--13-02-24 martes.
--Selecciona el numero de productos, el nombre de productos y el 
--ombre de categorias, ordenados de forma hacendente con respecto al 
--nombre de la categoria.

select p.ProductID, p.ProductName, c.CategoryName
from Products as p
inner join Categories as c
on p.CategoryID = c.CategoryID
order by c.CategoryName asc 

--Left join 
Select c.CompanyName, o.OrderID from  Customers as c
left outer join
Orders as o 
on c.CustomerID =  o.CustomerID
where O.OrderID is null


