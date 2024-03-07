CREATE DATABASE db_farmacia_bem_estar;
USE db_farmacia_bem_estar;

CREATE TABLE tb_produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor FLOAT NOT NULL,
    quantidade INT NOT NULL,
    descricao VARCHAR(200) NOT NULL
);

CREATE TABLE tb_categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR (100) NOT NULL,
    desconto DECIMAL(3,2) 
); 

ALTER TABLE tb_produtos ADD categoriaid INT;

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);

INSERT INTO tb_categorias (categoria, desconto)
VALUES ("Higiene", 0.07);

INSERT INTO tb_categorias (categoria, desconto)
VALUES ("Medicamentos", 0.25);

INSERT INTO tb_categorias (categoria, desconto)
VALUES ("Para bebês", 0.30);

INSERT INTO tb_categorias (categoria)
VALUES ("Cuidados");

INSERT INTO tb_categorias (categoria)
VALUES ("Vitaminas e Suplementos");

INSERT INTO tb_produtos (nome, valor, quantidade, descricao,  categoriaid)
VALUES ("Escova de dente Colgate", 9.99, 5, "escova verde e rosa",1),
("Cabergolina Farmagen", 9.99, 2, "200ml",2),
("Fralda Pampers", 154.99, 25, "Fralda Pampers Confort proteção extra",3),
("Hidrante Labial Carmed", 19.99, 10, "Fini Beijos Efeito Gloss",4),
("Repelente SBP", 59.99, 30, "Repelente SBP de tomada",4),
("Shampoo Natura", 39.09, 9, "Shampoo Natura para bebês",3),
("Vitamina", 22.99, 14, "Vitamina C Nutrilink",5),
("Protetor Plantar Needs", 24.59, 12, "Ultra absorção de impacto",4);

SELECT * FROM tb_produtos WHERE valor > 50;

SELECT * FROM tb_produtos WHERE valor BETWEEN 5 AND 60;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT nome, valor, quantidade, tb_categorias.categoria
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

-- Query lista linhas da junção entre a tabela produtos e categorias se corresponde a condição.
-- Liste os dados na tabela que pertencem a categoria 4 - Cuidados

SELECT *
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.id = 4;