USE `mydb`;



/* ISTO FOI PARA PODE UTILIZAR NO MEU PC JA QUE NAO RODEI O BD NOVO
ALTER TABLE Produtos DROP FOREIGN KEY cnpjFornecedor;
ALTER TABLE Produtos DROP INDEX cnpjFornecedor_UNIQUE;
ALTER TABLE Produtos ADD CONSTRAINT nome_da_chave_estrageira FOREIGN KEY (cnpjFornecedor) REFERENCES Fornecedores(cnpj);
*/

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
