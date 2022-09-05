import 'package:aula02/data/dummy_data.dart';
import 'package:aula02/models/meal_country_model.dart';
import 'package:flutter/material.dart';

class ControllerCoutry with ChangeNotifier {
  final List<CountryModel> _items = DUMMY_COUNTRY;

  List<CountryModel> get items => [..._items];
}
