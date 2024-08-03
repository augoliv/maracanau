select codigo_logradouro ,
tipo_logradouro, logradouro 
,  nome_bairro ,
count(*) 
from cadastro.inscricoes
where codigo_logradouro is not null and codigo_logradouro>0
group by 
codigo_logradouro , tipo_logradouro, logradouro,  nome_bairro , descricao_class_arquit 
having count(*) >= 10