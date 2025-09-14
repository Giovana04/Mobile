import 'package:apk_invertexto/view/busca_cep.dart';
import 'package:apk_invertexto/view/por_extenso.dart';
import 'package:apk_invertexto/view/valida_cpf.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

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
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit, color: const Color.fromARGB(255, 250, 244, 227)),
                  Text(
                    "Por Extenso",
                    style: TextStyle(color: const Color.fromARGB(255, 248, 242, 223), fontSize: 30),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PorExtensoPage()));
              },
            ),
            SizedBox(height: 5),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit, color: const Color.fromARGB(255, 246, 240, 223)),
                  Text(
                    "Busca Cep",
                    style: TextStyle(color: const Color.fromARGB(255, 247, 238, 213), fontSize: 30),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>BuscaCepPage()));
              },
            ),
            GestureDetector(
              child: Row(
                children: <Widget>[
                  Icon(Icons.edit, color: const Color.fromARGB(255, 250, 244, 227)),
                  Text(
                    "Validar CPF",
                    style: TextStyle(color: const Color.fromARGB(255, 248, 242, 223), fontSize: 30),
                  ),
                ],
              ),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ValidaCpfPage()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
