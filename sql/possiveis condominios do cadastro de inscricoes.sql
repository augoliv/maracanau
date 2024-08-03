SELECT c.*
FROM google.condominios c
join ;

SELECT distrito, setor, quadra, lote, 
codigo_logradouro, tipo_logradouro, 
logradouro, numero, natureza, codigo_bairro, nome_bairro
, tipo_logradouro || ' ' || logradouro || ', ' || numero || ' - ' || nome_bairro || ' - ' || 'Maracanaú - CE' as endereco
,count(*)
FROM cadastro.inscricoes
where ativo='S' and logradouro is not null and codigo_logradouro > 0
and natureza ='Prédio'
group by distrito, setor, quadra, lote, 
codigo_logradouro, tipo_logradouro, 
logradouro, numero, natureza, codigo_bairro, nome_bairro
having count(*) >= 10
order by count(*) desc;