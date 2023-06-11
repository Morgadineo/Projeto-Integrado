/*Apaga o banco de dados uvv*/

DROP DATABASE IF EXISTS uvv;

/*Apaga o usuário para um novo login*/

DROP USER IF EXISTS administrador;

/*Cria um usuário*/

CREATE USER administrador with CREATEDB INHERIT password '123';

/*Cria um banco de dados chamado uvv*/

CREATE DATABASE uvv
	owner administrador
	template template0
	encoding 'UTF8'
	lc_collate 'pt_BR.UTF-8'
	lc_ctype 'pt_BR.UTF-8'
	allow_connections true;

\c 'dbname=uvv user=administrador password=123';

CREATE SCHEMA disciplinas authorization administrador;

/*Garante privilégios ao usuário sobre o banco*/

grant all privileges on schema disciplinas to administrador;

ALTER USER administrador SET search_path TO disciplinas, '$user', public;

SET search_path TO disciplinas, '$user', public;

/*fodase.net*/

CREATE TABLE alunos (
    matricula               VARCHAR(9)      NOT NULL,
    email                   VARCHAR(255)    NOT NULL,
    cpf                     VARCHAR(11)     NOT NULL,
    senha                   VARCHAR(20)     NOT NULL,
    turma                   VARCHAR(20)     NOT NULL,
    CONSTRAINT pk_alunos    PRIMARY KEY (matricula)
);

/*Comentários acerca da tabela alunos*/
COMMENT ON TABLE alunos 				            IS 'Tabela que armazena os dados dos alunos cadastrados no sistema.';
COMMENT ON COLUMN alunos.matricula		            IS 'Código da matricula do aluno. ';
COMMENT ON COLUMN alunos.email	                    IS 'Email de cada aluno cadastrado.';
COMMENT ON COLUMN alunos.cpf 	                    IS 'CPF de cada aluno.';
COMMENT ON COLUMN alunos.senha 			            IS 'Senha de registro no sistema de disciplinas.';
COMMENT ON COLUMN alunos.turma 			            IS 'Turma de cada aluno registrado.';


CREATE TABLE certificados_alunos (
    id                      VARCHAR(255)            NOT NULL,
    matricula               VARCHAR(9)              NOT NULL,
    CONSTRAINT fk_id        FOREIGN KEY (id)        REFERENCES certificados_enviados (id)
    CONSTRAINT fk_matricula FOREIGN KEY (matricula) REFERENCES alunos (matricula)
);


CREATE TABLE certificados_enviados (
    --matricula       VARCHAR(9)      NOT NULL,
    id                  VARCHAR(255)   NOT NULL,
    cod_validacao       VARCHAR(512),
    tipo                VARCHAR(100),
    titulo              VARCHAR(50),
    descricao           VARCHAR(512),
    data_envio          DATE,
    imagem_certificado  BYTEA(512),
    pontos              NUMERIC,
    horas               NUMERIC,
    curso               VARCHAR(50),
    CONSTRAINT pk_id    PRIMARY KEY (id)
);

/*Comentários acerca da tabela certificados_enviados*/
COMMENT ON TABLE certificados_enviados				                IS 'Tabela que armazena os dados dos certificados enviados.';
COMMENT ON COLUMN certificados_enviados.id		                    IS 'Código de identificação do certificado. ';
COMMENT ON COLUMN certificados_enviados.cod_validacao	            IS 'Código de validação gerado pelo certificado.';
COMMENT ON COLUMN certificados_enviados.tipo 	                    IS 'Tipo da atividade do certificado enviado.';
COMMENT ON COLUMN certificados_enviados.titulo 			            IS 'Titulo do certificado.';
COMMENT ON COLUMN certificados_enviados.descricao 			        IS 'Descrição da atividade realizada.';
COMMENT ON COLUMN certificados_enviados.data_envio 			        IS 'Data de envio do certificado.';
COMMENT ON COLUMN certificados_enviados.imagem_certificado 			IS 'Imagem do certificado para validação do mesmo.';
COMMENT ON COLUMN certificados_enviados.pontos 			            IS 'Pontos gerados pelo certificado.';
COMMENT ON COLUMN certificados_enviados.horas 			            IS 'Cursos que o certificado vale.';

