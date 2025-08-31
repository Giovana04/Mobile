import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Container(
        color: const Color.fromARGB(255, 14, 211, 17),
        alignment: Alignment.center,
        child: Text("Hello Word!"),
      ),
    );
  }
}