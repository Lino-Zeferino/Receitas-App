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

  bool isFavorite;
  MealModel({
    required this.id,
    required this.title,
    required this.country,
    required this.people,
    required this.duration,
    required this.ingredient,
    required this.preparation,
    required this.image,
    required this.by,
    this.isFavorite = false,
  });

  void changeFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
