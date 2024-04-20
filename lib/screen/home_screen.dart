import 'package:ejemplo/controllers/controllers.dart';
import 'package:ejemplo/screen/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  static String get routePage => 'HomeScreen';
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final homeController = Provider.of<HomeController>(context);
    final usersController = Provider.of<UsuariosController>(context);
    return Scaffold(
      body: Center(
        child: Text(
          homeController.contador.toString(),
          style: const TextStyle(fontSize: 100),
        ),
      ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton.filledTonal(
            padding: const EdgeInsets.all(20),
            icon: const Icon(Icons.add),
            onPressed: () {
              homeController.sumarUno();
            },
          ),
          const SizedBox(height: 10),
          IconButton.outlined(
            padding: const EdgeInsets.all(20),
            icon: const Icon(Icons.remove),
            onPressed: () {
              homeController.restarUno();
            },
          ),
          const SizedBox(height: 10),
          IconButton.filled(
            padding: const EdgeInsets.all(20),
            icon: const Icon(Icons.edit_document),
            onPressed: () {
              Navigator.pushNamed(context, FormularioScreen.routePage);
            },
          ),
          const SizedBox(height: 10),
          FilledButton(
            child: const Text('Ver usuasio registrados'),
            onPressed: () {
              usersController.getUsesr();
              Navigator.pushNamed(context, UsuariosScreen.routePage);
            },
          )
        ],
      ),
    );
  }
}
