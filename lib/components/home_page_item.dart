// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names
import 'package:aula02/components/details/contry_detais.dart';
import 'package:aula02/controllers/controller_country_provider.dart';
import 'package:aula02/controllers/controller_meals_provider.dart';
import 'package:aula02/controllers/controller_sweet_provider.dart';
import 'package:aula02/views/revenue_page.dart';
import 'package:aula02/views/revenue_sweet_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class HomePageItem extends StatelessWidget {
  final double sizeHeight;
  // ignore: prefer_typing_uninitialized_variables
  final size;
  const HomePageItem(this.sizeHeight, this.size, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /* Trasendo a Lista de Dados proveniente do providercontroller */
    final countryProvier =
        Provider.of<ControllerCoutry>(context, listen: false);
    final country = countryProvier.items;

    final sweetProvier = Provider.of<ControllerSweet>(context);
    final mealsFavorite = Provider.of<ControllerMeals>(context).FavoriteList();

    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 12.0, bottom: 8),
            child: Text(
              "Destaques",
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: mealsFavorite.length,
                itemBuilder: (context, i) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            PageTransition(
                              child: ChangeNotifierProvider.value(
                                value: mealsFavorite[i],
                                child: const RevenuePage(),
                              ),
                              type: PageTransitionType.scale,
                              curve: Curves.bounceInOut,
                              alignment: Alignment.center,
                              duration: const Duration(seconds: 1),
                              reverseDuration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: MyCicloImage(
                              radius: 30, url: mealsFavorite[i].image),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Container(
                        width: 80,
                        //color: Colors.amber,
                        margin: const EdgeInsets.all(2),
                        child: Text(
                          mealsFavorite[i].title,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  );
                }),
          ),
          Container(
            width: double.infinity,
            height: 230,
            //color: Colors.amber,
            child: ListView.builder(
                reverse: true,
                // shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: country.length,
                itemBuilder: (_, i) {
                  return ContryListDetais(country[i]);
                }),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 16,
            ),
            child: Text(
              "Doces Destacadas",
              style: TextStyle(
                fontSize: 16,
                // fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            width: double.infinity,
            height: 200,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: sweetProvier.favoriteItem.length,
                itemBuilder: (_, i) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          child: ChangeNotifierProvider.value(
                            value: sweetProvier.favoriteItem[i],
                            child: const RevenueSweetPage(),
                          ),
                          type: PageTransitionType.scale,
                          curve: Curves.bounceInOut,
                          alignment: Alignment.center,
                          duration: const Duration(seconds: 1),
                          reverseDuration: const Duration(seconds: 1),
                        ),
                      );
                    },
                    splashColor: Colors.black26,
                    child: Stack(
                        alignment: AlignmentDirectional.bottomCenter,
                        children: [
                          Container(
                            width: size.width,
                            height: 180,
                            margin: const EdgeInsets.only(right: 12),
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.black45,
                                  blurRadius: 3,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                image: AssetImage(
                                    sweetProvier.favoriteItem[i].image),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.only(bottom: 8),
                            height: 60,
                            width: size.width * .98,
                            decoration: BoxDecoration(
                              color: Colors.black45,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              sweetProvier.favoriteItem[i].title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ]),
                  );
                }),
          ),
        ],
      ),
    );
  }

  Widget MyCicloImage({
    required double radius,
    required String url,
  }) {
    return CircleAvatar(
      backgroundColor: Colors.orange,
      radius: radius,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              url,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
