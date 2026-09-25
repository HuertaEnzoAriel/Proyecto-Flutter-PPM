import 'package:flutter/material.dart';

import 'app_colors.dart';

class InputText extends StatelessWidget {
//Variable para almacenar el nombre de la etiqueta que se pasa por //parámetro
  final String label;
//Variable para almacenar el tipo de teclado a mostrar para un tipo de //input
  final TextInputType keyboardType;
//Variable para almacenar el valor booleano de ocultar o mostrar //caracteres en un input
  final bool obscureText;
//Variable para almacenar el valor booleano de ocultar o mostrar el //borde en un input
  final bool borderEnable;
//Variable para almacenar el valor del tamaño de la fuente de un input
//en un input
  final double fontSize;
//Variable para almacenar el ícono que se muestra a la izquierda del input
  final IconData? icon;

  const InputText(
      {super.key,
      this.label = '',
      this.keyboardType = TextInputType.text,
      this.obscureText = false,
      this.borderEnable = true,
      this.fontSize = 15,
      this.icon});

  @override
  Widget build(BuildContext context) {
//Se genera un Input genérico para ser reutilizado con los distintos
//campos de un formulario
    return TextFormField(
      //keyboardType permite determinar el tipo de teclado a mostrar.
      //Por ejemplo, de tipo email, tipo texto, tipo numérico, etc
      keyboardType: keyboardType,
//obscureText permite ocultar los caracteres del input para utilizar en
      // ignore: unnecessary_this
//campos de contraseñas
      obscureText: obscureText,
      cursorColor: AppColors.accentDark,
      //Se aplica el estilo de texto dentro de los inputs
      style: TextStyle(fontSize: fontSize, color: AppColors.primary),
      decoration: InputDecoration(
          labelText: label,
          //Ícono opcional a la izquierda del input
          prefixIcon: icon != null
              ? Icon(icon, color: AppColors.accentDark, size: fontSize * 1.5)
              : null,
          //Propiedad para reducir padding entre texto y borde del input
          contentPadding: const EdgeInsets.symmetric(vertical: 5),
          //Propiedad para establecer la configuración de los bordes en
          //los inputs
          enabledBorder: borderEnable
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.muted))
              : InputBorder.none,
          focusedBorder: borderEnable
              ? const UnderlineInputBorder(
                  borderSide: BorderSide(color: AppColors.accent, width: 2))
              : InputBorder.none,
          labelStyle: const TextStyle(
              color: AppColors.muted, fontWeight: FontWeight.w500),
          floatingLabelStyle: const TextStyle(
              color: AppColors.accentDark, fontWeight: FontWeight.w600)),
    );
  }
}
