import 'package:aula02/data/dummy_drink_data.dart';

import 'package:aula02/models/drink_model.dart';

import 'package:flutter/foundation.dart';

class ControllerDrink with ChangeNotifier {
  List<DrinkModel> _items = DUMMY_DRINK;

  List<DrinkModel> get items => [..._items];

  List<DrinkModel> get favoriteItems =>
      items.where((element) => element.isFavorite).toList();

  void addMeal(DrinkModel drink) {
    _items.add(drink);
    notifyListeners();
  }

  void searchDrink(String query) {
    final suggestions = _items.where((drink) {
      final drinkTitle = drink.title.toLowerCase();
      final input = query.toLowerCase();
      return drinkTitle.contains(input);
    }).toList();
    _items = suggestions;
    notifyListeners();
  }

  bool verificar(query) {
    if (query == "") {
      return true;
    }
    return false;
  }

  void restart() {
    _items = DUMMY_DRINK;

    notifyListeners();
  }
}
