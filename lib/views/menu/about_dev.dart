import 'package:aula02/components/about_dev_item1.dart';
import 'package:aula02/components/about_dev_item2.dart';
import 'package:flutter/material.dart';

class AboutDev extends StatelessWidget {
  const AboutDev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        height: size.height,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.only(top: 18),
              color: Colors.black54,
              width: double.infinity,
              height: size.height * .18,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
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
                          Center(
                            child: Text(
                              "Lino C. Zeferino",
                              style: TextStyle(
                                  fontSize: 18,
                                  wordSpacing: 8,
                                  color: Colors.white),
                            ),
                          ),
                          Center(
                            child: Text(
                              "\tMOBILE AND WEB DEVELOPED",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.white60,
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white10,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * .82,
              child: SingleChildScrollView(
                child: Row(
                  children: const [
                    AboutDevItem1(),
                    AboutDevItem2(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
