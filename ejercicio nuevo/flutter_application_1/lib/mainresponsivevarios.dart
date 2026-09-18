import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Row(
        children: [
          Container(
            width: screenWidth * 0.25,
            height: screenHeight * 0.50,
            color: Colors.amberAccent,
          ),
          Container(
            width: screenWidth * 0.25,
            height: screenHeight * 0.50,
            color: Colors.redAccent,
          ),
          Container(
            width: screenWidth * 0.25,
            height: screenHeight * 0.50,
            color: Colors.greenAccent,
          ),
          Container(
            width: screenWidth * 0.25,
            height: screenHeight * 0.50,
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
