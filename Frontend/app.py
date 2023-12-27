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
def homepage_blushGlamour():
   if request.method == 'GET':
        return render_template('paginaPrincipal.html')
   elif request.method == 'POST':
        return redirect('/')




#PAGINA DE LOGIN DO CLIENTE
@app.route('/BlushGlamour-login', methods=['GET', 'POST'])
def login_Cliente():
   if request.method == 'GET':
        return render_template('loginCliente.html')
   elif request.method == 'POST':
        return redirect('/BlushGlamour-login')






#PAGINA DE CADASTRO DO CLIENTE
@app.route('/BlushGlamour-cadastro', methods=['GET', 'POST'])
def cadastroCliente():
    if request.method == 'GET':
        return render_template('cadastroCliente.html')
    elif request.method == 'POST':
        cpf = request.form.get('cpf')
        nome = request.form.get('nome')
        email = request.form.get('email')
        senha = request.form.get('senha')
        telefone = request.form.get('telefone')
        dataNascimento = request.form.get('data')
        rua = request.form.get('rua')
        cidade = request.form.get('cidade')
        estado = request.form.get('estado')
        cep = request.form.get('cep')
        bairro = request.form.get('bairro')
        NumeroResidencia = '456'
        complemento = request.form.get('Complemento')
        imagemPerfil = "imagem.jpg"

        # esta classe serve para sempre linkar o banco de dados
        cliente = Cliente(cpf, nome, email, senha, telefone, dataNascimento, rua, cidade, cep, estado, NumeroResidencia, complemento, bairro, imagemPerfil)
        cliente.cadastrar(db)
        print(request.form)
        return redirect('/')
    

        

#PAGINA DE LOGIN DO FORNECEDOR
@app.route('/BlushGlamour-Fornecedores',  methods=['GET', 'POST'])
def login_Fornecedor():
    if request.method == 'GET':
        return render_template('loginFornecedores.html')
    elif request.method == 'POST':
        return redirect('/BlushGlamour-Fornecedores')




#PAGINA DE CADASTRO DO FORNECEDOR
@app.route('/BlushGlamour-CadastroFornecedores', methods=['GET', 'POST'])
def cadastro_Fornecedor():
   if request.method == 'GET':
        return render_template('cadastroFornecedor.html')
   elif request.method == 'POST':
        return redirect('/BlushGlamour-CadastroFornecedores')





#PAGINA DE ALTERAR DADOS
@app.route('/alterarDados', methods=['GET', 'POST'])
def alterar_dados():
   if request.method == 'GET':
        return render_template('alterarDadosCliente.html')
   elif request.method == 'POST':
        return redirect('/alterarDados')




#PAGINA DE ESQUECI A SENHA
@app.route('/esqueciSenha', methods=['GET', 'POST'])
def esqueci_Senha():
   if request.method == 'GET':
        return render_template('esqueciSenha.html')
   elif request.method == 'POST':
        return redirect('/esqueciSenha')




#PAGINA DO CARRINHO
@app.route('/BlushGlamour-carrinho', methods=['GET', 'POST'])
def carrinho_compra():
   if request.method == 'GET':
        return render_template('carrinho.html')
   elif request.method == 'POST':
        return redirect('/BlushGlamour-carrinho')




#PAGINA DO PRODUTO
@app.route('/BlushGlamour-Produto',  methods=['GET', 'POST'])
def pagina_produto():
   if request.method == 'GET':
        return render_template('paginaProduto.html')
   elif request.method == 'POST':
        return redirect('/BlushGlamour-Produto')




#PAGINA DA BARRA DE PESQUISA
@app.route('/pesquisa', methods=['GET', 'POST'])
def barra_Pesquisa():
   if request.method == 'GET':
        return render_template('barradePesquisa.html')
   elif request.method == 'POST':
        return redirect('/pesquisa')


if __name__ == '__main__':
    app.run(debug=True)