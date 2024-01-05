from flask import Flask,  request, jsonify, render_template, redirect, flash, session
import mysql.connector



#ESTA CLASE SERVE PARA CONEXAO CO O BANCO DE DADOS
class BancoDeDados():
    def __init__(self):
        self.host = 'localhost'
        self.user = 'root'
        self.password = 'labinfo'
        self.database = 'mydb'
        
    # Este método deve ser chamado toda vez que for usar o BD
    def linkarBancoDeDados(self):
        try:
            db = mysql.connector.connect(
                host = self.host,
                user = self.user,
                password = self.password,
                database = self.database
            )
            return db
        #se caso ouver erro de conexão com o BD
        except mysql.connector.Error as e:
            print(f'Erro: Conexão com o banco de dados - {e}')
            return None


#ESTA CLASE SERVE PARA CRIAR UMA SESSAO PARA DETERMINADO USUARIO
class Sessao():
    def __init__(self, email):
        self.verificar = True
        self.email = email
    
    def criarSessao(self):
        session['logado'] = self.verificar
        session['Email'] = self.email
        return self.email
       
    def finalizarSessao(self):
        session.pop('logado', None)
        session.pop('Email', None)
       



class Pessoa:
    def __init__(self, cpf, nome, email, senha, telefone, dataNascimento, rua=None,cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None, bairro=None, imagemPerfil=None):
        self.cpf = cpf
        self.nome = nome
        self.email = email
        self.senha = senha
        self.telefone = telefone
        self.dataNascimento = dataNascimento
        self.rua = rua
        self.cidade = cidade
        self.cep = cep
        self.estado = estado
        self.NumeroResidencia = NumeroResidencia
        self.Complemento = Complemento
        self.bairro = bairro
        self.imagemPerfi = imagemPerfil
        
    def cadastrar(self, db):
        try:
            cursor = db.cursor(dictionary=True)
            cursor.execute("INSERT INTO Cliente (cpf, nome, email, senha, dataNascimento, imagemPerfil) VALUES (%s, %s, %s, %s, %s, %s)", (self.cpf, self.nome, self.email, self.senha, self.dataNascimento, self.imagemPerfi))
            cursor.execute("INSERT INTO EnderecosCliente (rua, cidade, cep, estado, numResidencia, Complemento, Cliente_cpf, bairro) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)", (self.rua, self.cidade, self.cep, self.estado, self.NumeroResidencia, self.Complemento, self.cpf, self.bairro))
            db.commit()
            cursor.close()
        #se caso der erro nas inserções
        except mysql.connector.Error as e:
            print(f"Erro ao inserir dados no banco de dados: {e}")
            return "Algo deu errado em seu cadastro tente novamente"
        return 'Entrou'



    def login(self, db):
        cursor = db.cursor(dictionary=True)
        cursor.execute('SELECT senha, email FROM Cliente;') #Fazendo o select para pegar os dados do usuario
        objetos =  cursor.fetchall()

        if not objetos:
            cursor.close()
            return 'Não há dados cadastrados!'

        for dicionario in objetos: #estou verificando o dicionario que foi retornado e pegando o email e a senha
            emailDicionario = dicionario['email'] 
            senhaDicionario = dicionario['senha']
            if  emailDicionario == self.email and senhaDicionario == self.senha:
                break

        if  emailDicionario == self.email and senhaDicionario == self.senha:
            cursor.close()
            return 'OK'
        else:
            cursor.close()
            return 'Senha ou Email incorretos!'



    def dadosDoCliente(self, db): #falta terminar(este metodo deve mostrar tudo relacionando ao cliente) este metodo tem que ser na classe cliente
        cursor = db.cursor(dictionary=True)
        cursor.execute("select * from Cliente WHERE email = %s;", (self.email,))
        dicionario =  cursor.fetchall() #aqui estar sendo guardado a lista de dicionario que a consulta vai me retornar
        return dicionario

    def atualizarDados():
        pass

    def esqueciSenha():
        pass


