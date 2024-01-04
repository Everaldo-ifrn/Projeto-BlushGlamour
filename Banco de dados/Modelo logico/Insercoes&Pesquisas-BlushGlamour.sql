USE `mydb`;


/*
-- Pegando todos os dados de Cliente específico
SELECT 
	* 
FROM 
	Cliente
INNER JOIN 
	EnderecosCliente
INNER JOIN
	Telefone
WHERE
	Cliente.cpf = '12345678901' AND Cliente.cpf = EnderecosCliente.Cliente_cpf AND Cliente.cpf = Telefone.Cliente_cpf
*/

/*
-- Pegando dados de um Fornecedor específico
SELECT
	*
FROM
	Fornecedores
INNER JOIN
	EnderecosFornecedores
WHERE
	Fornecedores.cnpj = '12345678901234' AND Fornecedores.cnpj = EnderecosFornecedores.cnpjFornecedores
*/
####################################################################+++++INSERÇOES+++++##########################################################################################

-- Inserção na tabela Cliente
INSERT INTO Cliente (cpf, nome, email, senha, dataNascimento, imagemPerfil)
VALUES ('12345678901', 'Maria Silva', 'maria@email.com', 'senha123', '1990-05-15', 'perfil.jpg');

-- Inserção na tabela Categoria
INSERT INTO Categoria (nomeCategoria, descricaoCategoria) VALUES 
	('Base', 'Fundação líquida de alta cobertura, ideal para uniformizar o tom da pele e oferecer um acabamento natural e duradouro.'),
	('Batom', 'Produto essencial para realçar e colorir os lábios, disponível em uma variedade de tons e acabamentos, desde matte até gloss.'),
	('Paleta', 'Conjunto de sombras compactas ou pigmentos soltos, projetados para criar looks variados e complementar a maquiagem dos olhos.'),
	('Rimel', 'Máscara de cílios que alonga, define e dá volume aos cílios, realçando o olhar e proporcionando um efeito dramático ou natural, conforme desejado.'),
	('Delineador', 'Produto utilizado para traçar linhas precisas ao redor dos olhos, disponível em formatos líquido, gel ou lápis para criar looks variados, desde sutis até dramáticos.'),
	('Pincel', 'Ferramenta essencial para aplicar e esfumar produtos de maquiagem, disponível em diferentes formatos e tamanhos para atender às diversas necessidades de aplicação.');
    
-- Inserção na tabela Fornecedores
INSERT INTO Fornecedores (cnpj, nomeFornecedor, EmailFornecedor, senhaFornecedorl, telefoneFornecedor)
VALUES ('12345678901234', 'Fornecedor XYZ', 'fornecedor@xyz.com', 'forn123', '987654321');

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
    
-- Inserção na tabela EnderecosCliente
INSERT INTO EnderecosCliente (rua, cidade, cep, estado, numResidencia, Complemento, Cliente_cpf, bairro)
VALUES ('Rua das Flores', 'São Paulo', '12345-678', 'SP', '100', 'Apto 101', '12345678901', 'Centro');

-- Inserção na tabela Carrinho
INSERT INTO Carrinho (Cliente_cpf)
VALUES ('12345678901');

-- Inserção na tabela Vendas
INSERT INTO Vendas (valorTotal, carrinhoID)
VALUES (50.00, 1);

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

-- Inserção na tabela EnderecosFornecedores
INSERT INTO EnderecosFornecedores (rua, cidade, cep, estado, numResidencia, Complemento, cnpjFornecedores, bairro)
VALUES ('Av. Principal', 'Rio de Janeiro', '54321-098', 'RJ', '200', NULL, '12345678901234', 'Centro');

-- Inserção na tabela Telefone
INSERT INTO Telefone (telefone, Cliente_cpf)
VALUES ( '987654321', '12345678901');

-- Inserção na tabela Carrinho_has_Produtos
INSERT INTO Carrinho_has_Produtos (Produtos_codigoDeBarra, quantidade, total)
VALUES (12345, 2, 51.00); 


