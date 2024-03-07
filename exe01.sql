CREATE DATABASE db_generation_game_online;
USE db_generation_game_online;

CREATE TABLE tb_personagens (
	id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    ataque INT NOT NULL,
    defesa INT NOT NULL,
    fraqueza VARCHAR(100)
);

CREATE TABLE tb_classes (
	id INT AUTO_INCREMENT PRIMARY KEY,
    classe VARCHAR (100) NOT NULL,
    vantagem VARCHAR (100) NOT NULL
); 

ALTER TABLE tb_personagens ADD cLasseid INT;

ALTER TABLE tb_personagens ADD CONSTRAINT fk_personagens_classes 
FOREIGN KEY (classeid) REFERENCES tb_classes (id);

INSERT INTO tb_classes (classe, vantagem)
VALUES ("Feiticeiro/a/", "Monstro");

INSERT INTO tb_classes (classe, vantagem)
VALUES ("Arqueiro/a", "Lutador");

INSERT INTO tb_classes (classe, vantagem)
VALUES ("Lutador/a", "Fantasia");

INSERT INTO tb_classes (classe, vantagem)
VALUES ("Monstro", "Arqueiro/a");

INSERT INTO tb_classes (classe, vantagem)
VALUES ("Fantasia", "Monstro");

INSERT INTO tb_personagens (nome, ataque, defesa, fraqueza,  classeid)
VALUES ("Baltazar", 1000, 2000, "Feiticeiro/a",1),
("Khastlyn", 2000, 2000, "Fantasia",2),
("Irana", 5000, 5000, "Monstro", 3),
("Crogyun", 800, 800, "Fantasia", 4),
("Mylakius", 1500, 1500, "Arqueiro/a",5),
("Bark", 1800, 1800, "Monstro", 3),
("Luguiby", 1900, 1000, "Fantasia", 2),
("Fyz", 1050, 3000, "Arqueiro/a", 5);

SELECT * FROM tb_personagens WHERE ataque > 2000;

SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE "%C%";

SELECT nome, ataque, defesa, tb_classes.classe
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.classeid = tb_classes.id;

-- Query lista linhas da junção entre a tabela personagens e classes se corresponde a condição.
-- Liste os dados na tabela que pertencem a classe 2 - Arqueiro/a

SELECT nome, ataque, defesa, tb_classes.classe, fraqueza, vantagem
FROM tb_personagens INNER JOIN tb_classes 
ON tb_personagens.classeid = tb_classes.id
WHERE tb_classes.id = 2;