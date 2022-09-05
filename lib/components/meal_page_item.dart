import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/models/meal_model.dart';
import 'package:aula02/views/revenue_page.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

class MealPageItem extends StatelessWidget {
  const MealPageItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MealModel meals = Provider.of<MealModel>(context);

    return Padding(
      padding: const EdgeInsets.all(6),
      child: Container(
        decoration: BoxDecoration(
          color: ControllerTheme.istance.opcao ? Colors.black : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.black,
              blurRadius: 3,
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: ChangeNotifierProvider.value(
                          value: meals,
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
                  child: MyRadiusImage(
                    largura: double.infinity,
                    comprimento: 125,
                    margin: 0.0,
                    url: meals.image,
                    circular: 20,
                  ),
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {
                      Share.share(
                          "Aprenda como Fazer: ${meals.title}\n\nDuração:${meals.duration}\nQuantidade:${meals.people}Pessoas\nPor: @Okuteleka\n\nIgrediente:\n${meals.ingredient}\n\nModo de preparo:\n${meals.preparation}\n\n Bom Apetiti");
                    },
                    icon: const Icon(
                      Icons.share,
                      size: 24,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListTile(
                dense: false,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 12.0),
                  child: Text(
                    meals.title,
                    style: TextStyle(
                      color: ControllerTheme.istance.opcao
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                    overflow: TextOverflow.clip,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {
                    meals.changeFavorite();
                  },
                  icon: meals.isFavorite
                      ? const Icon(
                          Icons.favorite,
                          color: Colors.orange,
                        )
                      : const Icon(
                          Icons.favorite_border,
                          color: Colors.orange,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

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
}
