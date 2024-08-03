SELECT id, 
codigo, url, siteorigem, "data", tipologia, titulo, 
descricao, titulo, 
preco, 
condominio, area, anunciante, telefone, 
 quarto, suite, banheiro, vaga, andar, endereco, bairro, cep, 
 municipio, uf, latitude, longitude, 
 urlmapa, imagem,  created, modified, condominio_nome, loteamento_nome
FROM public.anuncios
where cidade_id = 7
order by created desc, tipologia;