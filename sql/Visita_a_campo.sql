SELECT a.id, 
a.tipologia_id ,
s.nome  as site, 
t.nome as tipologia, 
a.url, 
a.data, 
a.titulo,
a.descricao,
a.endereco,
b.nome as bairro,
c.nome as cidade, 
a.cep,
c2.nome as condominio,
a.area,
a.preco, 
a.anunciante, 
replace(a.telefone,'.','') as telefone, 
a.quarto, a.suite, a.banheiro, a.vaga, a.andar,  
a.latitude, a.longitude, a.urlmapa
, 'https://web.whatsapp.com/send?phone='
|| '55' || replace(replace(replace(replace(a.telefone,'.',''),')',''),'(',''),' ','')
|| '&text='
|| 
'Bom dia! Gostaria de informações sobre um imóvel à venda que vi em '
|| c.nome ||'. Desde já, agradeço a atenção.'
as msg_whatsapp
FROM public.anuncios a
left join sites s on a.site_id = s.id 
left join cidades c on a.cidade_id = c.id 
left join tipologias t on a.tipologia_id = t.id 
left join bairros b on a.bairro_id = b.id
left join condominios c2 on a.condominio_id = c2.id 
where 1=1
and a.site_id =0
order by telefone, a.data desc ;