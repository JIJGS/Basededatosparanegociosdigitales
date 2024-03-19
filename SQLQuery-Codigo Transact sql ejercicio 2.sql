USE NORTHWND

declare @waww int
set @waww = 10
if @waww > 5
	begin
	print ('el numero es mayor a 5')
end
else 
	begin
	print ('el numero es menor a 5')
end

--transact sql ejercicio 1
-- realizar un codigo transact para determinar si una persona tiene la edad para
-- bebe alcohol. El codigo debe tener variables que determinen la edad minima permitida
-- y orea variable con la edad de la persona.

declare @ageminimiun int
set @ageminimiun = 18 
declare @personage int
set @personage = 19
if @personage >= @ageminimiun
	begin
	print ('La persona tiene la edad permitida para beber')
end
else 
	begin
	print ('La persona no tiene la edad permitida para beber')
end

-- Codigo Transact sql ejercicio 2 
-- solicitar una evaluacion

declare @calif float
set @calif = 79.5
if @calif <= 100 and @calif >= 90.0
	begin
	print ('La calificacion es una A')
end

else if @calif >= 80.0 and @calif < 90.0
	begin
	print ('La calificacion es una B')
end

else if @calif >= 70.0 and @calif < 80.0
	begin
	print ('La calificacion es una C')
end
else 
	begin
	print ('La calificacion es Reprobaria')
end

-- solicitar un salario
-- si es mayor a 4000 que se calcule un incremento del 20%
-- si es mayor o igual a 5000 que se calcule un incremento del 30%
-- si es mayor menor a 4000 el aumento es de 0

declare @salary float
set @salary = 5689
declare @bono float
declare @salaryfin float
if @salary >= 5000 
begin 
	set	@bono = @salary * 0.30
	set @salaryfin = @salary + @bono
	print ('el bono de salario del empleado es de 30%  ' + cast(@bono as varchar(20)) + ' ' + 'el salario completo es de: ' + cast(@salaryfin as varchar(20))) 
end
else if @salary >= 4000 
begin 
	set	@bono = @salary * 0.20
	set @salaryfin = @salary + @bono
	print ('el bono de salario del empleado es de 20%  ' + cast(@bono as varchar(20)) + 'el salario completo es de: ' + cast(@salaryfin as varchar(20))) 
end
else 
begin
	print('El empleado no tiene ningun tipo de bono, su salario sigue siendo de: ' + cast(@salary as varchar(20)))
end

--Generar un SP donde se compare si un producto tiene mas de 100 unidades en stock
-- incrementar su precio en un 10% de lo contrario incrementarlo en 20%

use NORTHWND

alter proc incrementproduct
@idtoproduct int 
AS 
begin --Iniciar untramo de codigo
declare @prodstock int
declare @incremento int
declare @prodincre int
select @prodstock = UnitsInStock
from Products
where ProductID = @idtoproduct
if @prodstock >= 100
	begin
	set @incremento = @prodstock * 0.10
	set @prodincre = @prodstock + @incremento
	Update Products
	SET UnitsInStock = UnitsInStock + @incremento  
	where ProductID = @idtoproduct
	print('El numero de productos se encuentra arriba de 100 su total es de: ' + cast(@prodincre as varchar(20)))
	end
else 
	begin
	set @incremento = @prodstock * 0.20
	set @prodincre = @prodstock + @incremento
	Update Products
	SET UnitsInStock = UnitsInStock + @incremento  
	where ProductID = @idtoproduct
	print('el stock no llega a la media considerada: ' + cast(@prodincre as varchar(20)))
	end
end
go

exec incrementproduct 10


select * from Products

