import 'dart:math';

import 'package:flutter/material.dart';

//Página que muestra un componente rectangular. Al presionar el botón
//flotante "Mover", la figura se desplaza de izquierda a derecha (o de
//vuelta) y además cambia de tamaño, sin salirse nunca del área visible
class MovingComponentPage extends StatefulWidget {
  const MovingComponentPage({super.key});

  @override
  State<MovingComponentPage> createState() => _MovingComponentPageState();
}

class _MovingComponentPageState extends State<MovingComponentPage>
    with SingleTickerProviderStateMixin {
  //Único controlador: solo se anima el desplazamiento horizontal, y
  //solo avanza cuando se presiona el botón (no se repite solo)
  late final AnimationController _xController;

  final Random _random = Random();

  static const double _anchoMinimo = 60.0;
  static const double _anchoMaximo = 160.0;
  static const double _altoMinimo = 40.0;
  static const double _altoMaximo = 90.0;

  double _ancho = 120.0;
  double _alto = 70.0;
  Color _color = Colors.blue;

  @override
  void initState() {
    super.initState();
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
  }

  //Se dispara únicamente al presionar el botón "Mover": cambia el
  //tamaño y anima el desplazamiento hacia el extremo contrario
  void _mover() {
    setState(() {
      _ancho =
          _anchoMinimo +
          _random.nextDouble() * (_anchoMaximo - _anchoMinimo);
      _alto =
          _altoMinimo + _random.nextDouble() * (_altoMaximo - _altoMinimo);
      _color = Color.fromRGBO(
        _random.nextInt(255),
        _random.nextInt(255),
        _random.nextInt(255),
        1.0,
      );
    });

    //Si ya está a la derecha (o a mitad de camino), vuelve a la
    //izquierda; si no, avanza hacia la derecha
    if (_xController.value >= 0.5) {
      _xController.reverse();
    } else {
      _xController.forward();
    }
  }

  @override
  void dispose() {
    _xController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Componente en Movimiento')),
      //LayoutBuilder entrega el tamaño real disponible del body, para
      //calcular el recorrido máximo y que el componente nunca sobrepase
      //los límites de la pantalla
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final double maxX = constraints.maxWidth - _ancho;

          return AnimatedBuilder(
            animation: _xController,
            builder: (BuildContext context, Widget? child) {
              //Al no fijar "top", el Stack centra verticalmente el
              //componente según su alineación, así el alto puede
              //cambiar sin que la figura suba o baje nunca
              return Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    left: _xController.value * maxX,
                    child: child!,
                  ),
                ],
              );
            },
            //AnimatedContainer suaviza el cambio de tamaño/color cada
            //vez que setState actualiza esas propiedades
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 600),
              width: _ancho,
              height: _alto,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: _color,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 8.0,
                    offset: Offset(0.0, 4.0),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _mover,
        icon: const Icon(Icons.arrow_forward),
        label: const Text('Mover'),
      ),
    );
  }
}
