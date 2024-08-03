ALTER TABLE cadastro.inscricoes ADD CONSTRAINT inscricoes_pk PRIMARY KEY (id);

ALTER TABLE cadastro.inscricoes ADD CONSTRAINT inscricoes_unique UNIQUE (inscricao);

CREATE INDEX inscricoes_codigo_logradouro_idx ON cadastro.inscricoes (codigo_logradouro);
CREATE INDEX inscricoes_codigo_contribuinte_idx ON cadastro.inscricoes (codigo_contribuinte);
CREATE INDEX inscricoes_codigo_bairro_idx ON cadastro.inscricoes (codigo_bairro);

