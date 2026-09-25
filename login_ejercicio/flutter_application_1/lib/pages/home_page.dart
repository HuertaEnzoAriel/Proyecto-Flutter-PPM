import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/login_form.dart';
import '../widgets/circle.dart';
import '../widgets/icon_container.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    //Se utiliza las reglas de MediaQuery para obtener las dimensiones del
    //dispositivo
    final Size size = MediaQuery.of(context).size;
    //Se establece el tamaño de las esferas de la interfaz para poder //reutilizar en el varias partes del código
    final double goldSize = size.width * 0.8;
    final double espressoSize = size.width * 0.57;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColors.background,
        child: Stack(
          children: <Widget>[
            //Widget para establecer la posición del círculo
            Positioned(
              //Parámetros de posición del objeto
              top: -goldSize * 0.5,
              right: -goldSize * 0.2,
              child: Circle(
                //Se utiliza el valor calculado de la pantalla en vez de un
                //valor fijo. Para este caso, se calcula el tamaño de pantalla
                //por 0.8, es decir, el 80% del tamaño de pantalla
                //size: 320,
                size: goldSize,
                colors: const [AppColors.accent, AppColors.accentDark],
              ),
            ),
            Positioned(
              //Parámetros de posición del objeto
              top: -espressoSize * 0.55,
              left: -espressoSize * 0.15,
              child: Circle(
                //size: 240,
                size: espressoSize,
                colors: const [AppColors.primaryLight, AppColors.primary],
              ),
            ),
            Positioned(
              top: size.height * 0.15,
              width: size.width,
              child: Column(
                children: <Widget>[
                  const IconContainer(size: 100),
                  const SizedBox(height: 16),
                  //Nombre del salón
                  const Text(
                    'Estilo & Corte',
                    style: TextStyle(
                      color: AppColors.primary,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.2,
                    ),
                  ),
                  const SizedBox(height: 4),
                  //Eslogan
                  const Text(
                    'RESERVÁ TU TURNO',
                    style: TextStyle(
                      color: AppColors.accentDark,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
            const LoginForm(),
          ],
        ),
      ),
    );
  }
}
