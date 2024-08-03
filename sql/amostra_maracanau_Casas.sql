SELECT a.id as codigo, t.nome as tipologia, 
--titulo, 
area,
preco, 
round(preco/area, 2) as preco_unit, 
"data",
-- anunciante, telefone, 
 endereco, b.nome ,
 municipio, a.uf, latitude, longitude, 
 --siteorigem, 
 url, urlmapa,a.created,
 a.the_geog 
FROM public.anuncios a left join bairros b 
	on a.bairro_id = b.id
join tipologias t on a.tipologia_id = t.id 
join public.limite_municipal lm on 
	ST_intersects(lm.the_geog, a.the_geog)
where a.cidade_id = 7 
and tipologia_id = 2
and a.ativo  
and revisado 
and not aluguel
and preco is not null 
and area > 0
and a.the_geog is not null 
and round(preco/area, 2) between 200 and 7000
order by round(preco/area, 2) desc;