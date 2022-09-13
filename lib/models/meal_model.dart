// ignore: camel_case_types
import 'package:flutter/cupertino.dart';

class MealModel with ChangeNotifier {
  final String id;
  final String title;
  final String country;
  final String ingredient;
  final String preparation;
  final String duration;
  final String people;
  final String by;
  final String image;
  final String url;
  bool isFavorite;

  MealModel({
    this.id = "",
    required this.title,
    required this.country,
    required this.people,
    required this.duration,
    required this.ingredient,
    required this.preparation,
    this.image = "",
    required this.by,
    this.url = "",
    this.isFavorite = false,
  });

  void changeFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }

  bool urlIsEmpty(String url) {
    if (url == "") {
      return true;
    }
    return false;
  }
}
