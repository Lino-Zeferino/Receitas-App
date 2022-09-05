import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/views/menu/add_off.dart';
import 'package:flutter/material.dart';

class AboutDevItem2 extends StatelessWidget {
  const AboutDevItem2({Key? key}) : super(key: key);

  // ignore: non_constant_identifier_names
  Widget MyTitle(String title) {
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

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width * .5,
      height: size.height * .8,
      // color: Colors.white,
      margin: const EdgeInsets.all(8),
      child: Column(
        children: [
          //const SizedBox(height: 8),
          MyTitle("PERFIL PROFISSIONAL"),
          const SizedBox(height: 4),
          Text(
            "Bom Relacionamento interpessoal, desposição de agir em trabalhor, em equipe ou individual, facilidade de comunicação e aprendizagem, responsabilidade, organização, criatividade e dedicação.",
            style: TextStyle(
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black87,
              fontSize: 12,
            ),
            textAlign: TextAlign.justify,
          ),
          const Divider(
            height: 12,
            color: Colors.orange,
          ),
          MyTitle("FORMAÇÃO"),
          const SizedBox(height: 4),
          Text(
            "UNIVERSIDADE AGOSTINHO NETO",
            style: TextStyle(
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          Text(
            "Estudadente de CIÊNCIAS DA COMPUTAÇÃO(FCUAN) desde o Ano de 2020 até a data presente.",
            style: TextStyle(
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black87,
              fontSize: 12,
            ),
            textAlign: TextAlign.justify,
          ),
          const Divider(
            height: 12,
            color: Colors.orange,
          ),
          MyTitle("EXPERIÊNCIA"),
          const SizedBox(height: 4),
          Text(
            "Formador",
            style: TextStyle(
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          Text(
            "1-Trabalhei como formador de Informática da óptica do Utilidador por cerca de 3 anos(2016-2019).\n2-Trabalhei como formador de Lógica De Programação(C, JAVA)  por cerca de 1 anos(2019-2020).",
            style: TextStyle(
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black87,
              fontSize: 12,
            ),
            textAlign: TextAlign.justify,
          ),
          Text(
            "PROJECTOS",
            style: TextStyle(
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          Text(
            "1-Conversor de bases(Binária, Octal, Decimal, HexDecimal e de Unidades de Medias de Informação).\n2-APP de agenda e despesas Pessoais\n3-Clonagem do Multicaixa Express\n4-Loja Virtual\n5-Participei num projecto de Achados e Perdidos, que foi feito em equipe como Front-end...",
            style: TextStyle(
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black87,
              fontSize: 12,
            ),
            textAlign: TextAlign.justify,
          ),
          const Divider(
            height: 12,
            color: Colors.orange,
          ),
          InkWell(
            onLongPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const AddMealOff(),
                  ));
            },
            child: MyTitle("OBJETIVO"),
          ),
          const SizedBox(height: 4),
          Text(
            "Sou um Dev Mobile presistente e altamente dedicado.\nProcurando uma posição nas áreas de Desenvolvidor de Aplicações Mobile(Flutter), para poder dar o meu contributo para o desenvolvimento das TICs .",
            style: TextStyle(
              color:
                  ControllerTheme.istance.opcao ? Colors.white : Colors.black87,
              fontSize: 12,
            ),
            textAlign: TextAlign.justify,
          ),
        ],
      ),
    );
  }
}
