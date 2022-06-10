import 'package:aula02/data/dummy_sweet_data.dart';
import 'package:aula02/models/sweet_model.dart';
import 'package:flutter/foundation.dart';

class ControllerSweet with ChangeNotifier {
  final List<SweetModel> _items = DUMMY_SWEET;

  List<SweetModel> get items => [..._items];

  List<SweetModel> listaFavorite() {
    List<SweetModel> temp = [];
    for (int i = 0; i < items.length; i++) {
      if (items[i].isFavorite == true) {
        temp.add(items[i]);
      }
    }
    return temp;
  }

  void addMeal(SweetModel meal) {
    _items.add(meal);
    notifyListeners();
  }
}
