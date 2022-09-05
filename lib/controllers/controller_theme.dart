import 'package:flutter/foundation.dart';

class ControllerTheme with ChangeNotifier {
  static ControllerTheme istance = ControllerTheme();
  bool opcao = false;
  chengeTheme() {
    opcao = !opcao;
    notifyListeners();
  }
}
