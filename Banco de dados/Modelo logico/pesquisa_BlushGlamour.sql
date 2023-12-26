USE `mydb`;
-- DROP DATABASE `mydb`;

SELECT 
	* 
FROM 
	cliente
WHERE
	cliente.cpf = '
-- SELECT * from Categoria;
-- SELECT * from Fornecedores;
-- SELECT * from Produtos;
-- SELECT * from Vendas;
-- SELECT * from EnderecosCliente;
-- SELECT * from Carrinho;
-- SELECT * from Vendas;
-- SELECT * from Relacao_vendas_com_produtos;
-- SELECT * from Imagens;
-- SELECT * from EnderecosFornecedores;
-- SELECT * from Telefone;

/*
-- Inserindo um cliente
INSERT INTO `mydb`.`Cliente` (`cpf`, `nome`, `email`, `senha`, `dataNascimento`)
VALUES ('12345678901', 'Ana Oliveira', 'ana@example.com', 'senha123', '1995-08-25');

-- Inserindo uma categoria de maquiagem
INSERT INTO `mydb`.`Categoria` (`nomeCategoria`, `descricaoCategoria`)
VALUES ('Batom', 'Diversos tons de batom para lábios vibrantes');

-- Inserindo um fornecedor de maquiagem
INSERT INTO `mydb`.`Fornecedores` (`cnpj`, `nomeFornecedor`, `EmailFornecedor`, `senhaFornecedorl`, `telefoneFornecedor`)
VALUES ('98765432109876', 'Fornecedora Makeup', 'fornecedora@makeup.com', 'senha456', '789-012-3456');

-- Inserindo um produto de maquiagem
INSERT INTO `mydb`.`Produtos` (`codigoDeBarra`, `nomeProduto`, `preco`, `quantidade_estoque`, `path_imagem`, `descricao`, `Categoria_idcategoria`, `cnpjFornecedor`)
VALUES (54321, 'Batom Matte', 29.99, 100, '/imagens/batom_matte.jpg', 'Batom com acabamento matte', 1, '98765432109876');

-- Inserindo um endereço de cliente
INSERT INTO `mydb`.`EnderecosCliente` (`rua`, `cidade`, `cep`, `estado`, `numResidencia`, `Complemento`, `Cliente_cpf`, `bairro`)
VALUES ('Avenida das Flores', 'Rio de Janeiro', '54321-098', 'RJ', '200', 'Casa 1A', '12345678901', 'Centro');

-- Inserindo um item no carrinho
INSERT INTO `mydb`.`Carrinho` (`carrinhoID`, `quantidadeItem`, `subTotal`, `Produtos_codigoDeBarra`, `Cliente_cpf`)
VALUES (1, 3, 89.97, 54321, '12345678901');

-- Inserindo uma venda de maquiagem
INSERT INTO `mydb`.`Vendas` (`vendaID`, `valorTotal`, `carrinhoID`)
VALUES (1, 89.97, 1);

-- Inserindo relação entre venda e produto de maquiagem
INSERT INTO `mydb`.`Relacao_vendas_com_produtos` (`CarrinhoDeCompras_idCarrinhoCompras`, `Produtos_codigoDeBarra`, `quantidadeProduto`)
VALUES (1, 54321, 3);

-- Inserindo uma imagem do produto de maquiagem
INSERT INTO `mydb`.`Imagens` (`idImagens`, `pathImagem`, `Produtos_codigoDeBarra`)
VALUES (1, '/imagens/batom_matte.jpg', 54321);

-- Inserindo endereço do fornecedor de maquiagem
INSERT INTO `mydb`.`EnderecosFornecedores` (`rua`, `cidade`, `cep`, `estado`, `numResidencia`, `Complemento`, `cnpjFornecedores`, `bairro`)
VALUES ('Rua Principal', 'São Paulo', '12345-678', 'SP', '300', 'Loja 5B', '98765432109876', 'Centro');

-- Inserindo um telefone de cliente
INSERT INTO `mydb`.`Telefone` (`idTelefone`, `telefone`, `Cliente_cpf`)
VALUES (1, '987-654-3210', '12345678901');
*/