CREATE DATABASE db_pizzaria_legal;
USE db_pizzaria_legal;

CREATE TABLE tb_pizzas (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    valor DECIMAL (4,2) NOT NULL,
    tamanho CHAR(2) NOT NULL,
    ingredientes VARCHAR(200) NOT NULL
);

CREATE TABLE tb_categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    sabor VARCHAR (100) NOT NULL,
    borda VARCHAR (100) NOT NULL
); 

ALTER TABLE tb_pizzas ADD categoriaid INT;

ALTER TABLE tb_pizzas ADD CONSTRAINT fk_pizzas_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);

INSERT INTO tb_categorias (sabor, borda)
VALUES ("Salgado", "Borda de cheddar");

INSERT INTO tb_categorias (sabor, borda)
VALUES ("Salgado", "Sem borda");

INSERT INTO tb_categorias (sabor, borda)
VALUES ("Salgado", "Borda de requeijão");

INSERT INTO tb_categorias (sabor, borda)
VALUES ("Doce", "Nutella");

INSERT INTO tb_categorias (sabor, borda)
VALUES ("Doce", "Beijinho");

INSERT INTO tb_pizzas (nome, valor, tamanho, ingredientes,  categoriaid)
VALUES ("Calabresa", 59.09, "M", "calabresa em rodelas, cebola, tomate picado, azeitona, azeite e orégano",1),
("Quatro Queijos", 69.99, "G", "quatro queijos diferentes: muçarela, gorgonzola, parmesão e catupiry,",1),
("Portuguesa", 39.99, "P", "queijo, azeitona verde ou preta, ovo cozido, presunto cozido, cebola, ervilha, molho de tomate e azeite",2),
("Muçarela", 59.99, "M", "queijo muçarela, molho de tomate fresco, azeitona, rodelas de tomate e orégano",3),
("Chocolate", 59.99, "M", "chocolate, morangos, marshmallows, avelãs e amêndoas",4),
("Frutas", 89.09, "F", " morangos, kiwis, bananas, maçãs, uvas, creme de leite, mel e geleia de frutas",4),
("Banana e Canela", 59.99, "M", "bananas fatiadas, canela em pó, açúcar mascavo, Cobertura de caramelo",5),
("Nutella", 59.99, "M", "nutella, morangos fatiados, marshmallows, avelãs picadas",5);

SELECT * FROM tb_pizzas WHERE valor > 45;

SELECT * FROM tb_pizzas WHERE valor BETWEEN 50 AND 100;

SELECT * FROM tb_pizzas WHERE nome LIKE "%M%";

SELECT nome, valor, tamanho, tb_categorias.sabor
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoriaid = tb_categorias.id;

-- Query lista linhas da junção entre a tabela pizzas e categoria se corresponde a condição.
-- Liste os dados na tabela que pertencem a categoria 5 - Pizzas Doces e com cobertura de beijinho

SELECT nome, valor, tamanho, tb_categorias.sabor
FROM tb_pizzas INNER JOIN tb_categorias 
ON tb_pizzas.categoriaid = tb_categorias.id
WHERE tb_categorias.id = 5;