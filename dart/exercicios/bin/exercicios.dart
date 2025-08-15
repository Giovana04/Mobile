import 'package:exercicios/exercicios.dart' as exercicios;

void main(List<String> arguments) {
  exercicios.ex1(1, 2, 3);
  
  exercicios.ex2(5);

  int c = 0;
  num ex3(int a, int b) => a == b ? a + b : a * b;
  print(ex3(2,2));
  print(ex3(2,3));
  print('\n\n');

  List n = [1,2,3];
  exercicios.ex4(n);

  exercicios.ex5();

  exercicios.ex6();
  
  exercicios.ex7(5);
  print('\n\n');
  exercicios.ex8(4);
}
