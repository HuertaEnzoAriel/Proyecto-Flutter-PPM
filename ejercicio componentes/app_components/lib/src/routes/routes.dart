import 'package:app_components/src/pages/contador_page.dart';
import 'package:flutter/material.dart';

import '../pages/alert_page.dart';
import '../pages/animatedContainer_page.dart';
import '../pages/avatar_page.dart';
import '../pages/card_page.dart';
import '../pages/home_page.dart';
import '../pages/imagen_page.dart';
import '../pages/inputs_page.dart';
import '../pages/list_page.dart';
import '../pages/slider_page.dart';

Map<String, WidgetBuilder> getAplicationsRoutes() {
  return <String, WidgetBuilder>{
    "/": (BuildContext context) => const HomePage(),
    "alert": (BuildContext context) => const AlertPage(),
    "avatar": (BuildContext context) => const AvatarPage(),
    "contador": (BuildContext context) => const ContadorPage(),
    "animatedContainer": (BuildContext context) =>
        const AnimatedContainerPage(),
    "inputs": (BuildContext context) => const InputPage(),
    "slider": (BuildContext context) => const SliderPage(),
    "list": (BuildContext context) => const ListPage(),
    "imagen": (BuildContext context) => const ImagenPage(),
    "card": (BuildContext context) => const CardPage(),
  };
}
