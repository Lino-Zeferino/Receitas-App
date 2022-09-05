// ignore_for_file: unused_local_variable

import 'package:aula02/components/sweet_page_item.dart';
import 'package:aula02/controllers/controller_sweet_provider.dart';
import 'package:aula02/controllers/controller_theme.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'app_drawe.dart';
import 'dictionary_page.dart';
import 'drinkPage.dart';
import 'home_page.dart';
import 'menu/add_meal.dart';

class SweetPage extends StatefulWidget {
  const SweetPage({Key? key}) : super(key: key);

  @override
  State<SweetPage> createState() => _SweetPageState();
}

class _SweetPageState extends State<SweetPage> {
  bool _showFavoriteOnly = false;
  final controller = TextEditingController();
  void restartAll(ControllerSweet provider) {
    setState(() {
      provider.restart();
      controller.text = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    final sweetProvier = Provider.of<ControllerSweet>(context, listen: true);
    final sweet =
        _showFavoriteOnly ? sweetProvier.favoriteItem : sweetProvier.items;

    var size = MediaQuery.of(context).size;

    var appBar = AppBar(
      title: ListTile(
        leading: const Icon(
          Icons.location_pin,
          color: Colors.orange,
        ),
        title: Text(
          "Doces",
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
    var sizeHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      drawer: const AppDrawe(),
      appBar: appBar,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin:
                const EdgeInsets.only(top: 16, left: 8, right: 8, bottom: 8),
            padding: const EdgeInsets.only(top: 6, left: 18, bottom: 5),
            height: 50,
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
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: "Com o que vai se deliciar hoje ?",
                filled: false,
                border: InputBorder.none,
                suffixIcon: IconButton(
                  alignment: Alignment.topCenter,
                  onPressed: () {
                    sweetProvier.verificar(controller.text)
                        ? null
                        : restartAll(sweetProvier);
                  },
                  icon: sweetProvier.verificar(controller.text)
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
                sweetProvier.verificar(controller.text)
                    ? sweetProvier.restart()
                    : sweetProvier.searchSweet(value);
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 12.0, top: 8, bottom: 8),
            child: Text(
              "Lista de doces",
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
              itemCount: sweet.length,
              itemBuilder: (_, i) {
                return ChangeNotifierProvider.value(
                    value: sweet[i], child: const SweetPageItem());
              },
            ),
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
              icon: const Icon(
                Icons.cake_outlined,
                size: 24,
                color: Colors.orange,
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
              icon: Icon(
                Icons.menu_book_outlined,
                size: 20,
                color:
                    ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
