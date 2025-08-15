void ex1(int a, int b, int c) {
 a+b >= c ? print("maior/igual\n\n") : print("menor\n\n");
}

void ex2(int n) {
  n % 2 == 0 ? print("par\n\n") : print("impar\n\n");
}

void ex4(List n){
  n.sort((a, b) => b.compareTo(a)); // ele compara os valores a cada dois para inverter pro decrescente
  print('$n \n\n');
}

void ex5(){
  int soma = 0;
  for (var i = 1; i <= 500; i+=2) {
    if(i % 3 == 0){
      soma += i;
    }
  }
  print('$soma \n\n');
}

void ex6(){
  for (var i = 101; i < 200; i+=2) {
    print("$i, ");
  }
  print("\n\n");
}

void ex7(int n){
  List.generate(11, (i) => i).forEach((i) => print('${i * n}, '));
}

void ex8(int n){
  int fatorial = 1;
  for (int i = 1; i <= n; i++) {
    fatorial *= i;
    print('$fatorial');
  }
  print("\n\n");
}
