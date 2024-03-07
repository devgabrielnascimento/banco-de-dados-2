CREATE DATABASE db_curso_da_minha_vida;
USE db_curso_da_minha_vida;

CREATE TABLE tb_cursos (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
	instrutor VARCHAR(100) NOT NULL,
    descricao VARCHAR(1500) NOT NULL,
    valor FLOAT NOT NULL
);

CREATE TABLE tb_categorias (
	id INT AUTO_INCREMENT PRIMARY KEY,
    tipo VARCHAR (100) NOT NULL,
    duracao VARCHAR (255) NOT NULL
); 

ALTER TABLE tb_cursos ADD categoriaid INT;

ALTER TABLE tb_cursos ADD CONSTRAINT fk_cursos_categorias
FOREIGN KEY (categoriaid) REFERENCES tb_categorias (id);

INSERT INTO tb_categorias (tipo, duracao)
VALUES 
    ("Curso livre", "70h"),
    ("Curso Avançado", "120h"),
    ("Curso técnico", "1 ano e 6 meses"),
    ("Tecnólogo", "3 anos"),
    ("Bacharel", "5 anos");

INSERT INTO tb_cursos (nome, instrutor, descricao, valor, categoriaid)
VALUES 
    ("Informática","Márcia Lansi","curso básico de informática: aprenda digitação, pacote office e muito mais!", 400.00, 1),
    ("Marketing Digital", "Eduardo Silva", "Curso avançado de marketing digital! As técnicas de SEO mais usadas do mercado!", 2500.00, 2),
    ("Design Gráfico", "Ricardo Paiva", "Construa seu portfólio de design hoje mesmo! Aprenda a utilizar o Adobe AI, PS, XD e muito mais...", 10000.00, 3),
    ("Análise e Desenvolvimento de Sistemas", "Débora Martins", "As tecnologias mais almejadas do mercado! Se torne um desenvolvedor fullstack requisitado!", 30000.00, 4),
    ("Ciência da Computação", "Vitória Jhennifer", "Seja um profissional de tecnologia com inúmeros campos profissionais, comece hoje mesmo e garante desconto!", 50000.00, 5);

SELECT * FROM tb_cursos WHERE valor > 500;

SELECT * FROM tb_cursos WHERE valor BETWEEN 600 AND 1000;

SELECT * FROM tb_cursos WHERE nome LIKE "%C%";

SELECT nome, instrutor,descricao, valor, tb_categorias.tipo
FROM tb_cursos INNER JOIN tb_categorias 
ON tb_cursos.categoriaid = tb_categorias.id;

-- Query lista linhas da junção entre a tabela cursos e categorias se corresponde a condição.
-- Liste os dados na tabela que pertencem a categoria 3 - Design Gráfico

SELECT *
FROM tb_cursos INNER JOIN tb_categorias 
ON tb_cursos.categoriaid = tb_categorias.id
WHERE tb_categorias.id = 3;