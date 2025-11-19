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
,imagem_url           NVARCHAR (255)
,descricao            NVARCHAR (255)        NOT NULL
,data_publicacao      DATE                  NOT NULL
,id_usuario           INT

  ,FOREIGN KEY (id_usuario)      REFERENCES   tb_usuario(id)
);
GO

SELECT * FROM tb_publicacao;


CREATE TABLE tb_curtida(
 id_curtida     INT       IDENTITY  (1,1)       PRIMARY KEY
,id_usuario     INT       not null
,id_publicacao  INT       not null

 ,FOREIGN KEY (id_usuario)         REFERENCES   tb_usuario(id)
 ,FOREIGN KEY (id_publicacao)      REFERENCES   tb_publicacao(id)
);
GO

SELECT * FROM tb_curtida;

CREATE TABLE tb_comentario(
 id_comentario    INT       IDENTITY(1,1)   PRIMARY KEY
,texto            NVARCHAR(255)             NOT NULL  
,data_coment      DATE                      NOT NULL
,id_publicacao    INT                       NOT NULL
,id_usuario       INT 

     
,FOREIGN KEY (id_usuario)         REFERENCES   tb_usuario(id)
,FOREIGN KEY (id_publicacao)      REFERENCES   tb_publicacao(id)
);
GO

SELECT * FROM tb_comentario;

CREATE TABLE tb_seguidor(
    id_usuario_seguidor INT NOT NULL,
    id_seguindo         INT NOT NULL

    PRIMARY KEY(id_seguindo, id_usuario_seguidor),
    FOREIGN KEY(id_usuario_seguidor) REFERENCES tb_usuario(id),
    FOREIGN KEY(id_seguindo) REFERENCES tb_usuario(id)
);
GO

SELECT * FROM tb_seguidor;
