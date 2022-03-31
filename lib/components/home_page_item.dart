// ignore_for_file: sized_box_for_whitespace, non_constant_identifier_names

import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/views/app_drawe.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomePageItem extends StatelessWidget {
  const HomePageItem({Key? key}) : super(key: key);
  Widget MyCicloImage({
    required double radius,
    required String url,
  }) {
    return CircleAvatar(
      backgroundColor: Colors.orange,
      radius: radius,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(
              url,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

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
        borderRadius: BorderRadius.circular(12),
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
    );
    var size = MediaQuery.of(context).size;
    var sizeHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      drawer: const AppDrawe(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: ListView(
          children: [
            Container(
              //padding: const EdgeInsets.only(top: 6, left: 18, bottom: 5),
              height: sizeHeight * 0.08,
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
              padding: EdgeInsets.only(top: 12.0, bottom: 8),
              child: Text(
                "Destaques",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 100,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 15,
                  itemBuilder: (context, i) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: MyCicloImage(
                              radius: 30,
                              url: "assets/images/tipicoAngola2.jpg",
                            )),
                        const SizedBox(
                          height: 2,
                        ),
                        const Text(
                          "title",
                          style: TextStyle(
                            fontSize: 14,
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              height: 230,
              //color: Colors.amber,
              child: ListView.builder(
                  reverse: true,
                  // shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: 5,
                  itemBuilder: (_, i) {
                    return Stack(children: [
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.black45,
                        child: MyRadiusImage(
                          circular: 12,
                          comprimento: 230,
                          largura: size.width * .52,
                          margin: 8,
                          url: "assets/images/fundo.jpg",
                        ),
                      ),
                      Container(
                        width: size.width * .52,
                        //color: Colors.amber,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              child: MyRadiusImage(
                                largura: 30,
                                comprimento: 30,
                                margin: 0.0,
                                url: "assets/images/angola.png",
                                circular: 12,
                              ),
                            ),
                            Container(
                              alignment: Alignment.topLeft,
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(.8),
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(12),
                                  bottomRight: Radius.circular(12),
                                ),
                              ),
                              width: size.width * .52,
                              height: size.height * .10,
                              child: ListTile(
                                title: const Text(
                                  "Angola",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                subtitle: const Text(
                                  "Vê as adversidades de receitas de Angola",
                                  style: TextStyle(
                                    color: Colors.white70,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                                trailing: IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.favorite_border,
                                      color: Colors.orange,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ]);
                  }),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 12, bottom: 8),
              child: Text(
                "Doces e Bebidas Destacadas",
                style: TextStyle(
                  fontSize: 16,
                  // fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 200,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 4,
                  itemBuilder: (_, i) {
                    return Stack(children: [
                      InkWell(
                        onTap: () {},
                        splashColor: Colors.black26,
                        child: Container(
                          width: size.width,
                          height: 180,
                          margin: const EdgeInsets.only(right: 8),
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black45,
                                blurRadius: 3,
                              ),
                            ],
                            borderRadius: BorderRadius.circular(12),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/tipicoAngola2.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ]);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * 
 *  Container(
                        alignment: Alignment.topCenter,
                        margin: const EdgeInsets.only(top: 150),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.8),
                          borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(12),
                            bottomRight: Radius.circular(12),
                          ),
                        ),
                        width: size.width * .52,
                        height: 80,
                        child: ListTile(
                          title: const Text(
                            "Angola",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          subtitle: const Text(
                            "Vê as adversidades de receitas de Angola",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 12,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.favorite_border,
                                color: Colors.orange,
                              )),
                        ),
                      ),
 */
