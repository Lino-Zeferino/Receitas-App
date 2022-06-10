class DrinkModel {
  final String id;
  final String title;
  final String ingredient;
  final String preparation;
  final String duration;
  final String people;
  final String by;
  final String image;
  bool isFavorite;
  DrinkModel({
    required this.id,
    required this.title,
    required this.people,
    required this.duration,
    required this.ingredient,
    required this.preparation,
    required this.image,
    required this.by,
    required this.isFavorite,
  });
}
