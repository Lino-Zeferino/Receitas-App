import 'package:flutter/cupertino.dart';

class DictionapryModel with ChangeNotifier {
  final String id;
  final String title;
  final String nutrient;
  final String function;
  final String recommendation;
  final String image;
  bool isFavorite;
  DictionapryModel({
    required this.id,
    required this.title,
    required this.nutrient,
    required this.function,
    required this.recommendation,
    required this.image,
    this.isFavorite = false,
  });
  void changeFavorite() {
    isFavorite = !isFavorite;
    notifyListeners();
  }
}
