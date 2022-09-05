class CountryModel {
  final String country;
  final String description;
  final String image;
  final String imageCountry;

  CountryModel({
    required this.country,
    required this.description,
    required this.image,
    required this.imageCountry,
  });
  /* List<MealModel> getMeal() {
    int k;
    List<MealModel> time = [];

    for (k = 0; k < meal.length; k++) {
      MealModel p = meal[k];
      time[k] = MealModel(
          id: p.id,
          title: p.title,
          country: p.country,
          people: p.people,
          duration: p.duration,
          ingredient: p.ingredient,
          preparation: p.preparation,
          image: p.image,
          by: p.by,
          isFavorite: p.isFavorite);
    }

    return time;
  } */
}
