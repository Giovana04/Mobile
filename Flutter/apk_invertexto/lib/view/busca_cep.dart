import 'package:apk_invertexto/service/InvertextoService.dart';
import 'package:flutter/material.dart';

class BuscaCepPage extends StatefulWidget {
  const BuscaCepPage({super.key});

  @override
  State<BuscaCepPage> createState() => _BuscaCepPageState();
}

class _BuscaCepPageState extends State<BuscaCepPage> {
    String? campo;
  String? resultado;
  final apiService = Invertextoservice();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/imgs/logo.png', fit: BoxFit.contain, height: 40),
          ],
        ),
        leading: IconButton(onPressed: (){Navigator.pop(context);}, icon: Icon(Icons.arrow_back, color: const Color.fromARGB(255, 255, 246, 220),)),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration( //Não costuma deixar botão
                labelText: "Digite um CEP: ",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder()
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),
            Expanded(child: FutureBuilder(
              future: apiService.convertePorExtenso(campo), //alvo
              builder: (context, snapshot){ //não entendi Perguntar
              switch(snapshot.connectionState){
                case ConnectionState.waiting:
                case ConnectionState.none:
                  return Container(
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>( //documentação diz para usar sempre a cor Theme do projeto, usando primary e tudo mais??
                        Colors.white,
                      ),
                    ),
                  );
                default:
                  if(snapshot.hasError){
                    return Container();
                  }
                  else{
                    return exibeResultado(context, snapshot);
                  }

              }
            },),),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot){
    String enderecoCompleto = '';
    if(snapshot.data != null){
      enderecoCompleto += snapshot.data["street"] ?? "Rua não disponivel";
      enderecoCompleto += "\n";
      enderecoCompleto += snapshot.data['neighborhood'] ?? "Bairro não disponivel";
      enderecoCompleto += '\n';
      enderecoCompleto += snapshot.data['city'] ?? "Cidade não disponivel";
      enderecoCompleto += '\n';
      enderecoCompleto += snapshot.data['state'] ?? "Estado não disponivel";
    }
    return Padding(padding: EdgeInsets.only(top:10),
      child: Text(
        enderecoCompleto ?? '',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}