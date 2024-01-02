class Pessoa:
    def __init__(self, cpf, nome, email):
        self.cpf = cpf
        self.nome = nome
        self.email = email
        
        if self.cpf == '1111111':
            print(f'Usuario {self.cpf}, {self.nome}, {self.email} cadastrado')
        else:
            print('Nao cadastrado') 
    
    def cadastrar(self, cpf, nome, email):
        self.cpf = cpf
        self.nome = nome 
        self.email = email
   
        self.lista = []
        self.lista.append(self.cpf)
        self.lista.append(self.nome)
        self.lista.append(self.email)
        

        return self.lista
            
class Cliente(Pessoa):
    def __init__(self, cpf, nome, email):
        super().__init__(cpf, nome, email)

    def alterarNome(self, novoNome):
            self.nome = novoNome
            self.lista.pop(1)
            self.lista.insert(1, self.nome)

            return self.lista



Everaldo = Cliente('1111111', 'Everaldo', 'eve@345')
Everaldo.cadastrar('1111111', 'Everaldo', 'eve@345')

valores = Everaldo.cadastrar('1111111', 'Everaldo', 'eve@345')
for i in valores:
    print(i)

valores2 = Everaldo.alterarNome('Felipe')
for i in valores2:
    print(i)