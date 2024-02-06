use NORTHWND

--Consultas de Agragado
--Caracteristicas principales es que devuelve un solo registro

-- top y percent

--selecciona las primeras 10 ordenes de compra

--los primeros 10 registros
select  top 10 * from Orders

-- los 10 ultimos registros
select  top 10 * from Orders
order by OrderID desC

select  top 10 CustomerID as 'Numero de Cliente', 
OrderDate as 'Fecha de Orden',ShipCountry from Orders as 'Pais de Entregs',
from Orders
order by OrderID desc

--Seleccionar el 50% de los registros

select top 50 percent * from Orders

select top 25 percent * from Orders

--(Ejercicio) Seleccionar los primeros 3 clientes de alemania
Select top 3 * from Customers
where Country = 'Germany'

Select top 3 CompanyName as 'Cliente', Country as pais, address as direccion 
from Customers
where Country = 'Germany'

--Seleccionar el producto con el precio mayor
Select * from Products
order by UnitPrice desc


--"consulta de agragado"
--Muestra el precio mas alto de lo productos (max)
select max(UnitPrice) as 'Precio Maximo' from Products

-- Mostra el precio minimo de los producto
select min(UnitPrice) as 'Precio Minimo' from Products 


--Seleccionar todas las ordenes de compras
select * from Orders

--selecionar el numero total de ordenes (count)

select count(*) as 'Total de ordenes' from Orders

select count(ShipRegion) as 'Total de ordenes' from Orders

--seleccionar todas aquellas ordenes donde la region de envio no sea null

select count(*) from Orders
where ShipRegion is not null

-- seleccionar de forma acendente los productos por precio

select * from Products 
Order by UnitPrice

--seleccionar el numero de precios de los prodcutos 
select count(distinct UnitPrice) from Products 

--Contar todos los diferentes paices de los 
select count(distinct Country) as 'Numero de Paises'from Customers

--Seleccionar la suma total de cantidades delas ordenes de la compra
select sum(Quantity) from [Order Details]

select * from [Order Details]

--Selecconar todos lo registros de orders details calculando su importe
-- (Campo calculado)

select *,(UnitPrice*Quantity) as 'importe' from [Order Details]

--Seleccionar en total el dinero que ha vendido la empresa

select sum(UnitPrice*Quantity) as 'Total' from [Order Details]
