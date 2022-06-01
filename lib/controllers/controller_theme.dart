import 'package:flutter/foundation.dart';

class ControllerTheme with ChangeNotifier {
  static ControllerTheme istance = ControllerTheme();
  bool opcao = false;
  bool statePassword = false;
  chengeTheme() {
    opcao = !opcao;
    notifyListeners();
  }
}
