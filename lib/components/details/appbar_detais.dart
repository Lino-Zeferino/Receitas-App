import 'package:aula02/controllers/controller_theme.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyappBar extends StatelessWidget {
  String title;
  MyappBar(this.title, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appBar = AppBar(
      title: ListTile(
        leading: const Icon(
          Icons.location_pin,
          color: Colors.orange,
        ),
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
    );
    var size = MediaQuery.of(context).size;
    // ignore: unused_local_variable
    var sizeHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return appBar;
  }
}
