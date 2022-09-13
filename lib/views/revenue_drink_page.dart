import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/models/drink_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:share_plus/share_plus.dart';

// ignore: must_be_immutable
class RevenueDrinkPage extends StatelessWidget {
  const RevenueDrinkPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.orange,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    var size = MediaQuery.of(context).size;
    final DrinkModel drink = Provider.of<DrinkModel>(context);
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 24, left: 4, right: 4),
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 233.0),
              child: Card(
                elevation: 2.8,
                shadowColor: Colors.black,
                child: SizedBox(
                  height: size.height * .65,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * .1,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, bottom: 6),
                        child: Text(
                          drink.title,
                          style: TextStyle(
                            color: ControllerTheme.istance.opcao
                                ? Colors.white
                                : Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          component(const Icon(Icons.watch_later_outlined),
                              drink.duration, context),
                          component(const Icon(Icons.people_outline),
                              drink.people, context),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 12.0, top: 8, bottom: 8),
                        child: Text(
                          "Por: Okuteleka",
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: ControllerTheme.istance.opcao
                                ? Colors.white70
                                : Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          width: double.infinity,
                          child: ListView(
                            children: [
                              Mytitle("Ingrediente"),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0, top: 8, bottom: 12),
                                child: Text(
                                  drink.ingredient,
                                  style: TextStyle(
                                    color: ControllerTheme.istance.opcao
                                        ? Colors.white
                                        : Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                              Mytitle("Modo de preparo: "),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 8.0,
                                  top: 8,
                                  bottom: 70,
                                ),
                                child: Text(
                                  drink.preparation,
                                  style: TextStyle(
                                    color: ControllerTheme.istance.opcao
                                        ? Colors.white
                                        : Colors.black54,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: size.height * .3,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
                image: DecorationImage(
                  image: AssetImage(
                    "assets/images/fundo.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0, left: 50),
              child: CircleAvatar(
                backgroundColor: Colors.orange.shade100,
                radius: 140,
                child: Container(
                  width: size.width,
                  height: size.height,
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200),
                      topLeft: Radius.circular(200),
                      topRight: Radius.circular(200),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        drink.image,
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
                SizedBox(
                  width: size.width * .6,
                ),
                IconButton(
                  onPressed: () {
                    Share.share(
                        "Aprenda como Fazer: ${drink.title}\n\nDuração:${drink.duration}\nQuantidade:${drink.people}Pessoas\nPor: @Okuteleka\n\nIgrediente:\n${drink.ingredient}\n\nModo de preparo:\n${drink.preparation}\n\n Bom Apetiti");
                  },
                  icon: const Icon(Icons.share),
                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          drink.changeFavorite();
        },
        child: drink.isFavorite
            ? const Icon(
                Icons.favorite,
                color: Colors.orange,
              )
            : const Icon(
                Icons.favorite_border,
                color: Colors.orange,
              ),
      ),
    );
  }

  Widget component(Icon ic, String text, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      width: MediaQuery.of(context).size.height * .18,
      decoration: const BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ic,
          Text(
            text,
            style: const TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget Mytitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.orange,
          fontWeight: FontWeight.w500,
          fontSize: 18,
        ),
      ),
    );
  }
}
