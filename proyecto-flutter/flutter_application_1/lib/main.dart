import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int contador = 0;
  void incrementarContador() {
    setState(() {
      contador++;
    });
  }
// #AGREGUE COLUMNA CON CTRL+. PARANDOME EN EL WIDGET CENTER
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(child: Text('el contador tiene')),
          Text("$contador"),
        ],
      ), floatingActionButton: FloatingActionButton(
        onPressed: ()=> incrementarContador(),
        child: Icon(Icons.abc_outlined, color:const Color.fromARGB(255, 255, 32, 3)
      ),
      ),
      ),
    );
  }
}
