-- Atualização das coordenadas do condomínio
update anuncios a 
set latitude = c.latitude 
, longitude = c.longitude 
from condominios c  
where 1=1
and a.latitude is  null and a.longitude is null
and c.id = a.condominio_id  ;



