-- Atualização das coordenadas do condomínio
update anuncios a 
set loteamento_id = l.id
from loteamentos l  
where 1=1
and a.latitude is not null and a.longitude is not null
and st_contains(
	l.the_geom, 
	st_transform(
		st_setsrid( st_makepoint(a.longitude, a.latitude),4326),
		31984))
;


select a.id, l.id 
from loteamentos l  
join anuncios a 
	on st_contains(
	l.the_geom, 
	st_transform(
		st_setsrid( st_makepoint(a.longitude, a.latitude),4326),
		31984))
where 1=1
and a.latitude is not null and a.longitude is not null
;