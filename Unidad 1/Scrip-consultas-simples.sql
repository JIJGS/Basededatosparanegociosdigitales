-- consultas simples con Slect - sql-lms
use NORTHWND
-- selecionar todos los clientes 
select * from Customers

--selecionar el nombre del cliente, nombre de contacto y la Ciudad
select CompanyName, ContactName, City from Customers 

--SELECIONAR TODOS LO PAISES DE LOS CLIENTES (distinct)
select country from Customers

select distinct country from Customers

--Selecciona el numero de paises de donde son nuestrs clientes (count)

select count(*) from Customers

select count(Country) from Customers

--quita balores repetidos de una columna

select count (distinct Country) from Customers

/* select 
   froms tabla
   where
*/

--Selecionar el cliente que teng un id Anton

select * from Customers
where CustomerID = 'Anton'

--Selecionar todos los clientes de México

select * from Customers
where Country = 'Mexico'

--Selecionar todos los registros de los clientes de berlin
select * from Customers
where City = 'berlin'

--Order by 
--selecionar todos los productos ordenados por precio

select * from Products
order by UnitPrice

--seleccionar todos los producto ordenados por el precio de mayor a menor

select * from Products
order by UnitPrice DESC

--SELECIONAR TODOS LOS PRODUCTOS ALFAVETICAMENTE

select * from Products
order by ProductName

select * from Products
order by ProductName desc

--Selecionar todos los clientes por pais y dentro por nombre de forma acendente 

select Country, CompanyName, city from Customers
order by Country, CompanyName 

select Country, CompanyName, city from Customers
order by Country desc, CompanyName asc

-- Operador and
-- Selecionar todos lo clientes de españa y que su nombre comience con G
-- city like '%G'

Select * from Customers
where Country = 'Spain' and CompanyName like 'G%'


--Selecnionar todos lo cliente de Berlin, alemania 
--con codigo postalmmayor a 1200

Select * from Customers
where Country = 'Germany' and 
city = 'Berlin' and postalCode >1200


--Seleccionar todos lo clientes de españa y que todos 
--los nombres comiencen con G o con R

Select * from Customers
where Country = 'Spain' and 
(CompanyName like 'G%' or CompanyName like 'R%')

--clausula or
--Selecionar todos los clientes de alemania o españa

Select * from Customers
where Country = 'Germany' and Country = 'Spain'

Select * from Customers
where Country = 'Germany' or Country = 'Spain'

--Seleccionar todos los clientes de berlin o de noruega o que 
--comience su nombre con g

Select * from Customers
where Country = 'Norway' or 
city = 'Berlin' 
or CompanyName like 'G%'

--Selecionar solo los clinetes que no son de spaña
Select * from Customers
where not Country = 'Spain'

--Seleccionar todos los productos que no tnegan un precio ente
--18 y 20 dolares

select * from Products
where not (UnitPrice >= '18' 
and UnitPrice <= '20')

--Usando between
select * from Products
where UnitPrice not between 18 and 20

--Selecionar todos los clientes que no son de paris o de londres

Select * from Customers
where not (City = 'Paris'
or City = 'London') 

--Ocupando en in
Select * from Customers
where city not in ('Paris', 'London')

--Seleccionar todos los productos que no tiene precios mayores a 30
select * from Products
where not UnitPrice > '30'

--Seleccionar todos los produco¿tos que no tiene precios menores a 30
select * from Products
where not UnitPrice < '30'

--Operador like
--Seleccionar todos lo clientes que comienzan con la letra a
Select * from Customers
where CompanyName like 'a%'

--Selecionar todos los clientes que finalizan con la palabra es
Select * from Customers
where CompanyName like '%es'

--Seleccionar todos los clientes que contengan la palabra mer
Select * from Customers
where CompanyName like '%mer%'

--Seleccionar todos lo clientes con una ciudad que comienze con 
--cualquier caracter seguido de la palabra andon

select * from Customers
where City like '_ondon'

select * from Customers
where City like '_e_i_o'
------

--Seleccionar todos los clientes con una ciudad que comience 
--con "L" seguido de 3 cualquier caracter y que termine con la 
--palabra on

select * from Customers
where City like 'L___on'

--seleccionar todos los productos que comience con la letra "A" o "C" o "T"

select * from Products
where ProductName like '[act]'

--Seleccionar todos los productos que comiencen de la letra "B" a "D"

select * from Products
where ProductName like '[b-g]%'

--Clausura in()
--Seleccionar todos los clientes de alemania, españa, reino unido

select * from Customers
where Country in('germany', 'spain', 'uk')


--lo mismo pero más largo
select * from Customers
where Country ='germanu'
or Country='spain'
or Country='uk'

--not in
--seleccionar todos los clientes que no son de alemania, españa y reino unido

select * from Customers
where Country not in('germany', 'spain', 'uk')

--lo mismo pero más largo
select * from Customers
where not (Country ='germany'
or Country='spain'
or Country='uk')

--instruccion beteween (es un rango)
--Seleccionar todos los productos con un precio entre 10 y 20 USD

select * from Products
where UnitPrice between 10 and 20

--lo mismo pero más largo

select * from Products
where UnitPrice >= 10 and UnitPrice <=20

--alias de columnas y alias de tablas

--seleccionar el nombre del producto, su stock y precio

select * from Products
select ProductName as 'Nombre del Producto',
UnitsInStock as existencia, UnitPrice from Products

select ProductName as 'Nombre del Producto',
UnitsInStock as existencia, p.UnitPrice precio
from Products as p
inner join [Order Details] as od
on p.ProductID = od.ProductID