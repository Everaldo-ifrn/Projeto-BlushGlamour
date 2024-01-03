USE `mydb`;

select * from Fornecedores;


/* O INSERT DE ALGUNS PRODUTOS(OBS: OS DOIS SAO JUNTOS< O DE BAIXO SAO AS IMAGENS DE CADA UM DESSE PRODUTOS A SEGUIR)
INSERT INTO Produtos (codigoDeBarra, nomeProduto, preco, quantidade_estoque, descricao, Categoria_idcategoria, cnpjFornecedor) VALUES
	(17745, 'Base Bruna tavares', 50.50, 50, 'Base Bruna Tavares é uma base de alta cobertura e longa duração.', 1, '12345678901234'),
	(16645, 'Base Boca rosa', 25.50, 100, 'Base Boca Rosa é ideal para uma cobertura leve a média.', 1, '12345678901234'),
    (18845, 'Base Nina ', 80.50, 10, 'Base Nina oferece um acabamento matte perfeito para peles oleosas.', 1, '12345678901234'),
    (19945, 'Base Mari', 100.50, 70, 'Base Mari é reconhecida por sua fórmula hidratante e cobertura natural.', 1, '12345678901234');
-- Inserção na tabela Imagens
INSERT INTO Imagens (idImagens, Produtos_codigoDeBarra, imgCard, imgMaisVendido, imgProduto) VALUES
	(2, 17745, 'baseBrunaTavares_semFundo.png', 'baseBrunaTavares_semFundo.png', 'baseBrunaTavares_semFundo.png'),
	(3, 16645, 'BaseBocaRosa01_semFundo.png', 'BaseBocaRosa01_semFundo.png', 'BaseBocaRosa01_semFundo.png'),
	(4, 18845, 'baseNina01_semFundo.png', 'baseNina01_semFundo.png', 'baseNina01_semFundo.png'),
	(5, 19945, 'baseMari02_semFundo.png', 'baseMari02_semFundo.png', 'baseMari02_semFundo.png');
*/

/*

INSERT INTO Fornecedores (cnpj, nomeFornecedor, EmailFornecedor, senhaFornecedorl, telefoneFornecedor) VALUES
	('123456789', 'Joao', 'joao@gmail.com', '1234', '45454545');
    
INSERT INTO EnderecosFornecedores (rua, cidade, cep, estado, numResidencia, cnpjFornecedores, bairro) VALUES
	('a', 'a', '45645', 'a', '12', '123456789', 'a');

*/

/*
#ISTO FOI PARA PODE UTILIZAR NO MEU PC JA QUE NAO RODEI O BD NOVO
ALTER TABLE Produtos DROP FOREIGN KEY cnpjFornecedor;
ALTER TABLE Produtos DROP INDEX cnpjFornecedor_UNIQUE;
ALTER TABLE Produtos ADD CONSTRAINT nome_da_chave_estrageira FOREIGN KEY (cnpjFornecedor) REFERENCES Fornecedores(cnpj);
*/


-- Inserção na tabela Categoria
INSERT INTO Categoria (nomeCategoria, descricaoCategoria) VALUES 
	('Base', 'Produtos para maquiagem dos olhos'),
    ('Batom', 'Produtos para maquiagem dos olhos'),
    ('Paleta', 'Produtos para maquiagem dos olhos'),
    ('Rimel', 'Produtos para maquiagem dos olhos'),
    ('Delineador', 'Produtos para maquiagem dos olhos'),
    ('Pincel', 'Produtos para maquiagem dos olhos');
	

#O INSERT DE ALGUNS PRODUTOS(OBS: OS DOIS SAO JUNTOS< O DE BAIXO SAO AS IMAGENS DE CADA UM DESSE PRODUTOS A SEGUIR)
INSERT INTO Produtos (codigoDeBarra, nomeProduto, preco, quantidade_estoque, descricao, Categoria_idcategoria, cnpjFornecedor) VALUES
	(17745, 'Base Bruna tavares', 50.50, 50, 'Base Bruna Tavares é uma base de alta cobertura e longa duração.', 1, '12345678901234'),
	(16645, 'Base Boca rosa', 25.50, 100, 'Base Boca Rosa é ideal para uma cobertura leve a média.', 1, '12345678901234'),
    (18845, 'Base Nina ', 80.50, 10, 'Base Nina oferece um acabamento matte perfeito para peles oleosas.', 1, '12345678901234'),
    (19945, 'Base Mari', 100.50, 70, 'Base Mari é reconhecida por sua fórmula hidratante e cobertura natural.', 1, '12345678901234'),
	(110105, 'Delineador Mari', 50.50, 50, 'O Delineador Mari possui uma fórmula à prova d''água e um aplicador preciso para criar looks deslumbrantes.', 5, '12345678901234'),
	(111115, 'Delineador Vult', 25.50, 100, 'O Delineador Vult é conhecido por sua durabilidade e pigmentação intensa, garantindo um delineado perfeito.', 5, '12345678901234'),
	(112125, 'Batom Bruna Tavares', 80.50, 10, 'O Batom Bruna Tavares é um clássico, conhecido por sua textura cremosa e cores vibrantes que destacam os lábios.', 2, '12345678901234'),
	(113135, 'Batom Meruby Kids', 100.50, 70, 'O Batom Meruby Kids é desenvolvido especialmente para crianças, com fórmula suave e cores divertidas.', 2, '12345678901234'),
	(114145, 'Batom Merubyr', 25.50, 100, 'O Batom Merubyr é um item essencial para qualquer nécessaire, oferecendo cores versáteis e longa duração.', 2, '12345678901234'),
	(115155, 'Base Dior', 80.50, 10, 'A Base Dior é um ícone no mundo da maquiagem, conhecida por sua cobertura impecável e acabamento natural.', 1, '12345678901234');
