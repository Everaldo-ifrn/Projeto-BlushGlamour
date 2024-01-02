from flask import Flask,  request, jsonify, render_template, redirect, flash, session
from blushGlamour import *
from datetime import datetime

import mysql.connector

#meu apricativo
app = Flask(__name__)
app.config['SECRET_KEY'] = "568425806"

#conexao com o banco de dados
bd = BancoDeDados()
db = bd.linkarBancoDeDados()



#PAGINA PRINCIPAL DO SITE (Precisamos rever esta rota, devemos mostrar os dados do cliente)
@app.route('/', methods=['GET', 'POST'])
def homepage_blushGlamour():
   if request.method == 'GET':
        cliente = Cliente(email=None, senha=None, cpf=None, nome=None, telefone=None, dataNascimento=None, rua=None, cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None, bairro=None, imagemPerfil=None)
        dadosCliente = cliente.dadosDoCliente(db)
        print(dadosCliente)

        return render_template('paginaPrincipal.html', dadosCliente=dadosCliente)
   elif request.method == 'POST':
        return redirect('/')




#PAGINA DE LOGIN DO CLIENTE
@app.route('/BlushGlamour-login', methods=['GET', 'POST'])
def login_Cliente():
   if request.method == 'GET':
        return render_template('loginCliente.html')
   elif request.method == 'POST':
        email = request.form.get('email')
        senha = request.form.get('senha')
        
        #chamando o metodo login
        cliente = Cliente(email=email, senha=senha, cpf=None, nome=None, telefone=None, dataNascimento=None, rua=None, cidade=None, cep=None, estado=None, NumeroResidencia=None, Complemento=None, bairro=None, imagemPerfil=None)
        status = cliente.login(db)
        
        #aqui vou criar uma sessao caso esteja tudo 
        if status == 'OK':
          #criando sessao para o usuario apos o cadastro
          try:
            cliente = Sessao(email)
            cliente.criarSessao()
            print('deu certo!')
          except Exception as e:
            print(f"Erro ao criar sessão: {e}")
            return redirect('/BlushGlamour-login')
        else:
          return render_template('loginCliente.html', status=status)
   return redirect('/')





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
        NumeroResidencia = request.form.get('numeroResidencia')
        complemento = request.form.get('Complemento')
        imagemPerfil = request.files.get('imgPerfil')

        # Verificando a extensão do arquivo e salvando no lugar certo
        extensao = imagemPerfil.filename.split('.', 1)[1]
        caminhoImagem = f'Projeto-BlushGlamour/Frontend/static/imagens/usuarios/{nome}.{extensao}'
        imagemPerfil.save(caminhoImagem)


        # esta classe serve para pegar os dados de cliente e cadastrar utilizando o metodo cadastrar
        cliente = Cliente(cpf, nome, email, senha, telefone, dataNascimento, rua, cidade, cep, estado, NumeroResidencia, complemento, bairro, caminhoImagem)
        cliente.cadastrar(db)

        #criando sessao para o usuario apos o cadastro
        try:
          cliente = Sessao(email)
          cliente.criarSessao()
        except Exception as e:
          print(f"Erro ao criar sessão: {e}")
          return redirect('/BlushGlamour-cadastro')
        
        #caso tudo ocorra bem ele ira ser redirecionado para a pagina inicial
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
        cnpj = request.form.get('cnpj')
        nome = request.form.get('nome')
        email = request.form.get('email')
        senha = request.form.get('senha')
        telefone = request.form.get('telefone')
        dataNascimento = request.form.get('data')
        rua = request.form.get('rua')
        cidade = request.form.get('cidade')
        estado = request.form.get('estado')
        numeroResidencia = request.form.get('numero')
        cep = request.form.get('cep')
        bairro = request.form.get('bairro')
        imagemPerfil = "caminhoDaImagem.jpg"
        

        #Aqui irei cadastrar o fornecedor com o metodo cadastrar herdado da classe pessoa pela classe fornecedor
        fornecedor = Fornecedor(cnpj, nome, email, senha, telefone, dataNascimento, rua, cidade, cep, estado, numeroResidencia, bairro, imagemPerfil)
        fornecedorLogado = fornecedor.cadastrarFornecedor(db)
        if  fornecedorLogado == "Algo deu errado em seu cadastro tente novamente":
          return render_template('cadastroFornecedor.html', mensagem=fornecedorLogado)
        elif fornecedorLogado == 'Entrou':
          #criando sessao para o usuario apos o cadastro
          try:
               cliente = Sessao(email)
               cliente.criarSessao()
          except Exception as e:
               print(f"Erro ao criar sessão: {e}")
               return redirect('/BlushGlamour-cadastro')
        
        #caso tudo ocorra bem ele ira ser redirecionado para a pagina inicial
        print(request.form)
      

      



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
     if session.get('logado'):#verificando se existe uma sessao para poder entrar no carrinho
          return render_template('carrinho.html')
     elif not session.get('logado'): #se nao estiver logado ele nao vai poder entrar no carrinho e ira para pagina
          return redirect('/BlushGlamour-login')

   elif request.method == 'POST':
        return redirect('/BlushGlamour-carrinho')




