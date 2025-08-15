void saudacoes(String nome, {String? sobrenomes}) { 
    //parametro nome obrigatório, sobrenomes opcional. O opcional funciona entre chaves e com ?
    print('Olá $nome $sobrenomes');
}

void adicionaSobrenome(){
  print('bah');
}

void saudacoes2(String nome, {required Function sobrenome}) { 
    //parametro nome obrigatório, sobrenomes opcional. O opcional funciona entre chaves e com ?
    print('Olá $nome');
    sobrenome();
}
