SELECT a.id as codigo, t.nome as tipologia, 
coalesce(l.nome, c.nome) as loteamento_condominio,
--titulo, 
area,
preco, 
round(preco/area, 2) as preco_unit, 
"data",
-- anunciante, telefone, 
 a.endereco, b.nome ,
 municipio, a.uf, 
 a.latitude, a.longitude, 
 --siteorigem, 
 url, a.urlmapa,a.created,
 a.the_geog 
FROM public.anuncios a 
join bairros b on a.bairro_id = b.id
join tipologias t on a.tipologia_id = t.id 
left join loteamentos l on a.loteamento_id = l.id 
left join condominios c on a.condominio_id = c.id
join public.limite_municipal lm on 
	ST_intersects(lm.the_geog, a.the_geog)
where a.cidade_id = 7 
and tipologia_id = 3
and a.ativo  
and revisado 
and preco is not null 
and area > 0
and a.the_geog is not null 
order by round(preco/area, 2) desc