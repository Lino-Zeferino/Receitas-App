import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/views/drinkPage.dart';
import 'package:aula02/views/home_page.dart';
import 'package:aula02/views/sweet_page.dart';
import 'package:flutter/material.dart';

class DictionaryPage extends StatelessWidget {
  const DictionaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text("ola Bebidas"),
      ),
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
              icon: Icon(
                Icons.home_outlined,
                color:
                    ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const SweetPage();
                }));
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
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const DrinkPage();
                }));
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
                Navigator.push(context, MaterialPageRoute(builder: (_) {
                  return const DictionaryPage();
                }));
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
