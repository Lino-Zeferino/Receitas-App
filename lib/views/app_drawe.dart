import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/views/menu/about_dev.dart';
import 'package:aula02/views/menu/add_meal.dart';
import 'package:aula02/views/menu/app_rules.dart';

import 'package:flutter/material.dart';

class AppDrawe extends StatelessWidget {
  const AppDrawe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(top: 18.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const AboutDev();
                    }),
                  );
                },
                splashColor: Colors.orange,
                child: Container(
                  color: Colors.black54,
                  width: double.infinity,
                  height: size.height * .2,
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      children: [
                        Container(
                          width: 80,
                          height: 80,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/lino.jpg",
                                ),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "Lino C. Zeferino",
                                style: TextStyle(
                                  fontSize: 24,
                                ),
                              ),
                              Text(
                                "\tSobre o Desenvolvidor",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white60,
                                ),
                              ),
                              Text(
                                "\t\tCliqui aqui para saber mais... ",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white60,
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
              const Divider(
                // height: 24,
                thickness: 2,
              ),
              ListTile(
                onTap: () {
                  ControllerTheme.istance.chengeTheme();
                },
                leading: const Icon(
                  Icons.dark_mode,
                  size: 28,
                ),
                title: const Text(
                  "Modo Escuro",
                  style: TextStyle(fontSize: 18),
                ),
                trailing: Switch(
                    value: ControllerTheme.istance.opcao,
                    onChanged: (value) {
                      ControllerTheme.istance.chengeTheme();
                    }),
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return AddMeal();
                  }));
                },
                leading: CircleAvatar(
                  backgroundColor: Colors.grey.withOpacity(0.8),
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
                title: const Text(
                  "Contribuir",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: const Text("Adiciona aqui a sua receita"),
              ),
              const Divider(
                thickness: 2,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.settings,
                  size: 28,
                ),
                title: const Text(
                  "Configurações",
                  style: TextStyle(fontSize: 18),
                ),
                subtitle: const Text(
                    "Configure o aplicativo de acordo a sua preferência"),
              ),
              const Divider(
                // height: 24,
                thickness: 1,
              ),
              ListTile(
                onTap: () {},
                leading: const Icon(
                  Icons.share,
                  size: 28,
                ),
                title: const Text(
                  "Partilhar o aplicativo",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Divider(
                // height: 24,
                thickness: 2,
              ),
              ListTile(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return const AppRules();
                    }),
                  );
                },
                leading: const Icon(
                  Icons.block_sharp,
                  size: 28,
                ),
                title: const Text(
                  "Regras do app",
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Divider(
                // height: 24,
                thickness: 0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
