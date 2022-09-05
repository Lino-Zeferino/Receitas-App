import 'package:aula02/data/dummy_dictionary_data.dart';
import 'package:aula02/models/dictionary_model.dart';
import 'package:flutter/material.dart';

class ControllerDictionary with ChangeNotifier {
  List<DictionapryModel> _items = DUMMY_DICTIONARY;

  List<DictionapryModel> get items => [..._items];
  List<DictionapryModel> get favoriteItems =>
      items.where((element) => element.isFavorite).toList();

  void searchDictionary(String query) {
    final suggestions = _items.where((dictionary) {
      final dictionaryTitle = dictionary.title.toLowerCase();
      final input = query.toLowerCase();
      return dictionaryTitle.contains(input);
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
    _items = DUMMY_DICTIONARY;
    notifyListeners();
  }
}