class Cliente(Pessoa):
    def __init__(self, cpf, nome, email, senha, telefone, dataNascimento, rua=None, cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None, bairro=None, imagemPerfil=None):
        super().__init__(cpf, nome, email, senha, telefone, dataNascimento, rua, cidade, cep, estado, NumeroResidencia, Complemento, bairro, imagemPerfil)

class Fornecedor(Pessoa):
    def __init__(self, cnpj, nome, email, senha, telefone, dataNascimento=None, rua=None, bairro=None, cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None, imagemPerfil=None):
        super().__init__(cnpj, nome, email, senha, telefone, dataNascimento, rua, cidade, cep, estado, NumeroResidencia, Complemento, bairro)
        self.cnpj = cnpj

    def loginFornecedor(self, db):
        cursor = db.cursor(dictionary=True)
        cursor.execute('SELECT EmailFornecedor, senhaFornecedorl FROM Fornecedores;') #Fazendo o select para pegar os dados do Fornecedor
        objetos =  cursor.fetchall()

        if not objetos:
            cursor.close()
            return 'Não há dados cadastrados!'
        
        for dicionario in objetos: #estou verificando o dicionario que foi retornado e pegando o email e a senha
            emailDicionario = dicionario['EmailFornecedor'] 
            senhaDicionario = dicionario['senhaFornecedorl']
            if  emailDicionario == self.email and senhaDicionario == self.senha:
                break

        if  emailDicionario == self.email and senhaDicionario == self.senha:
            cursor.close()
            return 'OK'
        else:
            cursor.close()
            print('cheguei aqui')
            return 'Senha ou Email incorretos!'

    def cadastrarFornecedor(self, db):
         try:
            cursor = db.cursor(dictionary=True)
            cursor.execute("INSERT INTO Fornecedores (cnpj, nomeFornecedor, EmailFornecedor, senhaFornecedorl, telefoneFornecedor) VALUES (%s, %s, %s, %s, %s)", (self.cnpj, self.nome, self.email, self.senha, self.telefone))
            cursor.execute("INSERT INTO EnderecosFornecedores (rua, cidade, cep, estado, numResidencia, cnpjFornecedores, bairro) VALUES (%s, %s, %s, %s, %s, %s, %s)", (self.rua, self.cidade, self.cep, self.estado, self.NumeroResidencia, self.cnpj, self.bairro))
            db.commit()
            cursor.close()
         #se caso der erro nas inserções
         except mysql.connector.Error as e:
            print(f"Erro ao inserir dados no banco de dados: {e}")
            return "Algo deu errado em seu cadastro tente novamente"
         return 'Entrou'

    def verificarEstoque(self):
        pass


