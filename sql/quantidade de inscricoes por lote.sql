select distrito, setor, quadra, lote, nome_bairro ,
tipo_logradouro, logradouro, numero 
, descricao_class_arquit 
, count(*) 
from cadastro.inscricoes
group by distrito, setor, quadra, lote,
tipo_logradouro, logradouro, numero , nome_bairro , descricao_class_arquit 
having count(*) >= 10
order by count(*) desc
