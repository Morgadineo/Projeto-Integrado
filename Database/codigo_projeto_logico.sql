-- Cria a tabela alunos --

CREATE TABLE public.alunos (
                matricula NUMERIC(38) NOT NULL,
                senha VARCHAR(255) NOT NULL,
                turma VARCHAR(255) NOT NULL,
                curso VARCHAR(255) NOT NULL,
                CONSTRAINT matricula_alunos_pk PRIMARY KEY (matricula)
);

-- Comentários sobre as tabelas e colunas -- 

COMMENT ON TABLE public.alunos IS 'Esta é a tabela alunos, serve para guardar informações sobre os alunos.';
COMMENT ON COLUMN public.alunos.matricula IS 'Esta é a chave estrangeira originada da tabela alunos de um relacionamento 1:N';
COMMENT ON COLUMN public.alunos.senha IS 'Esta coluna guarda a senha do aluno.';
COMMENT ON COLUMN public.alunos.turma IS 'Esta é a tabela turma, serve para guardar a turma do aluno.';
COMMENT ON COLUMN public.alunos.curso IS 'Esta é a coluna curso, serve para guardar os cursos em que o aluno está inserido.';

-- Cria a tabela certificados enviados --

CREATE TABLE public.certificados_enviados (
                certificado_id VARCHAR(38) NOT NULL,
                matricula NUMERIC(38) NOT NULL,
                codigo_validacao VARCHAR(38) NOT NULL,
                quantidade_de_horas TIME NOT NULL,
                descricao VARCHAR(512) NOT NULL,
                titulo VARCHAR(255) NOT NULL,
                status VARCHAR(15) NOT NULL,
                tipo VARCHAR(38) NOT NULL,
                data_envio DATE NOT NULL,
                imagem BYTEA NOT NULL,
                pontos NUMERIC(5,2),
                curso VARCHAR(255),
                CONSTRAINT id_certificado_pk PRIMARY KEY (certificado_id, matricula)
);

-- Comentários sobre as tabelas e colunas -- 

COMMENT ON TABLE public.certificados_enviados IS 'Esta é a tabela Certificados Enviados, serve para guardar certificados dos alunos.';
COMMENT ON COLUMN public.certificados_enviados.certificado_id IS 'Esta é a tabela id certificado, ṕrimary key que faz relação com a tabela Alunos.';
COMMENT ON COLUMN public.certificados_enviados.matricula IS 'Esta é a chave estrangeira originada da tabela alunos de um relacionamento 1:N';
COMMENT ON COLUMN public.certificados_enviados.codigo_validacao IS 'Esta é a coluna codigo de validação, serve para guardar um código de validade.';
COMMENT ON COLUMN public.certificados_enviados.quantidade_de_horas IS 'Esta é a coluna quantidade de horas, serve para guardar a quantidade de horas que o aluno se dedicou.';
COMMENT ON COLUMN public.certificados_enviados.descricao IS 'Esta coluna armazena a descrição do certificado.';
COMMENT ON COLUMN public.certificados_enviados.titulo IS 'Esta é a coluna titulo, serve para guardar o titulo do certificado.';
COMMENT ON COLUMN public.certificados_enviados.status IS 'Esta é a coluna status, serve para guardar os status dos certificados.';
COMMENT ON COLUMN public.certificados_enviados.tipo IS 'Esta coluna armazena o tipo de certificado.';
COMMENT ON COLUMN public.certificados_enviados.data_envio IS 'Esta é a coluna data de envio, serve para guardar informações sobre a data de envio.';
COMMENT ON COLUMN public.certificados_enviados.imagem IS 'Esta coluna armazena a imagem do certificado enviado.';
COMMENT ON COLUMN public.certificados_enviados.pontos IS 'Esta é a coluna pontos, serve para guardar a pontuação dos certificados enviados.';
COMMENT ON COLUMN public.certificados_enviados.curso IS 'Esta é a coluna curso, serve para guardar o curso do aluno.';

-- Adiciona uma Foreign Key na tabela certificados enviados que faz referência a tabela alunos. --

ALTER TABLE public.certificados_enviados ADD CONSTRAINT alunos_certificados_enviados_fk
FOREIGN KEY (matricula)
REFERENCES public.alunos (matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
