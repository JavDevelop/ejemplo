import 'package:ejemplo/controllers/controllers.dart';
import 'package:ejemplo/models/models.dart';
import 'package:ejemplo/utils/custom_functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsuariosScreen extends StatelessWidget {
  static String get routePage => 'UsuariosScreen';
  const UsuariosScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final usersController = Provider.of<UsuariosController>(context);
    var colorScheme = getColorScheme(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.onPrimary,
        title: const Text('Usuarios Registrados'),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Center(
          child: usersController.isLoading
              ? const CircularProgressIndicator()
              : const _UsersData(),
        ),
      ),
    );
  }
}

class _UsersData extends StatelessWidget {
  const _UsersData();

  @override
  Widget build(BuildContext context) {
    final usersController = Provider.of<UsuariosController>(context);
    var usuarios = usersController.usuarios;
    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),
      physics: const BouncingScrollPhysics(),
      itemCount: usuarios.length,
      itemBuilder: (context, index) => _CardUser(
        usuario: usuarios[index],
        index: index,
      ),
      separatorBuilder: (context, index) => const SizedBox(height: 10),
    );
  }
}

class _CardUser extends StatelessWidget {
  const _CardUser({
    required this.usuario,
    required this.index,
  });

  final UserModel usuario;
  final int index;

  @override
  Widget build(BuildContext context) {
    var colorScheme = getColorScheme(context);
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(25),
      ),
      width: double.infinity,
      child: Column(
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: colorScheme.onPrimaryContainer,
              shape: BoxShape.circle,
            ),
          ),
          Text('Nombre: ${usuario.name}'),
          Text('Cellphone: ${usuario.phoneNumber}'),
          Text('SubName: ${usuario.surname}'),
          Text('Sex: ${usuario.sex}'),
        ],
      ),
    );
  }
}
