--DDL--
CREATE DATABASE db_devconnect;
GO

USE db_devconnect;

CREATE TABLE tb_usuario (
 id        INT      IDENTITY (1,1)        PRIMARY KEY
,nome_completo      NVARCHAR (255)        NOT NULL
,nome_usuario       NVARCHAR (50)         UNIQUE            NOT NULL
,email              NVARCHAR (255)        UNIQUE            NOT NULL
,senha              NVARCHAR (50)         NOT NULL
,foto_perfil_url    NVARCHAR (150)        NULL
);
GO

SELECT * FROM tb_usuario;

CREATE TABLE tb_publicacao(
 id       INT         IDENTITY (1,1)        PRIMARY KEY
,nome_usuario         NVARCHAR (255)        UNIQUE         PRIMARY KEY
,imagem_url           NVARCHAR (255)
,descricao            NVARCHAR (255)        NOT NULL
,data_publicacao      DATE                  NOT NULL
,id_usuario           INT

  ,FOREIGN KEY (id_usuario)      REFERENCES   tb_usuario(id)
);
GO

SELECT * FROM tb_publicacao;

CREATE TABLE tb_curtida(
 id   INT       IDENTITY  (1,1)       PRIMARY KEY
,id_usuario     INT 
,id_publicacao  INT

 ,FOREIGN KEY (id_usuario)         REFERENCES   tb_usuario(id)
 ,FOREIGN KEY (id_publicacao)      REFERENCES   tb_publicacao(id)
);
GO

SELECT * FROM tb_curtida;

CREATE TABLE tb_comentario(
 id  INT       IDENTITY(1,1)   
,id_comentario    INT               
,id_usuario       INT 

,PRIMARY KEY (id_comentario)      
,FOREIGN KEY (id_usuario)         REFERENCES   tb_usuario(id)
,FOREIGN KEY (id_
);
GO

SELECT * FROM tb_comentario;