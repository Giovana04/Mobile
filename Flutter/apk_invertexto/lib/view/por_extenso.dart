import 'package:apk_invertexto/service/InvertextoService.dart';
import 'package:flutter/material.dart';

class PorExtensoPage extends StatefulWidget {
  const PorExtensoPage({super.key});

  @override
  State<PorExtensoPage> createState() => _PorExtensoPageState();
}

class _PorExtensoPageState extends State<PorExtensoPage> {
  String? campo, tipo;
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
            Image.asset(
              'assets/imgs/logo.png',
              fit: BoxFit.contain,
              height: 40,
            ),
          ],
        ),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back,
            color: const Color.fromARGB(255, 255, 246, 220),
          ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                //Não costuma deixar botão
                labelText: "Digite um número: ",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onChanged: (value) {
                campo = value;
              },
            ),
            
            DropdownButtonFormField<String>(
              value: tipo,
              onChanged: (String? novoValor) {
                setState(() {
                  tipo = novoValor!;
                });
              },
              items: <String>['BRL', 'USD', 'EUR', '']
                  .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                    );
                    
                  })
                  .toList(),
              decoration: InputDecoration(
                labelText: 'Selecione o tipo da moeda',
                labelStyle: TextStyle(
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
                border: OutlineInputBorder(),
              ),
              style: TextStyle(
                color: const Color.fromARGB(255, 255, 255, 255),
                fontSize: 18,
              ),
            ),

            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Enviando"),
                  behavior: SnackBarBehavior.floating,
                  margin: EdgeInsets.only(
                    top: 0,
                    bottom: 0,
                    left: 16,
                    right: 16,
                    ),
                  ),
                );
              },
              child: Text("Enviar"),
            ),
            
            Expanded(
              // OK ele funciona se colocar o tipo e depois o campo (pq???)
              child: FutureBuilder(
                future: apiService.convertePorExtenso(campo, tipo), //alvo
                builder: (context, snapshot) {
                  //não entendi Perguntar
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                    case ConnectionState.none:
                      return Container(
                        width: 200,
                        height: 200,
                        alignment: Alignment.center,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.white,
                          ),
                        ),
                      );
                    default:
                      if (snapshot.hasError) {
                        return Container(
                          padding: EdgeInsets.only(top: 20),
                          alignment: Alignment.topCenter,
                            height: 100,
                            width: 500,
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 50, 60, 65),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                'Erro: ${snapshot.error}',
                                style: const TextStyle(
                                  color: Colors.redAccent,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                        );
                      } else {
                        return exibeResultado(context, snapshot);
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget exibeResultado(BuildContext context, AsyncSnapshot snapshot) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        snapshot.data["text"] ?? '',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
