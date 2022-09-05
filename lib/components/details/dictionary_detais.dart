import 'package:aula02/models/dictionary_model.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'description_dictionary_item.dart';

class DictionaryDetais extends StatelessWidget {
  const DictionaryDetais({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final item = Provider.of<DictionapryModel>(context);
    return InkWell(
      borderRadius: BorderRadius.circular(20),
      splashColor: Colors.black38,
      onTap: () {
        Navigator.push(
          context,
          PageTransition(
            child: ChangeNotifierProvider.value(
              value: item,
              child: const DescriptionDiripctionary(),
            ),
            type: PageTransitionType.scale,
            curve: Curves.bounceInOut,
            alignment: Alignment.center,
            duration: const Duration(seconds: 1),
            reverseDuration: const Duration(seconds: 1),
          ),
        );
      },
      child: Container(
          decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(20),
          ),
          margin: const EdgeInsets.all(10),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: MyCicloImage(
                  radius: 50,
                  url: item.image,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8, right: 2, bottom: 4),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: size.width * .56,
                        //color: Colors.blue,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: size.width * .42,
                              height: 40,
                              child: Text(
                                item.title,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 24, color: Colors.white),
                              ),
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white70,
                              child: IconButton(
                                onPressed: () {
                                  item.changeFavorite();
                                },
                                icon: item.isFavorite
                                    ? const Icon(
                                        Icons.favorite,
                                        color: Colors.orange,
                                      )
                                    : const Icon(
                                        Icons.favorite_border,
                                        color: Colors.orange,
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(bottom: 6.0),
                      child: Text(
                        "Componentes Nutritivos:",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      height: size.height * .08,
                      width: size.width * .56,
                      child: Text(
                        item.nutrient,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.fade,
                        style: const TextStyle(
                            color: Colors.black87, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }

  // ignore: non_constant_identifier_names
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
}
