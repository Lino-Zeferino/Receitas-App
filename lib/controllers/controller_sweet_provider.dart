import 'package:aula02/data/dummy_sweet_data.dart';
import 'package:aula02/models/sweet_model.dart';
import 'package:flutter/foundation.dart';

class ControllerSweet with ChangeNotifier {
  List<SweetModel> _items = DUMMY_SWEET;

  List<SweetModel> get items => [..._items];

  List<SweetModel> get favoriteItem =>
      items.where((element) => element.isFavorite).toList();

  void addMeal(SweetModel meal) {
    _items.add(meal);
    notifyListeners();
  }

  void searchSweet(String query) {
    final suggestions = _items.where((sweet) {
      final sweetTitle = sweet.title.toLowerCase();
      final input = query.toLowerCase();
      return sweetTitle.contains(input);
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
    _items = DUMMY_SWEET;
    notifyListeners();
  }
}
