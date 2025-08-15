import 'package:dart_application_1/dart_application_1.dart' as apli1;

void main(List<String> arguments) {
  apli1.saudacoes2('gigi', sobrenome: apli1.adicionaSobrenome);

  List qualquer = [1, 'bah', 3.14, true];
  print(qualquer);

  List<String> nomes = [
    'gigi',
    'gabi',
    'guto',
  ]; // Mais correto que List qualquer
  print(nomes[2]);
  print('\n');
  
  nomes.add('bahamas');
  
  List<String> h = ['uh', 'iij'];
  nomes.addAll(h);
  print(nomes);
  print('\n');
  
  nomes.insert(2, "iwef"); // insere na posição 2
  print(nomes);
  print('\n');

  print(nomes.contains('bahamas\n')); // verifica se contém o elemento
  
  print("\nindexOf");
  print(nomes.indexOf('gabi')); // retorna o índice do elemento
  
  print(
    nomes.remove('\ngigi\n'),
  ); // remove o elemento, retorna true se removido com sucesso. Se tiver mais de um elemento igual, remove o primeiro encontrado

  print("\n For in");
  for (String nome in nomes) {
    print(nome); // percorre a lista e imprime cada elemento
  } 

  print("\n\n Null");
  List<String?> nomesNulos = [
    'gigi',
    null,
    'gabi',
    null,
  ]; // Lista que pode conter valores nulos
  print(nomesNulos);

  print("\n\n INTERVALO");
  List<int> intervalo = List.generate(10, (i) => i*10); // Cria uma lista de 10 elementos, cada um sendo o índice multiplicado por 10

  print(intervalo); 

  print(intervalo.isEmpty);
  print(intervalo.isNotEmpty);

  print("\nwhere");
  print(intervalo.where((i) => i > 30)); // Filtra todos os elementos maiores que 30


  print("\n\nmap");
  print(intervalo.map((i) => i + 5)); // Adiciona 5 a cada elemento da lista
  //O map consegue transformar uma lista em outra lista, aplicando uma função a cada elemento. Ou seja, ele mapeia os valores de uma lista para novos valores.
    

  //Json é do tipo Map<String, dynamic> sendo o dynamic o tipo da minha model (mais correto)
  //json.decode é o método que converte um json em um Map<String, dynamic>, importando 'dart:convert';
  // o decode é o que converte o json """ """ para o Map<String, dynamic>


  // Variavel const tem que ter valor atribuído na declaração que não pode ser alterado depois
  // Variavel final pode ser atribuída depois, mas só uma vez, e não pode ser alterada depois
}
