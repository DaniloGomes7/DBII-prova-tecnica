CREATE DATABASE LojaPascotto;

USE LojaPascotto;

CREATE TABLE Produtos(
idProduto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR (255),
preco DECIMAL (10,2),
quantidadeEstoque INT,
id_do_fornecedor INT,
CONSTRAINT fk_fornecedor_produtos FOREIGN KEY (id_do_fornecedor) REFERENCES Fornecedores(idFornecedor)
);

CREATE TABLE Fornecedores(
idFornecedor INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255),
CNPJ VARCHAR(255),
telefone VARCHAR(255),
CPF VARCHAR(255)
);

CREATE TABLE Colaborador(
idColaborador INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(255),
cargo VARCHAR(255),
salario VARCHAR(255)
);

CREATE TABLE Pedidos(
idPedido INT AUTO_INCREMENT PRIMARY KEY,
dataCompra VARCHAR(255),
quantidade INT,
idProduto INT,
id_do_funcionario INT,
CONSTRAINT fk_produtos_pedidos FOREIGN KEY (idProduto) REFERENCES Produtos(idProduto),
CONSTRAINT fk_funcionarios_pedidos FOREIGN KEY (id_do_funcionario) REFERENCES Colaborador(idColaborador)
);

ALTER TABLE Fornecedores ADD COLUMN email VARCHAR(255); 

SELECT * FROM Fornecedores;

CREATE TABLE Categorias(
idCategoria INT AUTO_INCREMENT PRIMARY KEY,
nomeCategoria VARCHAR(255)
);

ALTER TABLE Produtos ADD COLUMN idCategoria INT;

SELECT * FROM Produtos;

ALTER TABLE Produtos
ADD CONSTRAINT fk_produtos_categoria
FOREIGN KEY (idCategoria) REFERENCES Produtos(idProduto);

INSERT INTO Produtos(nome, preco, quantidadeEstoque) VALUES
('Gin', 10.00 , 4),
('Gelo de sabor', 4.00 , 2);

INSERT INTO Fornecedores(nome, CNPJ, telefone, CPF, email) VALUES
('Adega1010', '9869830290' , '119000293', '123456789', 'AdegaD1010@ex.com'),
('AdegaCleiDias', '29738693628' , '119283843', '987654321', 'AdegaDias@ex.com');

INSERT INTO Categorias(nomeCategoria) VALUES
('Bebidas'),
('Gelos de Sabor');

INSERT INTO Colaborador(nome, cargo, salario) VALUES
('Davi Passos', 'Vendedor' , '1000.00'),
('Geovanna Sousa', 'Vendedor' , '1000.00');

INSERT INTO Pedidos(dataCompra, quantidade) VALUES
('13-03-2019', 4),
('10-09-2024', 5);

ALTER TABLE Fornecedores DROP CPF;

UPDATE Colaborador SET salario = 1990.00 WHERE idColaborador = 1;

SELECT
	A.nome , B.nome
FROM
	Produtos A
INNER JOIN
	Fornecedores B
ON
	A.id_do_fornecedor = B.idFornecedor;
