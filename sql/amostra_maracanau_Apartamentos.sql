SELECT a.id as codigo, t.nome as tipologia, 
c.nome as condominio,
c.padrao_acabamento,
--titulo, 
area,
preco, 
round(preco/area, 2) as preco_unit, 
"data",
-- anunciante, telefone, 
 c.endereco, b.nome ,
 municipio, a.uf, 
 c.latitude, c.longitude, 
 --siteorigem, 
 url, a.urlmapa,a.created,
 a.the_geog 
FROM public.anuncios a 
join tipologias t on a.tipologia_id = t.id 
join public.limite_municipal lm on 
	ST_intersects(lm.the_geog, a.the_geog)
join condominios c on a.condominio_id = c.id
left join bairros b on c.bairro_id = b.id
where a.cidade_id = 7 
and tipologia_id = 1
and a.ativo  
and revisado 
and preco is not null 
and area > 0
and a.the_geog is not null 
order by round(preco/area, 2) desc