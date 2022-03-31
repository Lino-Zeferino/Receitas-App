import 'package:aula02/components/home_page_item.dart';
import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/views/dictionary_page.dart';
import 'package:aula02/views/drinkPage.dart';
import 'package:aula02/views/sweet_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const HomePageItem(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () {},
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
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const HomePage();
                }));
              },
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.orange,
                size: 24,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const SweetPage();
                }));
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
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const DrinkPage();
                }));
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
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const DictionaryPage();
                }));
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
