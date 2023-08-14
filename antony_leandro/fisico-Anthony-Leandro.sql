CREATE DATABASE soulgamer;
USE soulgamer;

CREATE TABLE tb_cidades (
    cod_cidade INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_cidade VARCHAR(50) NOT NULL,
    estado VARCHAR(2) NOT NULL CHECK (estado IN ( 'PR' )) 
);

CREATE TABLE tb_usuarios (
    cod_usuario INTEGER  AUTO_INCREMENT PRIMARY KEY,
    ativo CHAR(1) NOT NULL CHECK (ativo IN ( 'S' , 'N' )),
    nome_usuario VARCHAR(50) NOT NULL,
    data_nascimento_usuario DATE NOT NULL,
    cpf_usuario BIGINT(11) NOT NULL,
    email_usuario VARCHAR(50) NOT NULL,
    tipo_cadastro_usuario CHAR(1) NOT NULL CHECK (tipo_cadastro_usuario IN ( 'A' , 'C' )),
    senha_usuario VARCHAR(32) NOT NULL,
    bairro_usuario VARCHAR(25) NOT NULL,
    rua_usuario VARCHAR(40) NOT NULL,
    numero_casa_usuario VARCHAR(5) NOT NULL,
    complemento_casa_usuario VARCHAR(50) NOT NULL,
    cod_cidade INTEGER,
    UNIQUE (cpf_usuario, email_usuario),
    CONSTRAINT fk_cidade FOREIGN KEY (cod_cidade) REFERENCES tb_cidades (cod_cidade)
);

CREATE TABLE tb_compras (
    cod_compra INTEGER AUTO_INCREMENT PRIMARY KEY ,
    cod_entrega INTEGER NOT NULL UNIQUE,
    data_compra DATE NOT NULL,
    valor_entrega FLOAT(5,2) NOT NULL,
    cod_usuario INTEGER,
    CONSTRAINT fk_usuario FOREIGN KEY (cod_usuario) REFERENCES tb_usuarios (cod_usuario)
);

CREATE TABLE tb_categorias (
    cod_categoria INTEGER AUTO_INCREMENT PRIMARY KEY,
    nome_categoria VARCHAR(25) NOT NULL
);

CREATE TABLE tb_produtos (
    cod_produto INTEGER AUTO_INCREMENT PRIMARY KEY,
    ativo CHAR(1) NOT NULL CHECK (ativo IN ( 'S' , 'N' )),
    nome_produto VARCHAR(40) NOT NULL,
    imagem_produto VARCHAR(255) NOT NULL UNIQUE,
    informacao_produto VARCHAR(100) NOT NULL,
    preco_produto FLOAT(5,2) NOT NULL,
    cod_categoria INTEGER,
    CONSTRAINT fk_categoria FOREIGN KEY (cod_categoria) REFERENCES tb_categorias (cod_categoria)
);

CREATE TABLE tb_compras_produtos (
    cod_compra_produto INTEGER AUTO_INCREMENT PRIMARY KEY ,
    quantidade INTEGER NOT NULL,
    valor FLOAT(5,2) NOT NULL,
    cod_compra INTEGER,
    cod_produto INTEGER,
    CONSTRAINT fk_compra FOREIGN KEY (cod_compra) REFERENCES tb_compras (cod_compra),
    CONSTRAINT fk_produto FOREIGN KEY (cod_produto) REFERENCES tb_produtos (cod_produto)
);

INSERT INTO tb_cidades (cod_cidade, nome_cidade, estado) VALUES
(2853, 'Cascavel', 'PR');
COMMIT;

INSERT INTO tb_usuarios(ativo, nome_usuario, data_nascimento_usuario, cpf_usuario, email_usuario, tipo_cadastro_usuario, senha_usuario, bairro_usuario, rua_usuario, numero_casa_usuario, complemento_casa_usuario, cod_cidade) VALUES 
('S', 'João Silva', '1990-05-15', 12345678111, 'joao@example.com', 'c', 'senha123', 'Centro', 'Rua das Flores', '123', 'Apto 4A', 2853);
COMMIT;
INSERT INTO tb_usuarios(ativo, nome_usuario, data_nascimento_usuario, cpf_usuario, email_usuario, tipo_cadastro_usuario, senha_usuario, bairro_usuario, rua_usuario, numero_casa_usuario, complemento_casa_usuario, cod_cidade) VALUES
('S', 'Admin', '1985-02-10', 98765432101, 'admin@admin.com', 'c', 'adminpass', 'Centro', 'Avenida Principal', '567', 'Sala 2', 2853);
COMMIT;
INSERT INTO tb_usuarios(ativo, nome_usuario, data_nascimento_usuario, cpf_usuario, email_usuario, tipo_cadastro_usuario, senha_usuario, bairro_usuario, rua_usuario, numero_casa_usuario, complemento_casa_usuario, cod_cidade) VALUES 
('N', 'Maria Souza', '1988-12-03', 55555555501, 'maria@example.com', 'c', 'mariapass', 'Bairro Novo', 'Rua das Palmeiras', '789', 'Casa verde da esquina', 2853);
COMMIT;
INSERT INTO tb_usuarios(ativo, nome_usuario, data_nascimento_usuario, cpf_usuario, email_usuario, tipo_cadastro_usuario, senha_usuario, bairro_usuario, rua_usuario, numero_casa_usuario, complemento_casa_usuario, cod_cidade) VALUES 
('S', 'Carlos Oliveira', '1992-09-20', 11111111101, 'carlos@example.com', 'c', 'carlospass', 'Vila Feliz', 'Rua dos Pinheiros', '456', 'Casa amarela', 2853);
COMMIT;
INSERT INTO tb_usuarios(ativo, nome_usuario, data_nascimento_usuario, cpf_usuario, email_usuario, tipo_cadastro_usuario, senha_usuario, bairro_usuario, rua_usuario, numero_casa_usuario, complemento_casa_usuario, cod_cidade) VALUES 
('S', 'Ana Rodrigues', '1994-06-25', 22222222201, 'ana@example.com', 'c', 'anapass', 'Jardim das Flores', 'Rua dos Lírios', '789','Casa dos Fundos', 2853);
COMMIT;

INSERT INTO tb_categorias(cod_categoria, nome_categoria) VALUES 
('1','Xbox');
COMMIT;
INSERT INTO tb_categorias(cod_categoria, nome_categoria) VALUES 
('2','Playstation');
COMMIT;
INSERT INTO tb_categorias(cod_categoria, nome_categoria) VALUES 
('3','Nintendo');
COMMIT;
INSERT INTO tb_categorias(cod_categoria, nome_categoria) VALUES 
('4','Pc');
COMMIT;
INSERT INTO tb_categorias(cod_categoria, nome_categoria) VALUES 
('5','mobile');
COMMIT;
