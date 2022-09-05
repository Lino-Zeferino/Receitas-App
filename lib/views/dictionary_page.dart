import 'package:aula02/components/details/dictionary_detais.dart';
import 'package:aula02/controllers/controller_dictionary_provider.dart';
import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/models/dictionary_model.dart';
import 'package:aula02/views/drinkPage.dart';
import 'package:aula02/views/home_page.dart';
import 'package:aula02/views/menu/add_meal.dart';
import 'package:aula02/views/sweet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'app_drawe.dart';

class DictionaryPage extends StatefulWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  State<DictionaryPage> createState() => _DictionaryPageState();
}

class _DictionaryPageState extends State<DictionaryPage> {
  bool _showFavoriteOnly = false;
  final controller = TextEditingController();
  void restartAll(ControllerDictionary provider) {
    provider.restart();
    controller.text = "";
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
      title: ListTile(
        leading: const Icon(
          Icons.location_pin,
          color: Colors.orange,
        ),
        title: Text(
          "Dicionário",
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
      leading: Builder(
        builder: (context) {
          return IconButton(
            icon: const Icon(
              Icons.format_indent_decrease_outlined,
              color: Colors.orange,
            ),
            onPressed: () => Scaffold.of(context).openDrawer(),
          );
        },
      ),
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
    );
    final itemProvider =
        Provider.of<ControllerDictionary>(context, listen: true);
    final List<DictionapryModel> item =
        _showFavoriteOnly ? itemProvider.favoriteItems : itemProvider.items;

    var size = MediaQuery.of(context).size;
    var sizeHeight = (size.height - appBar.preferredSize.height);
    MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      drawer: const AppDrawe(),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
                height: sizeHeight,
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          top: 16, left: 8, right: 8, bottom: 8),
                      padding:
                          const EdgeInsets.only(top: 6, left: 18, bottom: 5),
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
                              itemProvider.verificar(controller.text)
                                  ? null
                                  : restartAll(itemProvider);
                            },
                            icon: itemProvider.verificar(controller.text)
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
                          itemProvider.verificar(value)
                              ? itemProvider.restart()
                              : itemProvider.searchDictionary(value);
                        },
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerLeft,
                      height: sizeHeight * .03,
                      margin:
                          const EdgeInsets.only(top: 8, left: 16, bottom: 8),
                      child: const Text(
                        "Lista de Alimentos",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: sizeHeight * .75,
                      //color: Colors.blue,
                      child: ListView.builder(
                          itemCount: item.length,
                          itemBuilder: (context, i) {
                            return ChangeNotifierProvider.value(
                              value: item[i],
                              child: const DictionaryDetais(),
                            );
                          }),
                    ),
                  ],
                )),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {
          Navigator.push(
            context,
            PageTransition(
              child: const AddMeal(),
              type: PageTransitionType.scale,
              curve: Curves.bounceInOut,
              alignment: Alignment.center,
              duration: const Duration(seconds: 1),
              reverseDuration: const Duration(seconds: 1),
            ),
          );
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        //color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: const HomePage(),
                    type: PageTransitionType.scale,
                    curve: Curves.bounceInOut,
                    alignment: Alignment.center,
                    duration: const Duration(seconds: 1),
                    reverseDuration: const Duration(seconds: 1),
                  ),
                );
              },
              icon: Icon(
                Icons.home_outlined,
                color:
                    ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: const SweetPage(),
                    type: PageTransitionType.scale,
                    curve: Curves.bounceInOut,
                    alignment: Alignment.center,
                    duration: const Duration(seconds: 1),
                    reverseDuration: const Duration(seconds: 1),
                  ),
                );
              },
              icon: Icon(
                Icons.cake_outlined,
                size: 20,
                color:
                    ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              ),
            ),
            const SizedBox(
              width: 12,
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: const DrinkPage(),
                    type: PageTransitionType.scale,
                    curve: Curves.bounceInOut,
                    alignment: Alignment.center,
                    duration: const Duration(seconds: 1),
                    reverseDuration: const Duration(seconds: 1),
                  ),
                );
              },
              icon: Icon(
                Icons.local_bar_outlined,
                size: 20,
                color:
                    ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  PageTransition(
                    child: const DictionaryPage(),
                    type: PageTransitionType.scale,
                    curve: Curves.bounceInOut,
                    alignment: Alignment.center,
                    duration: const Duration(seconds: 1),
                    reverseDuration: const Duration(seconds: 1),
                  ),
                );
              },
              icon: const Icon(
                Icons.menu_book_outlined,
                size: 24,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
