import 'package:flutter/material.dart';

class AnimatedContainerPage extends StatelessWidget {
  const AnimatedContainerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animated Container"),),
      floatingActionButton: FloatingActionButton(onPressed: (){
        Navigator.pop(context);
      }),
    );
  }
}