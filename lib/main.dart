import 'package:aula02/views/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'controllers/controller_theme.dart';
import 'desavio_login/controller_login.dart';
//import 'desavio_login/login_screen.dart';

void main() {
  runApp(
    AnimatedBuilder(
        animation: ControllerTheme.istance,
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider(
                create: (_) => ControllerTheme(),
              ),
              ChangeNotifierProvider(
                create: (_) => ControllerLogin(),
              ),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                iconTheme: const IconThemeData(color: Colors.white),
                primarySwatch: Colors.orange,
                brightness: ControllerTheme.istance.opcao
                    ? Brightness.dark
                    : Brightness.light,
              ),
              home: const SplashPage(),
              // const LoginScreen()  const SplashPage(),
            ),
          );
        }),
  );
}
