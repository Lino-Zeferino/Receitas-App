import 'package:flutter/material.dart';

// ignore: camel_case_types
class AboutDevItem1 extends StatelessWidget {
  const AboutDevItem1({Key? key}) : super(key: key);
  Widget informacoes(String txt1, String txt2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          txt1,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
        Text(
          txt2,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }

  Widget myTitle(String title) {
    return Container(
      height: 20,
      color: Colors.orange,
      child: Center(
        child: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.w700,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  Widget habilidades(String txt, double porcento, var size) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 1),
          width: size.width * .12,
          // color: Colors.blue,
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Container(
          width: size.width * .3,
          color: Colors.blue,
          child: Stack(
            children: [
              Container(
                width: size.width * .30,
                height: 8,
                color: Colors.white,
              ),
              Container(
                width: size.width * porcento,
                height: 8,
                color: Colors.orange,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget contact(String txt, String txt2, var size) {
    return Row(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 5),
          width: size.width * .12,
          // color: Colors.blue,
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        SizedBox(
          width: size.width * .28,
          child: Text(
            txt2,
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .45,
      height: size.height * .8,
      color: Colors.black54,
      child: Column(
        children: [
          const SizedBox(
            height: 12,
          ),
          myTitle("INFORMAÕES PESSOAIS"),
          const SizedBox(
            height: 12,
          ),
          informacoes("Data Nascimento", "22/03/2000"),
          const SizedBox(
            height: 8,
          ),
          informacoes("Nacionalidade", "Angolana"),
          const SizedBox(
            height: 8,
          ),
          informacoes("Cidade Actual", "Luanda"),
          const SizedBox(
            height: 8,
          ),
          informacoes("Municipio actual", "Viana"),
          const SizedBox(
            height: 20,
          ),
          const Divider(
            height: 20,
            color: Colors.orange,
          ),
          myTitle("HABILIDADES"),
          const SizedBox(
            height: 8,
          ),
          habilidades("Dart", .25, size),
          const SizedBox(
            height: 8,
          ),
          habilidades("Flutter", .17, size),
          const SizedBox(
            height: 8,
          ),
          habilidades("JAVA", .13, size),
          const SizedBox(
            height: 8,
          ),
          habilidades("HTML5", .15, size),
          const SizedBox(
            height: 8,
          ),
          habilidades("CSS3", .15, size),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            height: 20,
            color: Colors.orange,
          ),
          myTitle("CONTACTOS"),
          const SizedBox(
            height: 8,
          ),
          contact("Tel1:", "925395928", size),
          const SizedBox(
            height: 8,
          ),
          contact("Tel2:", "952455184", size),
          const SizedBox(
            height: 8,
          ),
          contact("Fb:", "Lino C Zeferino", size),
          const SizedBox(
            height: 8,
          ),
          const SizedBox(
            height: 8,
          ),
          contact("linkedin:", "Lino Zeferino", size),
          const SizedBox(
            height: 8,
          ),
          const Divider(
            height: 20,
            color: Colors.orange,
          ),
          myTitle("IDIOMAS"),
          const SizedBox(
            height: 8,
          ),
          habilidades("Português", .28, size),
          const SizedBox(
            height: 8,
          ),
          habilidades("INGLÊS", .12, size),
        ],
      ),
    );
  }
}
