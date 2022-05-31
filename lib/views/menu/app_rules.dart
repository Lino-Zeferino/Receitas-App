import 'package:flutter/material.dart';

class AppRules extends StatelessWidget {
  const AppRules({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Text(
            "REGRAS DO APP",
            style: TextStyle(color: Colors.amber, fontSize: 40),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
