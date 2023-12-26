from flask import Flask,  request, jsonify, render_template, redirect, flash, session
import mysql.connector

 
app = Flask(__name__)
app.config['SECRET_KEY'] = "568425806"

#PAGINA PRINCIPAL DO SITE
@app.route('/')
def blushGlamour():
   return render_template('paginaPrincipal.html')
@app.route('/BlushGlamour', methods=['GET'])
def homepage_blushGlamour():
    return redirect('/BlushGlamour')

#PAGINA DE LOGIN DO CLIENTE
@app.route('/BlushGlamour-login')
def LoginCliente():
   return render_template('loginCliente.html')
@app.route('/BlushGlamour-login', methods=['POST'])
def login_Cliente():
    return redirect('/BlushGlamour-login')

#PAGINA DE CADASTRO DO CLIENTE
@app.route('/BlushGlamour-cadastro')
def cadastroCliente():
   return render_template('cadastroCliente.html')
@app.route('/BlushGlamour-cadastro', methods=['POST'])
def cadastro_Cliente():
    return redirect('/BlushGlamour-cadastro')

#PAGINA DE LOGIN DO FORNECEDOR
@app.route('/BlushGlamour-Fornecedores')
def loginFornecedor():
   return render_template('loginFornecedores.html')
@app.route('/BlushGlamour-Fornecedores', methods=['POST'])
def login_Fornecedor():
    return redirect('/BlushGlamour-Fornecedores')

#PAGINA DE CADASTRO DO FORNECEDOR
@app.route('/BlushGlamour-CadastroFornecedores')
def cadastroFornecedor():
   return render_template('cadastroFornecedor.html')
@app.route('/BlushGlamour-CadastroFornecedores', methods=['POST'])
def cadastro_Fornecedor():
    return redirect('/BlushGlamour-CadastroFornecedores')

#PAGINA DE ALTERAR DADOS
@app.route('/alterarDados')
def alterarDados():
   return render_template('alterarDadosCliente.html')
@app.route('/alterarDados', methods=['POST'])
def alterar_dados():
    return redirect('/alterarDados')

#PAGINA DE ESQUECI A SENHA
@app.route('/esqueciSenha')
def esqueciSenha():
   return render_template('esqueciSenha.html')
@app.route('/esqueciSenha', methods=['POST'])
def esqueci_Senha():
    return redirect('/esqueciSenha')

#PAGINA DO CARRINHO
@app.route('/BlushGlamour-carrinho')
def carrinho():
   return render_template('carrinho.html')
@app.route('/BlushGlamour-carrinho', methods=['POST'])
def carrinho_compra():
    return redirect('/BlushGlamour-carrinho')

#PAGINA DO PRODUTO
@app.route('/BlushGlamour-Produto')
def paginaProduto():
   return render_template('paginaProduto.html')
@app.route('/BlushGlamour-Produto', methods=['POST'])
def pagina_produto():
    return redirect('/BlushGlamour-Produto')

#PAGINA DA BARRA DE PESQUISA
@app.route('/pesquisa')
def barraPesquisa():
   return render_template('barradePesquisa.html')
@app.route('/pesquisa', methods=['POST'])
def barra_Pesquisa():
    return redirect('/pesquisa')


if __name__ == '__main__':
    app.run(debug=True)