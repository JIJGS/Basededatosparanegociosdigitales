
--Lernguaje SQL de manipulación de datos (SQL-LMD) (incert, delete, update, select)

USE PruebaEntornos 

--Seleccionar todos los datos de la tabla Categoria

SELECT * FROM Categoria

--Agregar 1 sola fila a la tabla (Categoria)

INSERT INTO Categoria
VALUES (1, 'Carnes Frias')

INSERT INTO Categoria
VALUES (2, 'Lacteos')

INSERT INTO Categoria
VALUES (3, 'Vinos & Licores')

INSERT INTO Categoria
VALUES (4, 'Ropa')

INSERT INTO Categoria(IdCategoria, Iddescripcion)
VALUES(5, 'Linea Blanca')

INSERT INTO Categoria(IdCategoria, Iddescripcion)
VALUES(6, 'Electronica')

--Insrtar varios registros a la vez
INSERT INTO Categoria
VALUES (7, 'Carnes Blancas'),
		(8, 'Dulces'),
		(9, 'Panaderia'),
		(10, 'Salchichoneria')

--Insertar apartir de una consulta

select IdCategoria, Iddescripcion from Categoria(

CREATE TABLE CategoriaCopia
	IdCategoria int not null primary key,
	nombre varchar(100) not null
	)
	go