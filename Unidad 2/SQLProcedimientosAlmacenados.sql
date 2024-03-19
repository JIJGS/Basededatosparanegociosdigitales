-- Procedimientos Almacenados

use NORTHWND
go

select * from Customers
go

-- SP Para visualizar los clientes (Sintaxis)
--Para crear un sp
create proc VisualizarClientes
as
begin
select * from Customers
end
go

--Cambiar un sp
alter proc VisualizarClientes
as
begin
select CompanyName, ContactName from Customers
end
go

-- Eliminar 
drop proc VisualizarClientes
go
-- Ejecutar sp
exec VisualizarClientes
go

--
create proc ListarClientesPorCiudad
@cuidad nvarchar (15)
as
begin
select * from Customers
where City = @cuidad
end 
go

exec ListarClientesPorCiudad 'berlin'

create proc ListarClientesPorNombre
@nombre nvarchar (40)
as
begin
select * from Customers
where CompanyName like @nombre + '%'
end 
go

exec ListarClientesPorNombre 'la'

--Realizar un sp que obtenga las vetas totales
--realizadas a los cleintes por año elegina

create proc VentasClientePorAño
@ nvarchar ()
as
begin

end 
go