// ignore_for_file: file_names

import 'dart:async' show Timer;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  route() {
    Navigator.push(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secand) {
          return const HomePage();
        },
        transitionDuration: const Duration(seconds: 3),
      ),
    );
  }

  startTimer() {
    var duration = const Duration(seconds: 4);
    Timer(duration, route);
  }

  @override
  initState() {
    super.initState();
    startTimer();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Opacity(
            opacity: 0.6,
            child: Image.asset(
              "assets/images/fundo.jpg",
              height: size.height,
              width: size.width,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            width: double.infinity,
            height: size.height,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: const [0.4, 0.6],
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.orange.withOpacity(0.1)
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Spacer(),
                Padding(
                  padding: EdgeInsets.fromLTRB(30.0, 0, 30, 8),
                  child: Text(
                    " Use este aplicativo para aprender a cozinhar",
                    style: TextStyle(
                      letterSpacing: 3,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 22,
                    left: 30,
                    right: 30,
                  ),
                  child: Text(
                    " APLICAÇÃO OKUTELEKA ",
                    style: TextStyle(
                      letterSpacing: 1,
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: 8,
                    bottom: 230.0,
                    left: 30,
                  ),
                  child: Text(
                    "Conheça as adiversidades dos Pratos",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 91,
                    bottom: 10,
                  ),
                  child: Text(
                    "Carregando",
                    style: TextStyle(
                      letterSpacing: 6.4,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 8.0),
                  child: LinearProgressIndicator(
                    backgroundColor: Colors.brown,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: 40,
                  ),
                  child: Text(
                    " APLICAÇÃO OKUTELEKA",
                    style: TextStyle(
                      letterSpacing: 6.4,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
