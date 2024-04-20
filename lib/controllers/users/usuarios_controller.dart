import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ejemplo/models/models.dart';
import 'package:flutter/material.dart';

class UsuariosController extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<UserModel> _usuarios = [];
  List<UserModel> get usuarios => _usuarios;

  void getUsesr() async {
    _isLoading = true;
    notifyListeners();
    _usuarios = [];
    var usuariosReference =
        await FirebaseFirestore.instance.collection('users').get();

    for (var element in usuariosReference.docs) {
      _usuarios.add(UserModel.fromJson(element.data()));
    }

    await Future.delayed(const Duration(seconds: 2));
    _isLoading = false;
    notifyListeners();
  }
}
