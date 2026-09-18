import 'package:flutter/material.dart';

//Página de bienvenida: panel superior en degradé con círculos
//flotando sobre su borde inferior, generado con Stack + Positioned +
//Container (BoxDecoration con gradient / shape: BoxShape.circle)
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final alturaEncabezado = size.height * 0.34;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Práctica de Componentes',
        style: TextStyle(
          color: Colors.white,
        ),),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      //Stack permite superponer el panel en degradé, los círculos
      //decorativos y el contenido (texto y botón)
      body: Stack(
        children: [
          _circulo(
            top: alturaEncabezado - 350.0,
            left: -50,
            diametro: 380.0,
            colores: const [Color.fromARGB(255, 8, 0, 255), Color.fromARGB(255, 47, 44, 201),Color.fromARGB(255, 215, 52, 236),Color.fromARGB(255, 159, 85, 159),Color.fromARGB(255, 181, 109, 253)],
          ),
          _circulo(
            top: alturaEncabezado - 350.0,
            right: -50.0,
            diametro: 380.0,
            colores: const [Color.fromARGB(255, 8, 0, 255), Color.fromARGB(255, 47, 44, 201),Color.fromARGB(255, 175, 79, 188),Color.fromARGB(255, 247, 107, 247),Color.fromARGB(255, 112, 65, 155)],
          ),
          //Panel superior: Container + BoxDecoration con gradient
          Container(
            width: double.infinity,
            height: alturaEncabezado,
            alignment: Alignment.center,
            decoration: const BoxDecoration(

            ),
            child: const Text(
              '!!Bienvenidos!!',
              style: TextStyle(
                fontSize: 50.0,
                fontWeight: FontWeight.bold,
                color: Color(0xFFF1E6FF),
              ),
            ),
          ),
          //Círculos decorativos ubicados sobre el borde inferior del
          //panel, a caballo entre el degradé y el fondo blanco

          SafeArea(
            child: Column(
              children: [
                SizedBox(height: alturaEncabezado + 5.0),
                Expanded(child: Center(child: _botonNuevaPagina(context))),
                const Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Text(
                    'Práctica de Componentes',
                    style: TextStyle(
                      color: Color.fromARGB(255, 144, 209, 24),
                      fontSize: 32.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  //Círculo individual en degradé: Container con BoxDecoration
  //(shape: BoxShape.circle + gradient) envuelto en Opacity para que
  //se integre con el fondo en vez de verse como un bloque sólido
  Widget _circulo({
    double? top,
    double? left,
    double? right,
    double? bottom,
    required double diametro,
    List<Color> colores = const [Colors.purple, Colors.pinkAccent],
  }) {
    return Positioned(
      top: top,
      left: left,
      right: right,
      bottom: bottom,
      child: Opacity(
        opacity: 0.85,
        child: Container(
          width: diametro,
          height: diametro,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: colores,
            ),
          ),
        ),
      ),
    );
  }

  Widget _botonNuevaPagina(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 12.0),
      ),
      onPressed: () {
        Navigator.pushNamed(context, 'movingComponent');
      },
      child: const Text('Nueva Página'),
    );
  }
}