#PAGINA DO PRODUTO
@app.route('/BlushGlamour-Produto/<int:codigoDeBarra>',  methods=['GET', 'POST'])
def pagina_produto(codigoDeBarra):
   if request.method == 'GET':
        #estou chamando a classe produto e o metodo de visualizar produto
        produto = Produto(codigoDeBarra=None, nomeProduto=None, preço=None, quantidade=None, categoria=None, caminhoImagem=None, descrição=None)
        verProduto = produto.detalhesDoProduto(db, codigoDeBarra)  
        return render_template('paginaProduto.html', detalhesProduto=verProduto)

        
   elif request.method == 'POST':
        #estou chamando a classe produto e o metodo de visualizar produto
        produto = Produto(codigoDeBarra=None, nomeProduto=None, preço=None, quantidade=None, categoria=None, caminhoImagem=None, descrição=None)
        verProduto = produto.detalhesDoProduto(db, codigoDeBarra)  
        return render_template('paginaProduto.html', detalhesProduto=verProduto)




#PAGINA DE CADASTRAR PRODUTO
@app.route('/CadastroProdutos', methods=['GET', 'POST'])
def CadastroProdutos():
   if request.method == 'GET':
        produto = Produto(codigoDeBarra=None, nomeProduto=None, preço=None, quantidade=None, categoria=None, caminhoImagem=None, descrição=None)
        informacoesDoProduto = produto.verProdutos(db)
        return render_template('cadastroProdutos.html', dicionario=informacoesDoProduto)
        
   elif request.method == 'POST':
        #aqui tem que ter o codigo que vaiguardar os produtos no bd
        return redirect('/CadastroProdutos')




#PAGINA DA BARRA DE PESQUISA
@app.route('/pesquisa', methods=['GET', 'POST'])
def barra_Pesquisa():
   if request.method == 'GET':
        return render_template('barradePesquisa.html')
   elif request.method == 'POST':
         #estou pegando a palavra escrita pelo usuario para fazer a pesquisa
         pesquisa = request.form.get('barraPesquisa')
         
         #estou chamando a classe produto e o metodo de pesquisa de produto
         produto = Produto(codigoDeBarra=None, nomeProduto=None, preço=None, quantidade=None, categoria=None, caminhoImagem=None, descrição=None)
         dicionarioDaPesquisa = produto.pesquisarProduto(db, pesquisa)
         return render_template('barradePesquisa.html', dicionario=dicionarioDaPesquisa)





#ROTA PARA LOGOUT
@app.route('/logout', methods=['GET', 'POST'])
def logout():
   if request.method == 'GET':
        Cliente = Sessao(email=None)
        Cliente.finalizarSessao()
        print('cheguei')
        return render_template('paginaPrincipal.html')
   
   elif request.method == 'POST':
        return redirect('/')
   print('cheguei2')




if __name__ == '__main__':
    app.run(debug=True)