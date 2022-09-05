import 'package:aula02/components/home_page_item.dart';
import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/views/dictionary_page.dart';
import 'package:aula02/views/drinkPage.dart';
import 'package:aula02/views/menu/add_meal.dart';
import 'package:aula02/views/sweet_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:page_transition/page_transition.dart';

import 'app_drawe.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
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
          "Okuteleka",
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
            icon: const Icon(
              Icons.restart_alt,
              color: Colors.orange,
            ))
      ],
    );
    var size = MediaQuery.of(context).size;
    var sizeHeight = (size.height - appBar.preferredSize.height);
    MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      drawer: const AppDrawe(),
      body: HomePageItem(sizeHeight, size),
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
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.orange,
                size: 24,
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
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              icon: const Icon(
                Icons.cake_outlined,
                size: 20,
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
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              icon: const Icon(
                Icons.local_bar_outlined,
                size: 20,
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
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              icon: const Icon(
                Icons.menu_book_outlined,
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
