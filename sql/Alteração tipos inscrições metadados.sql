

select 'ALTER TABLE cadastro.inscricoes alter column ' || column_name || ' set data type character varying;'
from INFORMATION_SCHEMA.COLUMNS 
where  table_name ='inscricoes' 
and data_type='text';

select 'ALTER TABLE cadastro.inscricoes alter column ' || column_name || ' set data type int;'
from INFORMATION_SCHEMA.COLUMNS 
where  table_name ='inscricoes' 
and data_type='double precision' and column_name like 'codigo_%';

select 'ALTER TABLE cadastro.inscricoes alter column ' || column_name || ' set data type numeric(15,2);'
from INFORMATION_SCHEMA.COLUMNS 
where  table_name ='inscricoes' 
and data_type='double precision';