--inner join comun
select cl.numero as 'numero de ciente', 
cl.nombre as 'nombre del cliente', 
cl.pais as'pais del cliente', o.fechaorden as 'fecha orden'
, o.fechaEntrega as 'fecha de entrega',
o.clienteid as 'Foreign key de la table cliente' 
from clientes as cl
inner join ordenes as o
on cl.numero = o.clienteid

--left join (la table izquieda siempre es la primera que se pone en el join)
select cl.numero as 'numero de ciente', 
cl.nombre as 'nombre del cliente', 
cl.pais as'pais del cliente', o.fechaorden as 'fecha orden'
, o.fechaEntrega as 'fecha de entrega',
o.clienteid as 'Foreign key de la tabla cliente' 
from clientes as cl
left join ordenes as o
on cl.numero = o.clienteid
where o.clienteid is Null

--seleccionar todos los datos de la tabla ordenes 
-- y la tabla clientes utilizando un left join
select c.numero as 'numero de ciente', 
c.nombre as 'nombre del cliente', 
c.pais as'pais del cliente', o.fechaorden as 'fecha orden'
, o.fechaEntrega as 'fecha de entrega',
o.clienteid as 'Foreign key de la tabla cliente' 
from Ordenes as o
left join clientes as c 
on c.numero = o.clienteid

--right join

select cl.numero as 'numero de ciente', 
cl.nombre as 'nombre del cliente', 
cl.pais as'pais del cliente', o.fechaorden as 'fecha orden'
, o.fechaEntrega as 'fecha de entrega',
o.clienteid as 'Foreign key de la tabla cliente' 
from clientes as cl
right join ordenes as o
on cl.numero = o.clienteid

--full join
select cl.numero as 'numero de ciente', 
cl.nombre as 'nombre del cliente', 
cl.pais as'pais del cliente', o.fechaorden as 'fecha orden'
, o.fechaEntrega as 'fecha de entrega',
o.clienteid as 'Foreign key de la tabla cliente' 
from clientes as cl
full join ordenes as o
on cl.numero = o.clienteid

-- extra 
select o.numero,nombre,pais,fechaorden from ordenes as o
full join 
(select numero,nombre, pais from clientes) as c
on o.clienteid = c.numero
