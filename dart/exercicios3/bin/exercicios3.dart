enum Naipe { copas, ouros, paus, espadas }

enum Valores {
  as,
  dois,
  tres,
  quatro,
  cinco,
  seis,
  sete,
  oito,
  nove,
  dez,
  valete,
  dama,
  rei,
}

class Carta {
  final Naipe n;
  final Valores v;

  Carta(this.n, this.v);

  @override
  String toString() {
    return '${v.name} de ${n.name}';
  }
}

class Baralho{
  List<Carta> c = [];

  Baralho(){
    for (var n in Naipe.values) {
      for (var v in Valores.values) {
        c.add(Carta(n, v));
      }
    }
  }

  Baralho embaralhar(){
    c.shuffle(); //shuffle organiza aleatoriamente os elementos de uma lista
    return this;
  }

  Carta comprar(){
    return c.removeLast();
  }

  int cRestantes(){
    return c.length;
  }
  
}

void main(List<String> arguments){
  var baralho = Baralho().embaralhar();
  for (var i = 0; i < 5; i++) {
    print(baralho.comprar());
  }
  print('Cartas restantes no baralho: ${baralho.cRestantes()}');
}