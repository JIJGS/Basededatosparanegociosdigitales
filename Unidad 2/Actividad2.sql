--Crear un sp que permita insertar registros en la tabla customers

Create proc insert_customer_sp
@companyname nvarchar (40),
@country nvarchar (15),
@city nvarchar (15)
as
begin
	insert into Customers (CompanyName, Country, City)
	values (@companyname,@country,@city)
end

exec insert_customer_sp
@companyname = 'pepe',
@country = 'Germnay',
@city = 'Berlin'

--Crea un sp que permita eliminar registros  en la tabla customer, por customer id
create proc eliminar_registros
@companyname  nvarchar (40),
@contactname  nvarchar (40),
@phone nvarchar (24)
as
begin
	def delete
end
	