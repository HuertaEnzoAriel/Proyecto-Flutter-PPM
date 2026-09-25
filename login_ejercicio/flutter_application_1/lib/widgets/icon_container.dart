import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/app_colors.dart';

class IconContainer extends StatelessWidget {
  final double size;
  const IconContainer({super.key, required this.size}) : assert(size > 0);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: size, height: size,
      decoration: BoxDecoration(
          color: Colors.white,
          //Forma circular con borde dorado
          shape: BoxShape.circle,
          border: Border.all(color: AppColors.accent, width: 2),
          boxShadow: [
            BoxShadow(
                color: AppColors.primary.withValues(alpha: 0.3),
                blurRadius: 20,
                offset: const Offset(0, 10)),
          ]),
      padding: EdgeInsets.all(size * 0.15),
//Se utiliza un widget Center para posicionar el icono
      child: Center(
        child: SvgPicture.asset(
          'assets/scissors.svg',
//Tamaño del icono
          width: size * 0.6,
          height: size * 0.6,
        ),
      ),
    );
  }
}