class Produto:
    def __init__(self, codigoDeBarra, nomeProduto, preço, quantidade, categoria, caminhoImagem=None, descrição=None):
        self.codigoDeBarra = codigoDeBarra
        self.nomeProduto = nomeProduto
        self.preço = preço
        self.quantidade = quantidade
        self.caminhoImagem = caminhoImagem
        self.descrição = descrição
        self.categoriaID = categoria #A gente vai saber o ID porque vai ser um forms de bolinha para escolher entao o valor a gente ja vai saber

    def cadastrarProduto(self):
        pass

    def atualizarProduto(self):
        pass

    def verProdutosMaisVendidos(self, db): #      Everaldo - PAREI AQUI!
        cursor = db.cursor(dictionary=True)
        cursor.execute('SELECT p.codigoDeBarra, p.nomeProduto, p.descricao, p.preco, MAX(i.imgMaisVendido) as imgMaisVendido, SUM(chp.quantidade) as total_vendido FROM Vendas v INNER JOIN Carrinho c ON v.carrinhoID = c.carrinhoID INNER JOIN Carrinho_has_Produtos chp ON c.CarrinhoID = chp.Carrinho_carrinhoID INNER JOIN Produtos p ON chp.Produtos_codigoDeBarra = p.codigoDeBarra INNER JOIN Imagens i ON i.Produtos_codigoDeBarra = p.codigoDeBarra GROUP BY p.codigoDeBarra LIMIT 5;')
        dicionario =  cursor.fetchall() #aqui estar sendo guardado a lista de dicionario que a consulta vai me retornar
        return dicionario

    def verProdutos(self, db):
        cursor = db.cursor(dictionary=True)
        cursor.execute('SELECT Produtos.codigoDeBarra, Produtos.nomeProduto, produtos.preco, produtos.quantidade_estoque, Categoria.nomeCategoria, Imagens.imgCard FROM Produtos INNER JOIN Categoria ON Produtos.Categoria_idcategoria = Categoria.idcategoria INNER JOIN Imagens ON Produtos.codigoDeBarra = Imagens.Produtos_codigoDeBarra;')
        dicionario =  cursor.fetchall() #aqui estar sendo guardado a lista de dicionario que a consulta vai me retornar
        return dicionario

    def pesquisarProduto(self, db, pesquisa):
        self.pesquisa = pesquisa
        cursor = db.cursor(dictionary=True)
        cursor.execute("""SELECT Produtos.codigoDeBarra, Produtos.nomeProduto, produtos.preco, produtos.quantidade_estoque, Imagens.imgCard FROM Produtos INNER JOIN Imagens ON Produtos.codigoDeBarra = Imagens.Produtos_codigoDeBarra WHERE nomeProduto LIKE %s LIMIT 0, 1000;""", (f"%{pesquisa}%",))
        dicionario =  cursor.fetchall() #aqui estar sendo guardado a lista de dicionario que a consulta vai me retornar
        return dicionario
   
    def detalhesDoProduto(self, db, codigoDeBarras):
        cursor = db.cursor(dictionary=True)
        cursor.execute("""SELECT Produtos.codigoDeBarra, Produtos.nomeProduto, produtos.preco, produtos.quantidade_estoque, Produtos.descricao, Imagens.imgCard FROM Produtos INNER JOIN Imagens ON Produtos.codigoDeBarra = Imagens.Produtos_codigoDeBarra WHERE codigoDeBarra = %s;""", (codigoDeBarras,))
        dicionario =  cursor.fetchall() #aqui estar sendo guardado a lista de dicionario que a consulta vai me retornar
        print(dicionario)
        return dicionario

    def verPorCategoria(self, db, categoria):
        cursor = db.cursor(dictionary=True)
        cursor.execute("""SELECT Produtos.codigoDeBarra, Produtos.nomeProduto, produtos.preco, produtos.quantidade_estoque, Produtos.descricao, Imagens.imgCard FROM Produtos INNER JOIN Imagens ON Produtos.codigoDeBarra = Imagens.Produtos_codigoDeBarra WHERE Categoria_idcategoria = %s;""", (categoria,))
        dicionario =  cursor.fetchall() #aqui estar sendo guardado a lista de dicionario que a consulta vai me retornar
        print(dicionario)
        return dicionario


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




#!!!!!!!!!!!AEA PARA TESTES!!!!!!!!!!
'''
#TESTE DAS INSERÇÔES DO CADASTRO
bd = BancoDeDados()
db = bd.linkarBancoDeDados()
print(db)


cpf = '2144448'
nome = 'Bruna'
email = '@joaosouza.com'
senha = '4568'
telefone = '79979777'
dataNascimento = '2023-03-15'
rua = 'rua das ruas'
cidade = 'ceara mirim'
estado = 'RN'
cep= '59570000'
bairro = 'planalto'
NumeroResidencia = '456'
complemento = 'perto da farmacia'
imagemPerfil = "imagem.jpg"

cliente = Cliente(cpf, nome, email, senha, telefone, dataNascimento, rua, cidade, cep, estado, NumeroResidencia, complemento, bairro, imagemPerfil)
cliente.cadastrar(db)
'''


