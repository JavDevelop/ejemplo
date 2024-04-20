import 'package:ejemplo/models/models.dart';
import 'package:flutter/material.dart';

class FormularioFormController {
  static final FormularioFormController _instancia =
      FormularioFormController._internal();
  factory FormularioFormController() {
    return _instancia;
  }
  FormularioFormController._internal();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController nombre = TextEditingController();
  TextEditingController edad = TextEditingController();
  TextEditingController correo = TextEditingController();

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }

  void clearData() {
    nombre.clear();
    edad.clear();
    correo.clear();
  }

  Map<String, dynamic> toJoson() => {
        'nombre': nombre.text.trim(),
        'edad': edad.text.trim(),
        'correo': correo.text.trim(),
      };

  UserModel toModel() => UserModel(
        socialMediaPreference: 'Facebook',
        phoneNumber: 'numero',
        surname: 'apodo',
        sex: 'M',
        name: nombre.text.trim(),
        age: int.parse(edad.text),
        admin: false,
      );
}
