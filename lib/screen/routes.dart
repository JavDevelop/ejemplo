import 'package:ejemplo/screen/screens.dart';
import 'package:flutter/material.dart';

export 'package:ejemplo/screen/screens.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> get routes => {
        //Pantalla inicial de la app
        HomeScreen.routePage: (_) => const HomeScreen(),
        FormularioScreen.routePage: (_) => const FormularioScreen(),
        UsuariosScreen.routePage: (_) => const UsuariosScreen(),
      };

  static String get initialRoute => HomeScreen.routePage;
}
