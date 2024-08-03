SELECT id, site_id, cidade_id, tipologia_id, codigo, url, siteorigem, "data", 
tipologia, titulo, preco, condominio, area, anunciante, telefone, 
descricao, caracteristica, quarto, suite, banheiro, vaga, andar, 
endereco, bairro, cep, municipio, uf, latitude, longitude, urlmapa, imagem, 
prioridade, aluguel, ativo, created, modified, condominio_nome, loteamento_nome, 
grpfor_mercado_id, download, revisado, repetido, the_geog, nao_localizado, 
modified_by, condominio_id, bairro_id, loteamento_id, codigo_temp
FROM public.anuncios;

select count(*) 
from anuncios a 
where ativo 
and (
latitude is null 
or longitude is null
or preco is null 
or preco = 0
or area is null
or area = 0
);

select count(*) 
from anuncios a 
where ativo 
and (nao_localizado );

update anuncios 
set ativo = false 
where ativo 
and (
titulo is null
or latitude is null 
or longitude is null
or preco is null 
or preco = 0
or area is null
or area = 0
);
