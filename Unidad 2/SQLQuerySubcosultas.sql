--Swich en consultas 
use NORTHWND

--Sintaxis 
/*
CASE
    WHEN condicion1 THEN resolucion1
	WHEN condicion1 THEN resolucion1
	WHEN condicion1 THEN resolucion1
	ELSE result
END;
*/

SELECT *, 
		 CASE
			 WHEN Quantity > 30THEN 'La cantidad es mayor a 30'
			 WHEN Quantity = 30 THEN 'La cantidad es 30'
			 ELSE 'La canitdad esta por debajo de 30'
			 END AS CantidadTexto
FROM [Order Details]

select *,
		 case
		 when UnitsInStock = 0 then 'sin stock'
			when UnitsInStock between 0 and 20 then 'stock bajo'
			when UnitsInStock between 21 and 50 then 'stock medio'
			when UnitsInStock>=52 and UnitsInStock <= 90 then 'Stock alto'
			else 'stock maximo'
			end as 'tipo de stock'
from Products


create database pruebacase

use pruebacase

create table nuevatabla(
id int not null,
nombre nvarchar(40) not null,
unitprice money,
unitsinstock smallint,
constraint pk_nuevatabla
primary key(id)
)

--Crea la estructura de una tabla base a una consulta
alter table nuevatabla2
add constraint pk_nuevatabla2
primary key(numeroproducto)

select top 0 ProductID as numeroproducto,
ProductName as descripcion, UnitPrice as preciounitario,
UnitsInStock as existencia
into nuevatabla2
from NORTHWND.dbo.products


select ProductID as numeroproducto,
ProductName as descripcion, UnitPrice as preciounitario,
UnitsInStock as existencia
into nuevatabla3
from NORTHWND.dbo.products

select * from nuevatabla2

--insert nuevatabla2se

select p.Product
		 case
		 when UnitsInStock = 0 then 'sin stock'
			when UnitsInStock between 0 and 20 then 'stock bajo'
			when UnitsInStock between 21 and 50 then 'stock medio'
			when UnitsInStock>=52 and UnitsInStock <= 90 then 'Stock alto'
			else 'stock maximo'
			end as 'tipo de stock'

into tablaconcase
from NORTHWND.dbo.products as p

select * from tablaconcase