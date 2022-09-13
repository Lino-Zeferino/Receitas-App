import 'dart:math';

import 'package:aula02/data/dummy_data.dart';
import 'package:aula02/models/meal_model.dart';
import 'package:flutter/material.dart';

class ControllerMeals with ChangeNotifier {
  List<MealModel> _items = DUMMY_MEALS;

  List<MealModel> get items {
    return [..._items];
  }

  // ignore: non_constant_identifier_names
  List<MealModel> FavoriteList() {
    List<MealModel> temp = [];
    for (int i = 0; i < items.length; i++) {
      if (items[i].isFavorite == true) {
        temp.add(items[i]);
      }
    }
    return temp;
  }

  void addMeal(MealModel meal) {
    _items.add(
      MealModel(
        id: Random().nextDouble().toString(),
        title: meal.title,
        country: meal.country,
        people: meal.people,
        duration: meal.duration,
        ingredient: meal.ingredient,
        preparation: meal.preparation,
        image: meal.url,
        by: meal.by,
      ),
    );
    notifyListeners();
  }

  void searchMeal(String query) {
    final suggestions = _items.where((meal) {
      final mealtTitle = meal.title.toLowerCase();
      final input = query.toLowerCase();
      return mealtTitle.contains(input);
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
    _items = DUMMY_MEALS;
    notifyListeners();
  }
}


















/*
 bool _showFavoriteOnly = false;
 
  void showFavoriteOnly() {
    _showFavoriteOnly = true;
    notifyListeners();
  }

  void showAll() {
    _showFavoriteOnly = false;
    notifyListeners();
  }
*/