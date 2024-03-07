CREATE DATABASE db_construindo_vidas;
USE db_construindo_vidas;

CREATE TABLE tb_produtos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
	dt_fabricacao DATE NOT NULL,
    valor FLOAT NOT NULL,
    quantidade INT NOT NULL
);

CREATE TABLE tb_categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR (100) NOT NULL,
    descricao VARCHAR (255) NOT NULL
); 

ALTER TABLE tb_produtos ADD categoriaid INT;

ALTER TABLE tb_produtos ADD CONSTRAINT fk_produtos_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);

INSERT INTO tb_categorias (tipo, descricao)
VALUES 
    ("Máquinas de Perfuração", "Equipamentos utilizados para perfuração de solo em obras de construção civil."),
    ("Compressores de Ar", "Compressores de ar industriais para uso em diversas aplicações, como pintura e ferramentas pneumáticas."),
    ("Bombas Hidráulicas", "Bombas hidráulicas utilizadas para o transporte de fluidos em sistemas industriais."),
    ("Materiais para Saneamento", "Equipamentos e materiais para sistemas de saneamento básico, incluindo tubulações e conexões."),
    ("Guinchos Industriais", "Guinchos para elevação e movimentação de cargas pesadas em ambientes industriais.");

INSERT INTO tb_produtos (nome, dt_fabricacao, valor, quantidade, categoriaid)
VALUES 
    ("Caterpillar Perfuratriz Hidráulica","2024-03-01",19999.99, 5, 1),
    ("Ingersoll Rand Compressor Selector", "2024-03-02", 5499.99, 8, 2),
    ("Bosch Hidráulica", "2024-03-03", 799.99, 15, 3),
    ("Tigre Tubulação de PVC", "2024-03-04", 12.99, 500, 4),
    ("Demag de Corrente", "2024-03-05", 3499.99, 3, 5);

SELECT * FROM tb_produtos WHERE valor > 100;

SELECT * FROM tb_produtos WHERE valor BETWEEN 70 AND 150;

SELECT * FROM tb_produtos WHERE nome LIKE "%C%";

SELECT nome, valor, quantidade, tb_categorias.tipo
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id;

-- Query lista linhas da junção entre a tabela produtos e categorias se corresponde a condição.
-- Liste os dados na tabela que pertencem a categoria 4 - Materiais para saneamento

SELECT *
FROM tb_produtos INNER JOIN tb_categorias 
ON tb_produtos.categoriaid = tb_categorias.id
WHERE tb_categorias.id = 4;