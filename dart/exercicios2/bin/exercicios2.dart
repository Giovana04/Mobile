import 'package:exercicios2/exercicios2.dart' as exercicios2;

enum Pessoa {
  joao("joao", 15),
  giovana("giovana", 20),
  bea("bwatriz", 19);

  final String nome;
  final int idade;

  const Pessoa(this.nome, this.idade);
}

void main(List<String> arguments) {
  print("\nex 1:");
  List frutas = [
    "tomate", "maça", "pera", "laranja", "limão", "amora"
  ];
  print(frutas);

  print("\n\n ex 2:");
  print(frutas[2]);
  
  print("\n\n ex 3:");
  frutas.remove("laranja");
  frutas.remove("maça");
  print(frutas);

  print("\n\n ex 4:");
  for (var fruta in frutas) {
    print(fruta);
  }

  print("\n\n ex 5:");
  frutas.forEach(print);

  print("\n\n ex 6:");
  List A = frutas.where((letra) => letra.startsWith("a")).toList();
  print(A);

  print("\n\n ex 7: ");
  var precoFrutas = {
    "laranja" : 42.56,
    "maçã": 2.50,
    "banana": 1.80
  };
  print(precoFrutas);

  print("\n\n ex 8: ");
  precoFrutas.forEach((fruta, preco) {
    print("$fruta custa ${preco.toStringAsFixed(2)}");
  });
  
  print("\n\n ex 9: ");
  List j = [1,2,3,4,5,6,7,8];
  List par = [];
  var numb = (List k, List p) => k.forEach((i) => i%2==0? p.add(i): print("$i impar")); //pq fica azul?
  numb(j, par);
  print(par);

  print("\n\nDesafio: ");
  for (var p in Pessoa.values) {
    p.idade > 18? print("${p.nome} é maior de idade") : print("${p.nome} é menor de idade");
  }
}
