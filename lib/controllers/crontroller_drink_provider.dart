import 'package:aula02/data/dummy_drink_data.dart';

import 'package:aula02/models/drink_model.dart';

import 'package:flutter/foundation.dart';

class ControllerDrink with ChangeNotifier {
  final List<DrinkModel> _items = DUMMY_DRINK;

  List<DrinkModel> get items => [..._items];

  void addMeal(DrinkModel drink) {
    _items.add(drink);
    notifyListeners();
  }
}