-- Inserção na tabela Imagens
INSERT INTO Imagens (Produtos_codigoDeBarra, imgCard, imgMaisVendido, imgProduto) VALUES
	(17745, 'baseBrunaTavares_semFundo.png', 'baseBrunaTavares_semFundo.png', 'baseBrunaTavares_semFundo.png'),
	(16645, 'BaseBocaRosa01_semFundo.png', 'BaseBocaRosa01_semFundo.png', 'BaseBocaRosa01_semFundo.png'),
	(18845, 'baseNina01_semFundo.png', 'baseNina01_semFundo.png', 'baseNina01_semFundo.png'),
	(19945, 'baseMari02_semFundo.png', 'baseMari02_semFundo.png', 'baseMari02_semFundo.png'),
    (17745, 'baseBrunaTavares_semFundo.png', 'baseBrunaTavares_semFundo.png', 'baseBrunaTavares_semFundo.png'),
	(16645, 'BaseBocaRosa01_semFundo.png', 'BaseBocaRosa01_semFundo.png', 'BaseBocaRosa01_semFundo.png'),
	(18845, 'baseNina01_semFundo.png', 'baseNina01_semFundo.png', 'baseNina01_semFundo.png'),
	(19945, 'baseMari02_semFundo.png', 'baseMari02_semFundo.png', 'baseMari02_semFundo.png'),
    (110105, 'DelineadorMari01_semFundo.png', 'DelineadorMari01_semFundo.png', 'DelineadorMari01_semFundo.png'),
	(111115, 'DelineadorVult01_semFundo.png', 'DelineadorVult01_semFundo.png', 'DelineadorVult01_semFundo.png'),
    (112125, 'batombrunaTavar.png', 'batombrunaTavar.png', 'batombrunaTavar.png'),
	(113135, 'BatomMrubyKiss01_semFundo.png', 'BatomMrubyKiss01_semFundo.png', 'BatomMrubyKiss01_semFundo.png'),
	(114145, 'BatomMerubyr01.png', 'BatomMerubyr01.png', 'BatomMerubyr01.png'),
	(115155, 'BaseDior02_semFundo.png', 'BaseDior02_semFundo.png', 'BaseDior02_semFundo.png');






#AQUI ETSAO OS SELECTS QUE ESTOU UTILIZANDO NO CODIGO
/*
SELECT senha, email FROM Cliente;

-- Pegando todos os dados de Cliente específico
SELECT * from Produtos;
*/

#INSERT DA BARRA DE PESQUISA
#SELECT * FROM Produtos WHERE nomeProduto LIKE '%Base%' LIMIT 0, 1000; 


/*
SELECT 
    Produtos.codigoDeBarra,
	Produtos.nomeProduto,
    produtos.preco,
    produtos.quantidade_estoque,
    Imagens.imgCard
FROM
	Produtos
		INNER JOIN 
	Imagens ON Produtos.codigoDeBarra = Imagens.Produtos_codigoDeBarra
WHERE
	nomeProduto LIKE '%Base%' LIMIT 0, 1000;
*/

/*
SELECT 
    Produtos.codigoDeBarra,
	Produtos.nomeProduto,
    produtos.preco,
    produtos.descricao,
    produtos.quantidade_estoque,
    Imagens.imgCard
FROM
	Produtos
		INNER JOIN 
	Imagens ON Produtos.codigoDeBarra = Imagens.Produtos_codigoDeBarra
WHERE
	codigoDeBarra = '16645'
*/
/*

SELECT 
    Produtos.codigoDeBarra,
	Produtos.nomeProduto,
    produtos.preco,
    produtos.quantidade_estoque,
    Categoria.nomeCategoria
FROM
	Produtos
		INNER JOIN 
	Categoria ON Produtos.Categoria_idcategoria = Categoria.idcategoria;

*/
