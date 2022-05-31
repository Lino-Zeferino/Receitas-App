import 'package:aula02/models/meal_model.dart';

class MealcountryModel {
  final String country;
  final String description;
  final String image;
  final String imageCountry;
  final List<MealModel> meal;

  MealcountryModel({
    required this.country,
    required this.description,
    required this.image,
    required this.imageCountry,
    required this.meal,
  });
}
