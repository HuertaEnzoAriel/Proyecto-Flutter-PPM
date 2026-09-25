import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'input_text.dart';
import 'responsive.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    final Responsive responsive = Responsive.of(context);
    final double inputFontSize = responsive.dp(responsive.isTablet ? 1.2 : 1.4);

    return Positioned(
      bottom: 5,
      left: 0,
      right: 0,
      child: Center(
        child: Container(
          //La propiedad constraints permite especificar límites en las medidas
          ////de los componentes
          //Si el dispositivo es una tablet, entonces en ancho máximo para el
          //formulario es 430 píxeles, sino 360 píxeles
          constraints: BoxConstraints(
            maxWidth: responsive.isTablet ? 430 : 360,
          ),
          child: Column(
            children: <Widget>[
              SizedBox(height: responsive.dp(20)),
              //Input de email
              InputText(
                keyboardType: TextInputType.emailAddress,
                label: 'Email',
                icon: Icons.mail_outline,
                fontSize: inputFontSize,
              ),
              SizedBox(height: responsive.dp(2)),
              //Input de contraseña
              Container(
                //Borde inferior del input de la contraseña
                decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: AppColors.muted)),
                ),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: InputText(
                        label: 'Contraseña',
                        obscureText: true,
                        borderEnable: false,
                        icon: Icons.lock_outline,
                        fontSize: inputFontSize,
                      ),
                    ),
                    //Botón para recuperar contraseña
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        '¿Olvidó su contraseña?',
                        style: TextStyle(
                          color: AppColors.accentDark,
                          fontWeight: FontWeight.bold,
                          fontSize: inputFontSize,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: responsive.dp(5)),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    elevation: 6,
                    shadowColor: AppColors.primary.withValues(alpha: 0.4),
                    //Botón tipo píldora
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.content_cut,
                          color: AppColors.accent,
                          size: responsive.dp(1.8),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          'Ingresar',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: responsive.dp(1.5),
                            fontWeight: FontWeight.w600,
                            letterSpacing: 1,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: responsive.dp(2)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    '¿Primera vez por acá?',
                    style: TextStyle(
                      color: AppColors.muted,
                      fontSize: responsive.dp(1.5),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                        color: AppColors.accentDark,
                        fontWeight: FontWeight.bold,
                        fontSize: responsive.dp(1.5),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: responsive.dp(10)),
            ],
          ),
        ),
      ),
    );
  }
}
