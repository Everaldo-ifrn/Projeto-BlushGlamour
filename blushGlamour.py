
class bancoDeDados():
    def __init__(self,):
        pass

    def linkarbancoDeDados():
        pass


class Pessoa:
    def __init__(self, cpf, nome, email, senha, telefone, dataNascimento, rua=None, bairro=None, cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None):
        self.nome = nome
        self.email = email
        self.senha = senha

    def cadastrar(self,):
        pass

    def login(self):
        pass

    def logout():
        pass

    def atualizarDados():
        pass

    def esqueciSenha():
        pass


class Cliente(Pessoa):
    def __init__(self, cpf, nome, email, telefone, dataNascimento, rua=None, bairro=None, cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None):
        super().__init__(cpf, nome, email)
    



class Fornecedor(Pessoa):
    def __init__(self,cnpj, nome, email, senha, telefone, rua=None, bairro=None, cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None):
        super().__init__(nome, email)
        self.cnpj = cnpj

    def  verificarEstoque():
            pass


class Produto:
    def __init__(self, codigoDeBarra, nomeProduto, preço, quantidade, caminhoImagem=None, descrição=None, categoria):
        self.codigoDeBarra = codigoDeBarra
        self.nomeProduto = nomeProduto
        self.preço = preço
        self.quantidade = quantidade
        self.caminhoImagem = caminhoImagem
        self.descrição = descrição
        self.categoriaID = categoria #A gente vai saber o ID porque vai ser um forms de bolinha para escolher entao o valor a gente ja vai saber

    def adicionarProduto(self):
        pass

    def atualizarProduto(self):
        pass



class Carrinho():
    def __init__(self, nomeProduto, caminhoImagem, quantidadeProduto):
        pass

    def adicionarNoCarrinho(self, ):
        pass

    def RetirarDoCarrinho(self, ):
        pass
    
    def excluirCarrinho(self):
        pass
    
    def FinalizarCompra(self):
        pass
