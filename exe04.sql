CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

CREATE TABLE tb_produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor FLOAT NOT NULL,
    quantidade INT NOT NULL,
    origem VARCHAR(200) NOT NULL
);

CREATE TABLE tb_categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR (100) NOT NULL,
    descricao VARCHAR (255) NOT NULL
); 

ALTER TABLE tb_produtos ADD categoriaid INT;

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);

INSERT INTO tb_categorias (categoria, descricao)
VALUES 
    ("Bovina", "Carnes provenientes de gado bovino, conhecidas por sua textura marmorizada
    e sabor robusto. Inclui cortes como bife, costela e contrafilé."),
    ("Suína", "Carnes provenientes de suínos, conhecidas por sua versatilidade 
    e sabor único. Inclui cortes como costeletas, bacon e lombo."),
    ("Aves", "Carnes provenientes de aves, como frango e peru, 
    conhecidas por sua carne magra e sabor suave. Inclui cortes como peito, coxa e asa."),
    ("Peixe", "Carnes provenientes de peixes, conhecidas 
    por sua leveza e valor nutricional. Inclui espécies como salmão, tilápia e atum."),
    ("Outros", "Outras categorias de carne que não se 
    encaixam nas anteriores, como carne de cordeiro, carne de caça 
    e carne de animais exóticos. Inclui uma variedade de cortes e sabores únicos.");

INSERT INTO tb_produtos (nome, valor, quantidade, origem, categoriaid)
VALUES 
    ("Bife de Alcatra", 59.99, 5, "Brasil", 1),
    ("Costeletas de Porco", 12.99, 2, "Brasil", 2),
    ("Peito de Frango", 8.99, 25, "Brasil", 3),
    ("Salmão Fresco", 129.99, 10, "Noruega", 4),
    ("Carne de Cordeiro", 49.99, 8, "Nova Zelândia", 5),
    ("Lombo de Atum", 122.99, 15, "Pacífico Sul", 4);

SELECT * FROM tb_produtos WHERE valor > 50;

SELECT * FROM tb_produtos WHERE valor BETWEEN 50 AND 150;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT nome, valor, quantidade, tb_categorias.categoria
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

-- Query lista linhas da junção entre a tabela produtos e categorias se corresponde a condição.
-- Liste os dados na tabela que pertencem a categoria 4 - Peixes

SELECT *
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.id = 4;