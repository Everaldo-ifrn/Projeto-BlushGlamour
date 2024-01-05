USE `mydb`;


#ISTO FOI PARA PODE UTILIZAR NO MEU PC JA QUE NAO RODEI O BD NOVO
/*
ALTER TABLE Produtos DROP FOREIGN KEY cnpjFornecedor;
ALTER TABLE Produtos DROP INDEX cnpjFornecedor_UNIQUE;
ALTER TABLE Produtos ADD CONSTRAINT nome_da_chave_estrageira FOREIGN KEY (cnpjFornecedor) REFERENCES Fornecedores(cnpj);
*/


INSERT INTO Fornecedores (cnpj, nomeFornecedor, EmailFornecedor, senhaFornecedorl, telefoneFornecedor) VALUES
	('12345678901234', 'Joao', 'joao@gmail.com', '1234', '45454545');
    
INSERT INTO EnderecosFornecedores (rua, cidade, cep, estado, numResidencia, cnpjFornecedores, bairro) VALUES
	('a', 'a', '45645', 'a', '12', '12345678901234', 'a');

-- Inserção na tabela Categoria
INSERT INTO Categoria (nomeCategoria, descricaoCategoria) VALUES 
	('Base', 'Fundação líquida de alta cobertura, ideal para uniformizar o tom da pele e oferecer um acabamento natural e duradouro.'),
	('Batom', 'Produto essencial para realçar e colorir os lábios, disponível em uma variedade de tons e acabamentos, desde matte até gloss.'),
	('Paleta', 'Conjunto de sombras compactas ou pigmentos soltos, projetados para criar looks variados e complementar a maquiagem dos olhos.'),
	('Rimel', 'Máscara de cílios que alonga, define e dá volume aos cílios, realçando o olhar e proporcionando um efeito dramático ou natural, conforme desejado.'),
	('Delineador', 'Produto utilizado para traçar linhas precisas ao redor dos olhos, disponível em formatos líquido, gel ou lápis para criar looks variados, desde sutis até dramáticos.'),
	('Pincel', 'Ferramenta essencial para aplicar e esfumar produtos de maquiagem, disponível em diferentes formatos e tamanhos para atender às diversas necessidades de aplicação.');

 #O INSERT DE ALGUNS PRODUTOS(OBS: OS DOIS SAO JUNTOS< O DE BAIXO SAO AS IMAGENS DE CADA UM DESSE PRODUTOS A SEGUIR)
INSERT INTO Produtos (codigoDeBarra, nomeProduto, preco, quantidade_estoque, descricao, Categoria_idcategoria, cnpjFornecedor) VALUES
	(17745, 'Base Bruna tavares', 50.50, 50, 'Base Bruna Tavares é uma base de alta cobertura e longa duração.', 1, '12345678901234'),
	(16645, 'Base Boca rosa', 25.50, 100, 'Base Boca Rosa é ideal para uma cobertura leve a média.', 1, '12345678901234'),
    (18845, 'Base Nina ', 80.50, 10, 'Base Nina oferece um acabamento matte perfeito para peles oleosas.', 1, '12345678901234'),
    (19945, 'Base Mari', 100.50, 70, 'Base Mari é reconhecida por sua fórmula hidratante e cobertura natural.', 1, '12345678901234');
    
