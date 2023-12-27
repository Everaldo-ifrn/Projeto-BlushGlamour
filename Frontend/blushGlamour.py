from flask import Flask,  request, jsonify, render_template, redirect, flash, session
import mysql.connector


class BancoDeDados():
    def __init__(self):
        self.host = 'localhost'
        self.user = 'root'
        self.password = 'felipe09'
        self.database = 'mydb'
    
    #esse metodo deve ser chamado toda vez que for usar o BD
    def linkarBancoDeDados(self):
        try:
            db = mysql.connector.connect(
                host = self.host,
                user = self.user,
                password = self.password,
                database = self.database
            )
        except mysql.connector.Error as err:
            print(f"Erro ao conectar ao banco de dados: {err}")
            return None
        return db


class Pessoa:
    def __init__(self, cpf, nome, email, senha, telefone, dataNascimento, rua=None,cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None, bairro=None):
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
        
    def cadastrar(self, db):
        cursor = db.cursor(dictionary=True)
        cursor.execute("INSERT INTO Cliente (cpf, nome, email, senha, dataNascimento, imagemPerfil) VALUES (%s, %s, %s, %s, %s, %s)", (self.cpf, self.nome, self.email, self.senha, self.dataNascimento))
        cursor.execute("INSERT INTO EnderecosCliente (rua, cidade, cep, estado, numResidencia, Complemento, Cliente_cpf, bairro) VALUES (%s, %s, %s, %s, %s, %s, %s, %s)" , (self.rua, self.cidade, self.cep, self.estado, self.NumeroResidencia, self.Complemento, self.bairro))
        db.commit()
        cursor.close()


    def login(self):
        pass

    def logout():
        pass

    def atualizarDados():
        pass

    def esqueciSenha():
        pass


class Cliente(Pessoa):
    def __init__(self, cpf, nome, email, senha, telefone, dataNascimento, rua=None, bairro=None, cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None):
        super().__init__(cpf, nome, email, senha, telefone, dataNascimento, rua, cidade, cep, estado, NumeroResidencia, Complemento, bairro)

class Fornecedor(Pessoa):
    def __init__(self, cnpj, nome, email, senha, telefone, dataNascimento, rua=None, bairro=None, cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None):
        super().__init__(cnpj, nome, email, senha, telefone, dataNascimento, rua, cidade, cep, estado, NumeroResidencia, Complemento, bairro)
        self.cnpj = cnpj

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
