import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/models/meal_country_model.dart';
import 'package:aula02/views/revenue_page.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MealsItem extends StatelessWidget {
  final MealcountryModel meals;
  MealsItem(this.meals, {Key? key}) : super(key: key);
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

  var appBar = AppBar();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizeHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return SizedBox(
      width: double.infinity,
      height: sizeHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 12.0, top: 8, bottom: 8),
            child: Text(
              "Lista de refeições",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 0,
                mainAxisSpacing: 16,
              ),
              primary: false,
              shrinkWrap: true,
              itemCount: meals.meal.length,
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: ControllerTheme.istance.opcao
                          ? Colors.black
                          : Colors.white,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 3,
                        )
                      ],
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        Stack(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return RevenuePage(meals.meal[i]);
                                }));
                              },
                              child: MyRadiusImage(
                                largura: double.infinity,
                                comprimento: size.height * .16,
                                margin: 0.0,
                                url: meals.meal[i].image,
                                circular: 20,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              child: IconButton(
                                onPressed: () {},
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
                            title: Text(
                              meals.meal[i].title,
                              style: TextStyle(
                                  color: ControllerTheme.istance.opcao
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            subtitle: Text(
                              meals.meal[i].description,
                              style:
                                  const TextStyle(fontWeight: FontWeight.w600),
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