#O INSERT DE ALGUNS PRODUTOS(OBS: OS DOIS SAO JUNTOS< O DE BAIXO SAO AS IMAGENS DE CADA UM DESSE PRODUTOS A SEGUIR)
INSERT INTO Produtos (codigoDeBarra, nomeProduto, preco, quantidade_estoque, descricao, Categoria_idcategoria, cnpjFornecedor) VALUES
	(110105, 'Delineador Mari', 50.50, 50, 'O Delineador Mari possui uma fórmula à prova d''água e um aplicador preciso para criar looks deslumbrantes.', 5, '12345678901234'),
	(111115, 'Delineador Vult', 25.50, 100, 'O Delineador Vult é conhecido por sua durabilidade e pigmentação intensa, garantindo um delineado perfeito.', 5, '12345678901234'),
	(112125, 'Batom Bruna Tavares', 80.50, 10, 'O Batom Bruna Tavares é um clássico, conhecido por sua textura cremosa e cores vibrantes que destacam os lábios.', 2, '12345678901234'),
	(113135, 'Batom Meruby Kids', 100.50, 70, 'O Batom Meruby Kids é desenvolvido especialmente para crianças, com fórmula suave e cores divertidas.', 2, '12345678901234'),
	(114145, 'Batom Merubyr', 25.50, 100, 'O Batom Merubyr é um item essencial para qualquer nécessaire, oferecendo cores versáteis e longa duração.', 2, '12345678901234'),
	(115155, 'Base Dior', 80.50, 10, 'A Base Dior é um ícone no mundo da maquiagem, conhecida por sua cobertura impecável e acabamento natural.', 1, '12345678901234');

-- Inserção na tabela Imagens
INSERT INTO Imagens (idImagens, Produtos_codigoDeBarra, imgCard, imgMaisVendido, imgProduto) VALUES
	(1, 17745, 'baseBrunaTavares_semFundo.png', 'baseBrunaTavares_semFundo.png', 'baseBrunaTavares_semFundo.png'),
	(2, 16645, 'BaseBocaRosa01_semFundo.png', 'BaseBocaRosa01_semFundo.png', 'BaseBocaRosa01_semFundo.png'),
	(3, 18845, 'baseNina01_semFundo.png', 'baseNina01_semFundo.png', 'baseNina01_semFundo.png'),
	(4, 19945, 'baseMari02_semFundo.png', 'baseMari02_semFundo.png', 'baseMari02_semFundo.png');
-- Inserção na tabela Imagens
INSERT INTO Imagens (idImagens, Produtos_codigoDeBarra, imgCard, imgMaisVendido, imgProduto) VALUES
    (5, 110105, 'DelineadorMari01_semFundo.png', 'DelineadorMari01_semFundo.png', 'DelineadorMari01_semFundo.png'),
	(6, 111115, 'DelineadorVult01_semFundo.png', 'DelineadorVult01_semFundo.png', 'DelineadorVult01_semFundo.png'),
    (7, 112125, 'batombrunaTavar.png', 'batombrunaTavar.png', 'batombrunaTavar.png'),
	(8, 113135, 'BatomMrubyKiss01_semFundo.png', 'BatomMrubyKiss01_semFundo.png', 'BatomMrubyKiss01_semFundo.png'),
	(9, 114145, 'BatomMerubyr01.png', 'BatomMerubyr01.png', 'BatomMerubyr01.png'),
	(10, 115155, 'BaseDior02_semFundo.png', 'BaseDior02_semFundo.png', 'BaseDior02_semFundo.png');

-- Inserção na tabela Cliente
INSERT INTO Cliente (cpf, nome, email, senha, dataNascimento, imagemPerfil)
VALUES ('12345678901', 'Maria S.ilva', 'maria@email.com', 'senha123', '1990-05-15', 'perfil.jpg');

-- Inserção na tabela EnderecosCliente
INSERT INTO EnderecosCliente (rua, cidade, cep, estado, numResidencia, Complemento, Cliente_cpf, bairro)
VALUES ('Rua das Flores', 'São Paulo', '12345-678', 'SP', '100', 'Apto 101', '12345678901', 'Centro');

-- Inserção na tabela Carrinho
INSERT INTO Carrinho (carrinhoID, Cliente_cpf) VALUES 
	(1, '12345678901');

-- Inserção na tabela Vendas
INSERT INTO Vendas (vendaID, valorTotal, carrinhoID) VALUES 
	(1, 513.00, 1);

-- Inserção na tabela Carrinho_has_Produtos
INSERT INTO Carrinho_has_Produtos (Carrinho_carrinhoID, Produtos_codigoDeBarra, quantidade, total) VALUES 
	(1, 17745, 2, 101.0),
    (1, 110105, 2, 101.0),
    (1, 112125, 1, 80.50),
    (1, 113135, 1, 150.0),
    (1, 115155, 1, 80.50);