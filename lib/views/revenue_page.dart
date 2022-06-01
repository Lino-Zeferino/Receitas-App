import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RevenuePage extends StatelessWidget {
  final MealModel meal;
  // ignore: use_key_in_widget_constructors
  const RevenuePage(this.meal);

  Widget component(Icon ic, String text) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      width: 110,
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
                  //color: Colors.amber,
                  elevation: 2.8,
                  shadowColor: Colors.black,
                  child: SizedBox(
                    height: size.height * .65,
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * .09,
                        ),
                        Text(
                          meal.title,
                          style: TextStyle(
                            color: ControllerTheme.istance.opcao
                                ? Colors.white
                                : Colors.black,
                            fontSize: 24,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        SizedBox(
                          height: size.height * .01,
                        ),
                        SizedBox(
                          height: size.height * .47,
                          child: ListView(
                            children: [
                              Row(
                                children: [
                                  component(
                                      const Icon(Icons.watch_later_outlined),
                                      meal.duration),
                                  component(const Icon(Icons.people_outline),
                                      meal.people),
                                  SizedBox(
                                    width: size.width * .04,
                                  ),
                                  Text(
                                    "Por: ",
                                    style: TextStyle(
                                      color: ControllerTheme.istance.opcao
                                          ? Colors.white70
                                          : Colors.black54,
                                      fontSize: 14,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 88,
                                    child: Text(
                                      meal.by,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        color: ControllerTheme.istance.opcao
                                            ? Colors.white70
                                            : Colors.black54,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: size.height * .02,
                              ),
                              const Text(
                                "\t\tIngredientes:",
                                style: TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                              ),
                              Card(
                                elevation: 2,
                                child: SizedBox(
                                  width: double.infinity,
                                  height: size.height * .15,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        meal.ingredient,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .01,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  "\tModo de Preparo:",
                                  style: TextStyle(
                                    color: Colors.orange,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              Card(
                                elevation: 0,
                                child: SizedBox(
                                  height: size.height * .19,
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.all(4.0),
                                      child: Text(
                                        meal.preparation,
                                        style: const TextStyle(
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
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
                padding: const EdgeInsets.only(top: 30.0, left: 55),
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
                          meal.image,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
              Row(
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
                    onPressed: () {},
                    icon: const Icon(Icons.share),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    ),
                  )
                ],
              )
            ],
          )),
    );
  }
}
