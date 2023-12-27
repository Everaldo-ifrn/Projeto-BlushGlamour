from flask import Flask,  request, jsonify, render_template, redirect, flash, session
from blushGlamour import *
from datetime import datetime

import mysql.connector

 
app = Flask(__name__)
app.config['SECRET_KEY'] = "568425806"

#conexao com o banco de dados
bd = BancoDeDados()
db = bd.linkarBancoDeDados()

#PAGINA PRINCIPAL DO SITE
@app.route('/', methods=['GET', 'POST'])
def blushGlamour():
   return render_template('paginaPrincipal.html')
@app.route('/BlushGlamour', methods=['GET', 'POST'])
def homepage_blushGlamour():
    return redirect('/BlushGlamour')




#PAGINA DE LOGIN DO CLIENTE
@app.route('/BlushGlamour-login', methods=['GET', 'POST'])
def LoginCliente():
   return render_template('loginCliente.html')
@app.route('/BlushGlamour-login', methods=['GET', 'POST'])
def login_Cliente():
    return redirect('/BlushGlamour-login')




#PAGINA DE CADASTRO DO CLIENTE
@app.route('/BlushGlamour-cadastro', methods=['GET', 'POST'])
def cadastroCliente():
   return render_template('cadastroCliente.html')
@app.route('/BlushGlamour-cadastro', methods=['GET', 'POST'])
def cadastro_Cliente():
     cpf = request.form.get('cpf')
     nome = request.form.get('nome')
     email = request.form.get('email')
     senha = request.form.get('senha')
     telefone = request.form.get('telefone')
     dataNascimento = request.form.get('data')
     rua = request.form.get('rua')
     cidade = request.form.get('cidade')
     estado = request.form.get('estado')
     cep= request.form.get('cep')
     bairro = request.form.get('bairro')
     NumeroResidencia = 456
     complemento = request.form.get('Complemento')
     imagemPerfil = "imagem.jpg"

     #esta classe serve para sempre linkar o banco de dados
     cliente = Cliente(cpf, nome, email, senha, telefone, dataNascimento, rua, cidade, cep, estado, NumeroResidencia, complemento, bairro, imagemPerfil)
     cliente.cadastrar(db)
     return redirect('/')

        



#PAGINA DE LOGIN DO FORNECEDOR
@app.route('/BlushGlamour-Fornecedores', methods=['GET', 'POST'])
def loginFornecedor():
   return render_template('loginFornecedores.html')
@app.route('/BlushGlamour-Fornecedores',  methods=['GET', 'POST'])
def login_Fornecedor():
    return redirect('/BlushGlamour-Fornecedores')




#PAGINA DE CADASTRO DO FORNECEDOR
@app.route('/BlushGlamour-CadastroFornecedores', methods=['GET', 'POST'])
def cadastroFornecedor():
   return render_template('cadastroFornecedor.html')
@app.route('/BlushGlamour-CadastroFornecedores', methods=['GET', 'POST'])
def cadastro_Fornecedor():
    return redirect('/BlushGlamour-CadastroFornecedores')




#PAGINA DE ALTERAR DADOS
@app.route('/alterarDados', methods=['GET', 'POST'])
def alterarDados():
   return render_template('alterarDadosCliente.html')
@app.route('/alterarDados', methods=['GET', 'POST'])
def alterar_dados():
    return redirect('/alterarDados')




#PAGINA DE ESQUECI A SENHA
@app.route('/esqueciSenha', methods=['GET', 'POST'])
def esqueciSenha():
   return render_template('esqueciSenha.html')
@app.route('/esqueciSenha', methods=['GET', 'POST'])
def esqueci_Senha():
    return redirect('/esqueciSenha')




#PAGINA DO CARRINHO
@app.route('/BlushGlamour-carrinho', methods=['GET', 'POST'])
def carrinho():
   return render_template('carrinho.html')
@app.route('/BlushGlamour-carrinho', methods=['GET', 'POST'])
def carrinho_compra():
    return redirect('/BlushGlamour-carrinho')




#PAGINA DO PRODUTO
@app.route('/BlushGlamour-Produto', methods=['GET', 'POST'])
def paginaProduto():
   return render_template('paginaProduto.html')
@app.route('/BlushGlamour-Produto',  methods=['GET', 'POST'])
def pagina_produto():
    return redirect('/BlushGlamour-Produto')




#PAGINA DA BARRA DE PESQUISA
@app.route('/pesquisa', methods=['GET', 'POST'])
def barraPesquisa():
   return render_template('barradePesquisa.html')
@app.route('/pesquisa', methods=['GET', 'POST'])
def barra_Pesquisa():
    return redirect('/pesquisa')

if __name__ == '__main__':
    app.run(debug=True)