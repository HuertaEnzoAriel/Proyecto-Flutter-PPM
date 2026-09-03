import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  const ContadorPage({super.key});

  @override
  State<ContadorPage> createState() => _ContadorPage();
}

class _ContadorPage extends State<ContadorPage> {
  int contador = 0;
  void incrementarContador() {
    setState(() {
      contador++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('el contador tiene'),
            Text("$contador"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => incrementarContador(),
        child: const Icon(
          Icons.add,
          color: Color.fromARGB(255, 255, 32, 3),
        ),
      ),
    );
  }
}
