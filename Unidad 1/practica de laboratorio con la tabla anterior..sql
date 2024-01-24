--practica de laboratorio con la tabla anterior.

Use PruebaEntornos

--insertar datos apartir de una consulta 
select * from categoriaCopia

insert into categoriaCopia (categoriaId,nombre)
select idCategoria, descripcion from Categoria

--Actualizacion de datos sql-lmd

select * from categoriaCopia

insert into Producto 
values(1,'salchicha'. 600, 12,1

insert into Producto 
values(1,'paleta de pollo'. 22, 56,8)

insert into Producto 
values(3,'Refrigerador'. 3000, 22,5),
	  (3,'Chilindrina'. 23, 43,9),
	  (3,'Terrible Mezcal'. 200, 12,2),
 	  (3,'Leche de Burra'. 2350, 3,2),

/* sintaxis de un update:
   update nombre de tabla 
   set campo = valor
   where condicion 
*/


select * from Producto

update Producto
set idproducto = 2
where nombre = 'paleta de pollo'

update Producto
set idproducto = 4
where nombre = 'Chilindrina' 

update Producto
set idproducto = 5
where nombre = 'Terrible Mezcal' 

update Producto
set idproducto = 6
where nombre = 'Leche de Burra' 

update Producto
set nombre ='salchicha Grande',
	existencia = 20
where ProductoId = 1

alter table Producto
add constraint pk_producto
primary key(idproducto)


/* eliminar registros de una tabla
sintaxis:

	delete from table 
	where expresion
*/

select * from Producto
delete from Producto
where ProductoId = 4

delete from Producto
where nombre ='Salchicha Grande'

delete from Producto
where precio >=3 and precio<=22

delete from Producto
where existencia >=3 and existencia<=12

