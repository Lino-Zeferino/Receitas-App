import 'package:aula02/components/meals_item.dart';
import 'package:aula02/models/meal_country_model.dart';

//import 'package:aula02/controllers/controller_theme.dart';

import 'package:flutter/material.dart';

class MealsPage extends StatelessWidget {
  final MealcountryModel meals;
  const MealsPage(this.meals, {Key? key}) : super(key: key);
  // ignore: non_constant_identifier_names
  Widget MyRadiusImage({
    required double largura,
    required double comprimento,
    required double margin,
    required String url,
    required double circular,
  }) {
    return Container(
      width: largura,
      height: comprimento,
      margin: EdgeInsets.only(right: margin),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
        image: DecorationImage(
          image: AssetImage(
            url,
          ),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
            iconTheme: const IconThemeData(color: Colors.white),
            pinned: true,
            backgroundColor: Colors.orange,
            floating: true,
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                "Receitas de ${meals.country}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              background: Image.asset(
                meals.image,
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 200,
          ),
          newSection(),
        ],
      ),
    );
  }

  Widget newSection() {
    return SliverToBoxAdapter(
      child: MealsItem(meals),
    );
  }
}
