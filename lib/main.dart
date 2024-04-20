import 'package:ejemplo/controllers/controllers.dart';
import 'package:ejemplo/screen/routes.dart';
import 'package:ejemplo/utils/utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ejemplo/firebase_options.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const _AppState());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      routes: Routes.routes,
      initialRoute: Routes.initialRoute,
      theme: CustomTheme.themeDark,
    );
  }
}

class _AppState extends StatelessWidget {
  const _AppState();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeController()),
        ChangeNotifierProvider(create: (_) => UsuariosController()),
      ],
      child: const MyApp(),
    );
  }
}
