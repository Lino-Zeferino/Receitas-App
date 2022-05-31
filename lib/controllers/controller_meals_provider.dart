import 'package:aula02/data/dummy_data.dart';
import 'package:aula02/models/meal_country_model.dart';
import 'package:flutter/material.dart';

class ControllerMeals with ChangeNotifier {
  final List<MealcountryModel> _items = DUMMY_MEALS;

  List<MealcountryModel> get items => [..._items];

  void addMeal(MealcountryModel meal) {
    _items.add(meal);
    notifyListeners();
  }
}
