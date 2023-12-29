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

/*
-- Inserção na tabela Cliente
INSERT INTO Cliente (cpf, nome, email, senha, dataNascimento, imagemPerfil)
VALUES ('12345678901', 'Maria Silva', 'maria@email.com', 'senha123', '1990-05-15', 'perfil.jpg');

-- Inserção na tabela Categoria
INSERT INTO Categoria (nomeCategoria, descricaoCategoria)
VALUES ('Olhos', 'Produtos para maquiagem dos olhos');

-- Inserção na tabela Fornecedores
INSERT INTO Fornecedores (cnpj, nomeFornecedor, EmailFornecedor, senhaFornecedorl, telefoneFornecedor)
VALUES ('12345678901234', 'Fornecedor XYZ', 'fornecedor@xyz.com', 'forn123', '987654321');

-- Inserção na tabela Produtos
INSERT INTO Produtos (codigoDeBarra, nomeProduto, preco, quantidade_estoque, descricao, Categoria_idcategoria, cnpjFornecedor)
VALUES (12345, 'Máscara de Cílios', 25.50, 100, 'Máscara para cílios alongados', 1, '12345678901234');

-- Inserção na tabela EnderecosCliente
INSERT INTO EnderecosCliente (rua, cidade, cep, estado, numResidencia, Complemento, Cliente_cpf, bairro)
VALUES ('Rua das Flores', 'São Paulo', '12345-678', 'SP', '100', 'Apto 101', '12345678901', 'Centro');

-- Inserção na tabela Carrinho
INSERT INTO Carrinho (carrinhoID, Cliente_cpf)
VALUES (1, '12345678901');

-- Inserção na tabela Vendas
INSERT INTO Vendas (vendaID, valorTotal, carrinhoID)
VALUES (1, 50.00, 1);

-- Inserção na tabela Imagens
INSERT INTO Imagens (idImagens, Produtos_codigoDeBarra, imgCard, imgMaisVendido, imgProduto)
VALUES (1, 12345, 'card_image.jpg', 'bestseller_image.jpg', 'product_image.jpg');

-- Inserção na tabela EnderecosFornecedores
INSERT INTO EnderecosFornecedores (rua, cidade, cep, estado, numResidencia, Complemento, cnpjFornecedores, bairro)
VALUES ('Av. Principal', 'Rio de Janeiro', '54321-098', 'RJ', '200', NULL, '12345678901234', 'Centro');

-- Inserção na tabela Telefone
INSERT INTO Telefone (idTelefone, telefone, Cliente_cpf)
VALUES (1, '987654321', '12345678901');

-- Inserção na tabela Carrinho_has_Produtos
INSERT INTO Carrinho_has_Produtos (Carrinho_carrinhoID, Produtos_codigoDeBarra, quantidade, total)
VALUES (1, 12345, 2, 51.00); 
*/

