import 'package:apk_invertexto/service/InvertextoService.dart';
import 'package:flutter/material.dart';

class ValidaCpfPage extends StatefulWidget {
  const ValidaCpfPage({super.key});

  @override
  State<ValidaCpfPage> createState() => _ValidaCpfPageState();
}

class _ValidaCpfPageState extends State<ValidaCpfPage> {
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
            TextField(
              decoration: InputDecoration(
                //Não costuma deixar botão
                labelText: "Digite um CPF: ",
                labelStyle: TextStyle(color: Colors.white),
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
              style: TextStyle(color: Colors.white, fontSize: 18),
              onSubmitted: (value) {
                setState(() {
                  campo = value;
                });
              },
            ),
            Expanded(
              child: FutureBuilder(
                future: apiService.validaCPF(campo), //alvo
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
    String cpfCompleto = '';
    bool? valido;
    if (snapshot.data != null) {
      valido = snapshot.data["valid"];
      cpfCompleto += snapshot.data["formatted"] ?? "Não existe";
    }
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Text(
        'Formatado: $cpfCompleto\nValido: ${valido ?? "Indeterminado"}',
        style: TextStyle(color: Colors.white, fontSize: 18),
      ),
    );
  }
}
