// ignore_for_file: non_constant_identifier_names

import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/controllers/crontroller_drink_provider.dart';
import 'package:aula02/views/revenue_drink_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class DrinkPageItem extends StatelessWidget {
  const DrinkPageItem({Key? key}) : super(key: key);
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
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Theme.of(context).primaryColor,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.orange,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    var appBar = AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      title: ListTile(
        title: Text(
          "Bebidas",
          style: TextStyle(
            color: ControllerTheme.istance.opcao ? Colors.white : Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        subtitle: const Text(
          "Casa das receitas",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.grey,
            fontSize: 13,
          ),
        ),
      ),
      elevation: 0.0,
      backgroundColor:
          ControllerTheme.istance.opcao ? Colors.black12 : Colors.white,
    );
    final drinkProvider = Provider.of<ControllerDrink>(context);
    final drink = drinkProvider.items;
    var size = MediaQuery.of(context).size;
    var sizeHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        width: double.infinity,
        height: sizeHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin:
                  const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
              padding: const EdgeInsets.only(top: 6, left: 18, bottom: 5),
              height: sizeHeight * 0.06,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 2,
                  )
                ],
                borderRadius: const BorderRadius.all(
                  Radius.circular(30),
                ),
                color:
                    ControllerTheme.istance.opcao ? Colors.black : Colors.white,
              ),
              child: const TextField(
                decoration: InputDecoration(
                  hintText: "Com o que vai se deliciar hoje ?",
                  filled: false,
                  border: InputBorder.none,
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.orange,
                  ),
                ),
              ),
            ),
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
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 8,
                ),
                primary: false,
                shrinkWrap: true,
                itemCount: drink.length,
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.all(6),
                    child: Container(
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
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return RevenueDrinkPage(drink[i]);
                                  }));
                                },
                                child: MyRadiusImage(
                                  largura: double.infinity,
                                  comprimento: 125,
                                  margin: 0.0,
                                  url: drink[i].image,
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
                              title: Padding(
                                padding: const EdgeInsets.only(bottom: 12.0),
                                child: Text(
                                  drink[i].title,
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
      ),
    );
  }
}
