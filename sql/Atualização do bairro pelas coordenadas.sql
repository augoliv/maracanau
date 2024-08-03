-- Atualização do bairro pelas coordenadas
update anuncios a 
set bairro_id = b.id
from bairros b  
where st_contains(b.the_geom,  ST_Transform(ST_SetSRID(a.the_geog::geometry, 4326), 4326))
and a.latitude is not null 
and a.longitude is not null
--and (a.bairro_id is null or a.bairro_id=0)
and a.revisado and a.ativo ;







