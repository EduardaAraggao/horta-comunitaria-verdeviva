
USE  hortaverdeviva;
SHOW TABLES;


-- Table voluntario
CREATE TABLE voluntario (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


SHOW TABLES;

-- Table planta
CREATE TABLE planta (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  tempoCultivo INT NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- Table instituicao
CREATE TABLE instituicao (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nome VARCHAR(45) NOT NULL,
  responsavel VARCHAR(45) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- Table telefone
CREATE TABLE telefone (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idInstituicao INT UNSIGNED NOT NULL,
  numero VARCHAR(20) NOT NULL,
  CONSTRAINT fk_Telefone_Instituicao
    FOREIGN KEY (idInstituicao) REFERENCES instituicao(id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- Table endereco
CREATE TABLE endereco (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idInstituicao INT UNSIGNED NOT NULL,
  rua VARCHAR(45) NOT NULL,
  numero VARCHAR(10) NULL DEFAULT NULL,
  bairro VARCHAR(20) NOT NULL,
  cidade VARCHAR(20) NOT NULL,
  estado VARCHAR(20) NOT NULL,
  pais VARCHAR(20) NOT NULL,
  CONSTRAINT fk_Endereco_Instituicao
    FOREIGN KEY (idInstituicao) REFERENCES instituicao(id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- Table canteiro
CREATE TABLE canteiro (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  grade VARCHAR(2) NOT NULL,
  localizacao VARCHAR(10) NOT NULL,
  solo VARCHAR(10) NOT NULL
  ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- Table doacao
CREATE TABLE doacao (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idInstituicao INT UNSIGNED NOT NULL,
  data DATE NOT NULL,
  CONSTRAINT fk_Doacao_Instituicao
    FOREIGN KEY (idInstituicao) REFERENCES instituicao(id)
    ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- Table cultivo
CREATE TABLE cultivo (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idVoluntario INT UNSIGNED NOT NULL,
  idPlanta INT UNSIGNED NOT NULL,
  idCanteiro INT UNSIGNED NOT NULL,
  data DATE NOT NULL,
  quantidade DECIMAL(5,2) NOT NULL,
  CONSTRAINT fk_Canteiro_Cultivo
    FOREIGN KEY (idCanteiro) REFERENCES canteiro(id),
  CONSTRAINT fk_Voluntario_Cultivo
    FOREIGN KEY (idVoluntario) REFERENCES voluntario(id),
  CONSTRAINT fk_Planta_Cultivo
    FOREIGN KEY (idPlanta) REFERENCES planta(id)
    ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- Table colheita
CREATE TABLE colheita (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  idCultivo INT UNSIGNED NOT NULL,
  data DATE NOT NULL,
  quantidade DECIMAL(5,2) NOT NULL,
  CONSTRAINT idCultivo
    FOREIGN KEY (idCultivo) REFERENCES cultivo(id)
    ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;


-- Table itemColheita
CREATE TABLE itemColheita (
  idColheita INT UNSIGNED NOT NULL,
  idDoacao INT UNSIGNED NOT NULL,
  quantidade DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (idColheita, idDoacao),
  CONSTRAINT fk_ItemColheita_Colheita
    FOREIGN KEY (idColheita) REFERENCES colheita(id),
  CONSTRAINT fk_ItemColheita_Doacao
    FOREIGN KEY (idDoacao) REFERENCES doacao(id)
    ) ENGINE = InnoDB DEFAULT CHARSET=utf8mb4;
    
    
-- INSERTS

-- voluntario
INSERT INTO voluntario (nome, funcao) VALUES
('Ana Silva', 'Jardineiro'),
('Bruno Costa', 'Jardineiro'),
('Carla Lima', 'Gestor'),
('Diego Santos', 'Motorista'),
('Elisa Ferreira', 'Gestor');

-- planta
INSERT INTO planta (nome, tipo, tempoCultivo) VALUES
('Alface Crespa', 'Folhosa', 30),
('Tomate Italiano', 'Fruto', 80),
('Cenoura Nantes', 'Raiz', 90),
('Rúcula Selvagem', 'Folhosa', 25),
('Pepino Japonês', 'Fruto', 50);

-- instituicao
INSERT INTO instituicao (nome, responsavel) VALUES
('Horta Comunitária Olinda', 'Marina Rocha'),
('Projeto Verde Recife', 'Lucas Almeida'),
('Casa do Agricultor Recife', 'Patrícia Melo'),
('Associação VerdeVida', 'Ricardo Gomes'),
('EcoHorta Pernambuco', 'Fernanda Sousa');

-- telefone
INSERT INTO telefone (idInstituicao, numero) VALUES
(1, '81912345678'),
(2, '81923456789'),
(3, '81934567890'),
(4, '81945678901'),
(5, '81956789012');

-- endereco
INSERT INTO endereco (idInstituicao, rua, numero, bairro, cidade, estado, pais) VALUES
(1, 'Rua das Flores', '123', 'Varadouro', 'Olinda', 'PE', 'Brasil'),
(2, 'Av. Boa Viagem', '45', 'Boa Viagem', 'Recife', 'PE', 'Brasil'),
(3, 'Rua do Agricultor', '78', 'Centro', 'Recife', 'PE', 'Brasil'),
(4, 'Travessa Verde', '10', 'Jardins', 'Recife', 'PE', 'Brasil'),
(5, 'Rua da EcoVida', '250', 'Parnamirim', 'Recife', 'PE', 'Brasil');

-- canteiro
INSERT INTO canteiro (grade, localizacao, solo) VALUES
('A1', 'Norte', 'Argiloso'),
('A2', 'Norte', 'Siltoso'),
('B1', 'Sul', 'Arenoso'),
('B2', 'Sul', 'Argiloso'),
('C1', 'Leste', 'Siltoso');

-- cultivo
INSERT INTO cultivo (idVoluntario, idPlanta, idCanteiro, data, quantidade) VALUES
(1, 1, 1, '2025-08-01', 12.50),
(2, 2, 2, '2025-08-05', 18.00),
(3, 3, 3, '2025-08-10', 10.00),
(4, 4, 4, '2025-08-15', 16.50),
(5, 5, 5, '2025-08-20', 22.00);

-- colheita
INSERT INTO colheita (idCultivo, data, quantidade) VALUES
(1, '2025-09-01', 10.00),
(2, '2025-09-25', 16.00),
(3, '2025-10-01', 9.00),
(4, '2025-10-10', 14.00),
(5, '2025-10-20', 21.00);

-- doacao
INSERT INTO doacao (idInstituicao, data) VALUES
(1, '2025-09-05'),
(2, '2025-09-15'),
(3, '2025-10-05'),
(4, '2025-10-25'),
(5, '2025-09-20');

-- itemcolheita
INSERT INTO itemColheita (idColheita, idDoacao, quantidade) VALUES
(1, 1, 5.00),
(2, 2, 8.00),
(3, 3, 6.00),
(4, 4, 7.00),
(5, 5, 10.00);

-- CONSULTAS SQL ( DML ) ----

-- 1- Listando todos os voluntários cadastrados e suas respectivas funções
SELECT nome, funcao
FROM voluntario;

-- 2- Mostrando as plantas culltivadas em cada canteiro com o nome do canteiro e data do plantio
SELECT 
  c.grade AS Canteiro,
  p.nome AS Planta,
  cu.data AS DataPlantio
FROM cultivo cu
JOIN planta p ON cu.idPlanta = p.id
JOIN canteiro c ON cu.idCanteiro = c.id;

-- 3- Exibindo os nomes dos voluntários e as plantas que eles cultivam
SELECT 
  v.nome AS Voluntario,
  p.nome AS Planta
FROM cultivo cu
JOIN voluntario v ON cu.idVoluntario = v.id
JOIN planta p ON cu.idPlanta = p.id;


-- 4- Listando as colheitas realizadas, mostrando o canteiro e a quantidade colhida (em kg )
SELECT 
  c.grade AS Canteiro,
  co.quantidade AS Quantidade_kg
FROM colheita co
JOIN cultivo cu ON co.idCultivo = cu.id
JOIN canteiro c ON cu.idCanteiro = c.id;

-- 5- Mostrando as Instituições que recebem doaçoes e as quantidades doadas. 
SELECT 
  i.nome AS Instituicao,
  ic.quantidade AS Quantidade_kg
FROM itemColheita ic
JOIN doacao d ON ic.idDoacao = d.id
JOIN instituicao i ON d.idInstituicao = i.id;

-- 6- Listando o total de quilos doados por instituição (usando GROUP BY)
SELECT 
  i.nome AS Instituicao,
  SUM(ic.quantidade) AS TotalDoado_kg
FROM itemColheita ic
JOIN doacao d ON ic.idDoacao = d.id
JOIN instituicao i ON d.idInstituicao = i.id
GROUP BY i.nome;

-- 7- Mostrando os canteiros que ainda nao tiveram colheitas (usando LEFT JOIN ) 
SELECT 
  c.grade AS Canteiro,
  c.localizacao,
  c.solo
FROM canteiro c
LEFT JOIN cultivo cu ON c.id = cu.idCanteiro
LEFT JOIN colheita co ON cu.id = co.idCultivo
WHERE co.id IS NULL;

-- 8 - Exibindo o voluntario que realizou o maior numero de cultivos  ( usando COUNT e ORDER BY)
SELECT 
  v.nome AS Voluntario,
  COUNT(cu.id) AS TotalCultivos
FROM cultivo cu
JOIN voluntario v ON cu.idVoluntario = v.id
GROUP BY v.nome
ORDER BY TotalCultivos DESC
LIMIT 5;

-- 9- Mostrando as plantas que ainda não foram colhidas ( usando COUNT e ORDER BY)
SELECT 
  p.nome AS Planta,
  COUNT(cu.id) AS TotalCultivosSemColheita
FROM planta p
JOIN cultivo cu ON p.id = cu.idPlanta
LEFT JOIN colheita co ON cu.id = co.idCultivo
WHERE co.id IS NULL
GROUP BY p.nome
ORDER BY TotalCultivosSemColheita DESC;


-- 10- Listando todas as doações realizadas em Setembro de 2025, com o nome da instituição e a data da lotação.
SELECT 
  i.nome AS Instituicao,
  d.data AS DataDoacao
FROM doacao d
JOIN instituicao i ON d.idInstituicao = i.id
WHERE MONTH(d.data) = 9 AND YEAR(d.data) = 2025;



