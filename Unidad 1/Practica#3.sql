--Practica#3
--Crear la Base de Datos Practica#3

CREATE TABLE Practica#3
go

--cambiar la base de datos
USE Practica#3
go

--Crear la Tabla Categoria
CREATE TABLE categoria(
categoriaId int not null,
numero int not null,
descripcion varchar (50) not null,
constraint pk_categoria
primary key(categoriaId,numero)
)

--Crear la Tabla producto
CREATE TABLE producto(
productoId int not null,
descripcion varchar (100) not null,
precio decimal (10,2) not null,
stock int not null,
categoriaId int not null,
numeroInventario int not null,
constraint pk_cproducto
primary key(productoId)
constraint fk_producto_categoria
foreign key (categoriaId,numeroInventario)
references categoria(categoriaId,numero)
)
go