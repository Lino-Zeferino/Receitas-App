// ignore: camel_case_types
class MealModel {
  final String id;
  final String title;
  final String country;
  final String description;
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
    required this.description,
    required this.ingredient,
    required this.preparation,
    required this.image,
    required this.by,
    required this.isFavorite,
  });
}
