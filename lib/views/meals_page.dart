// ignore_for_file: non_constant_identifier_names, duplicate_ignore

import 'package:aula02/components/meal_page_item.dart';
import 'package:aula02/controllers/controller_meals_provider.dart';
import 'package:aula02/controllers/controller_theme.dart';

import 'package:aula02/models/meal_country_model.dart';
import 'package:aula02/models/meal_model.dart';

//import 'package:aula02/controllers/controller_theme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class MealsPage extends StatefulWidget {
  const MealsPage({Key? key}) : super(key: key);

  @override
  State<MealsPage> createState() => _MealsPageState();
}

class _MealsPageState extends State<MealsPage> {
  // ignore: non_constant_identifier_names
  var appBar = AppBar();
  bool _showFavoriteOnly = false;
  final controller = TextEditingController();
  void restartAll(ControllerMeals provider) {
    provider.restart();
    controller.text = "";
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var sizeHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;

    final country = ModalRoute.of(context)?.settings.arguments as CountryModel;
    ControllerMeals countryMeals = Provider.of<ControllerMeals>(context);
    final meals = _showFavoriteOnly
        ? countryMeals.FavoriteList()
            .where(
              (el) => el.country.contains(country.country),
            )
            .toList()
        : countryMeals.items
            .where(
              (el) => el.country.contains(country.country),
            )
            .toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              PopupMenuButton(
                icon: const Icon(Icons.more_vert),
                onSelected: (int selectValue) {
                  setState(() {
                    if (selectValue == 0) {
                      _showFavoriteOnly = true;
                    } else {
                      _showFavoriteOnly = false;
                    }
                  });
                },
                itemBuilder: (_) => [
                  const PopupMenuItem(
                    child: Text("Somente favoritos"),
                    value: 0,
                  ),
                  const PopupMenuItem(
                    child: Text("Todos"),
                    value: 1,
                  ),
                ],
              )
            ],
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
                "Receitas de ${country.country}",
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              background: Image.asset(
                country.image,
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 200,
          ),
          newSection(sizeHeight, meals, context, countryMeals),
        ],
      ),
    );
  }

  Widget newSection(double sizeHeight, List<MealModel> meals,
      BuildContext context, ControllerMeals Mealprovider) {
    return SliverToBoxAdapter(
      child: SizedBox(
        width: double.infinity,
        height: sizeHeight,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8, bottom: 8, top: 12),
              child: Container(
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
                  color: ControllerTheme.istance.opcao
                      ? Colors.black
                      : Colors.white,
                ),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                    hintText: "Com o que vai se deliciar hoje ?",
                    filled: false,
                    border: InputBorder.none,
                    suffixIcon: IconButton(
                      alignment: Alignment.topCenter,
                      onPressed: () {
                        Mealprovider.verificar(controller.text)
                            ? null
                            : restartAll(Mealprovider);
                      },
                      icon: Mealprovider.verificar(controller.text)
                          ? Icon(
                              Icons.clear_rounded,
                              color: ControllerTheme.istance.opcao
                                  ? Colors.black
                                  : Colors.white,
                            )
                          : const Icon(Icons.clear_rounded),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.orange,
                    ),
                  ),
                  onChanged: (value) {
                    Mealprovider.verificar(value)
                        ? Mealprovider.restart()
                        : Mealprovider.searchMeal(value);
                  },
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
                  itemCount: meals.length,
                  itemBuilder: (_, i) {
                    return ChangeNotifierProvider.value(
                      value: meals[i],
                      child: const MealPageItem(),
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}
