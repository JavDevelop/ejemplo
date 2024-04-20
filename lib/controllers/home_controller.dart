import 'package:ejemplo/controllers/formulario_controllers/formulario_controllers.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  // bool _isLoading = false;
  // bool get isLoading => _isLoading;
  int _contador = 10;
  int get contador => _contador;
  set contador(int value) {
    _contador = value;
    notifyListeners();
  }

  void sumarUno() {
    _contador++;
    notifyListeners();
  }

  restarUno() {
    _contador--;
    notifyListeners();
  }

  void registrarUsuario() {
    final formController = FormularioFormController();
    print(formController.toJoson());
  }
}
