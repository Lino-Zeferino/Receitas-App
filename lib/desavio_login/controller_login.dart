// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

import 'model_user.dart';

class ControllerLogin with ChangeNotifier {
  bool statePassword = false;
  String name = "";
  final baseUrl = "https://my-shop-c2b1e-default-rtdb.firebaseio.com/products";
  final List<ModellUser> _items = [];
  // ignore: non_constant_identifier_names
  final LIST_USER = [
    ModellUser(
      id: Random().nextDouble().toString(),
      name: "Lino Zeferino",
      email: "linozeferino@gmail.com",
      password: "123456",
    ),
    ModellUser(
      id: Random().nextDouble().toString(),
      name: "Andre Zeferino",
      email: "andre@gmail.com",
      password: "123456",
    ),
    ModellUser(
      id: Random().nextDouble().toString(),
      name: "Daniel Zeferino",
      email: "daniel@gmail.com",
      password: "1234567",
    ),
    ModellUser(
      id: Random().nextDouble().toString(),
      name: "Josue Zeferino",
      email: "josue@gmail.com",
      password: "123456",
    ),
  ];
  List<ModellUser> get items => [..._items];

  chengeStatePassword() {
    statePassword = !statePassword;
    notifyListeners();
  }

  int get itemCount {
    return _items.length;
  }

  Future<void> addUser(ModellUser newUser) async {
    final value = await http.post(
      Uri.parse("$baseUrl.json"),
      body: json.encode({
        "name": newUser.name,
        "email": newUser.email,
        "password": newUser.password,
      }),
    );

    _items.add(
      ModellUser(
        id: json.decode(value.body)["name"],
        name: newUser.name,
        email: newUser.email,
        password: newUser.password,
      ),
    );
    notifyListeners();
  }

  Future<void> loadingUser() async {
    final response = await http.get(Uri.parse("$baseUrl.json"));
    Map<String, dynamic> data = json.decode(response.body);
    _items.clear();
    if (data != null) {
      data.forEach((key, value) {
        _items.add(
          ModellUser(
            id: key,
            name: value["name"],
            email: value["email"],
            password: value["password"],
          ),
        );
      });
      notifyListeners();
    }
    return Future.value();
  }

  returnUser(String email, String password) {
    var result = _items.firstWhere(
        (element) => (element.email == email && element.password == password));

    print(result);
    return result;
  }

  // validar Senha(compara se a senha antiga é igual a nova)// confirmação de senha
  FormFieldValidator compare(TextEditingController? senha1, String sms) {
    return (value) {
      final valueSenha = senha1?.text ?? "";
      if (value == null || (value != null && value != valueSenha)) {
        return sms;
      }
      return null;
    };
  }
}
/**
 *   LIST_USER.forEach((element) {
      if (element.email == email && element.password == password) {
     
      } else {
        name = "Usuario inexistente";
      }
    });
 */