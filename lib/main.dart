import 'package:aula02/controllers/controller_sweet_provider.dart';
import 'package:aula02/controllers/crontroller_drink_provider.dart';
import 'package:aula02/views/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/controller_meals_provider.dart';
import 'controllers/controller_theme.dart';

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
                create: (_) => ControllerMeals(),
              ),
              ChangeNotifierProvider(
                create: (_) => ControllerSweet(),
              ),
              ChangeNotifierProvider(
                create: (_) => ControllerDrink(),
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
            ),
          );
        }),
  );
}
