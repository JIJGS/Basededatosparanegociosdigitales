--Practica #2
CREATE DATABASE Practica#2
go

--cambiar base de datos 
USE Practica#2
go

-- Crear la tabla Cliente
CREATE TABLE tblcliente(
clienteId int not null,
nombre varchar (100) not null,
direccion varchar (100) not null,
tel varchar (20) not null,
constraint pk_tblcliente
primary key (clienteId),
constraint unique_nombre
unique(nombre)
)

--crear la tabla Empleados
CREATE TABLE tblempleados(
empleadosId int not null,
nombre varchar(50) not null,
apellidos varchar(80) not null,
sexso varchar(1) not null, 
salario decimal(10,2) not null,
constraint pk_tblempleados
primary key (empleadosId),
constraint chk_salario
check(salario>=400 and salario<=50000)
)

--crear la tabla ventas
create table tblventa(

)