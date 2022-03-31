import 'package:aula02/desavio_login/controller_login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  final String name;
  const WelcomeScreen(this.name, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final user = Provider.of<ControllerLogin>(context).items;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Text(
          "SEJA BEM VINDO A SUA CONTA SENHOR $name",
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 30,
            color: Colors.purple,
            fontWeight: FontWeight.bold,
            letterSpacing: 2,
          ),
          softWrap: true,
        ),
      ),
    );
  }
}
