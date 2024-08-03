SELECT a.id, a.cidade_id , a.tipologia_id , a.site_id, a.condominio_id , a.loteamento_id,
s.nome  as site, 
t.nome as tipologia, 
a.url, 
a.data, 
a.titulo,
replace(substring(regexp_replace(a.descricao, E'[\\n\\r]+', ' ', 'g' ) ,1, 50),'\n','') || '...' as descricao,
a.endereco,
b.nome as bairro,
c.nome as cidade, 
a.cep,
c2.nome as condominio,
l.nome as loteamento,
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
case 
	when a.site_id = 0 then
	'Bom dia! Gostaria de informações sobre um imóvel à venda que vi em '	
	|| c.nome ||'. Desde já, agradeço a atenção.'
	else 
	'Bom dia! Gostaria de informações sobre um imóvel à venda que vi anunciado no site '	
	|| s.nome
	|| '. Desde já, agradeço a atenção.'	
end 
as msg_whatsapp
FROM public.anuncios a
left join sites s on a.site_id = s.id 
left join cidades c on a.cidade_id = c.id 
left join tipologias t on a.tipologia_id = t.id 
left join bairros b on a.bairro_id = b.id
left join condominios c2 on a.condominio_id = c2.id 
left join loteamentos l on a.loteamento_id = l.id
where 1=1
and telefone is not null 
and telefone ilike '(85) 9%'
--and a.site_id =0
and not revisado
order by a.data desc, t.nome, telefone ;