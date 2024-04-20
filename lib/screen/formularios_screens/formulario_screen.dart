import 'package:ejemplo/controllers/formulario_controllers/formulario_form_controller.dart';
import 'package:ejemplo/controllers/home_controller.dart';
import 'package:ejemplo/utils/custom_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FormularioScreen extends StatelessWidget {
  static String get routePage => 'FormularioScreen';
  const FormularioScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    HomeController homeController = Provider.of(context);
    final formController = FormularioFormController();
    var colorScheme = getColorScheme(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.onPrimary,
        title: const Text('Formulario'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Form(
          key: formController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              TextFormField(
                controller: formController.nombre,
                decoration: const InputDecoration(
                  hintText: 'Nombre',
                ),
                validator: (value) {
                  return (value ?? '').isEmpty
                      ? 'Debes colocar un nombre valido'
                      : null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: formController.edad,
                decoration: const InputDecoration(
                  hintText: 'Edad',
                ),
                validator: (value) {
                  return (value ?? '').isEmpty
                      ? 'Debes colocar una edad valida'
                      : null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: formController.correo,
                decoration: const InputDecoration(
                  hintText: 'Correo',
                ),
                validator: (value) {
                  return (value ?? '').isEmpty
                      ? 'Debes colocar un correo valido'
                      : null;
                },
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      child: const Text('Limpiar'),
                      onPressed: () {
                        formController.clearData();
                      },
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: FilledButton(
                      child: const Text('Enviar'),
                      onPressed: () {
                        if (formController.isValidForm()) {
                          homeController.registrarUsuario();
                          print(formController.toModel().toJson());
                        }
                      },
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
