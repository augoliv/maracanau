select c.numero_cep as cep,
cl.logradouro_correio as logradouro,
cl.bairro_correio as bairro,
cl.numero_inicial,
cl.numero_final,
cl.ind_lado as lado,
cl.situacao_dne as situacao, 
c.status, c.data_ultima_alteracao
from GRPFOR.cep_logradouro cl 
join GRPFOR.cep c on cl.cep = c.id_cep
WHERE cidade=1603 
order by cl.bairro_correio, cl.numero_inicial,
cl.numero_final,
cl.ind_lado, c.numero_cep;

select distinct cl.bairro_correio as bairro
from GRPFOR.cep_logradouro cl 
join GRPFOR.cep c on cl.cep = c.id_cep
WHERE cidade=1603 
order by cl.bairro_correio;

select * from GRPFOR.cep;

select distinct cidade from GRPFOR.cep_logradouro;

select * from GRPFOR.cidade_dne where abrev_local like 'MARACANA%';

select * from GRPFOR.cidade WHERE NOME LIKE 'MARACANA%';