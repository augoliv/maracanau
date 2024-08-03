-- Atualização do ativo quando repetido ou não localizado;
update anuncios a 
set ativo = false 
from condominios  c  
where a.repetido or a.nao_localizado ;