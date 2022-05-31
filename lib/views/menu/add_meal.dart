import 'package:aula02/controllers/controller_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AddMeal extends StatelessWidget {
  AddMeal({Key? key}) : super(key: key);
  final dropValue = ValueNotifier("");
  final optionDrop = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12"
  ];
  Widget options(String txt) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 12),
      child: ValueListenableBuilder(
          valueListenable: dropValue,
          builder: (BuildContext context, String value, _) {
            return DropdownButton(
              hint: Text(txt),
              value: (value.isEmpty) ? null : value,
              onChanged: (escolha) => dropValue.value = escolha.toString(),
              items: optionDrop
                  .map(
                    (op) => DropdownMenuItem(
                      child: Text(op),
                      value: op,
                    ),
                  )
                  .toList(),
            );
          }),
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
      leading: IconButton(
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios_new_outlined),
      ),
      title: ListTile(
        title: Text(
          "Adicionar receita",
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
    );
    var size = MediaQuery.of(context).size;
    var sizeHeight = (size.height - appBar.preferredSize.height) -
        MediaQuery.of(context).padding.top;
    return Scaffold(
      appBar: appBar,
      body: SizedBox(
        width: double.infinity,
        height: sizeHeight,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Container(
                        width: size.width * .5,
                        height: size.height * .25,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          image: DecorationImage(
                            image: AssetImage(
                              "assets/images/fundo.jpg",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.orange,
                        radius: 30,
                        child: IconButton(
                          hoverColor: Colors.orange,
                          onPressed: () {},
                          icon: const Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 12),
                  //color: Colors.amber,
                  height: sizeHeight * .66,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Form(
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 12,
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .7,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          hintStyle: TextStyle(
                                              color:
                                                  ControllerTheme.istance.opcao
                                                      ? Colors.white
                                                      : Colors.black),
                                          prefixIcon: const Icon(
                                            Icons.person_outline_outlined,
                                            color: Colors.orange,
                                          ),
                                          hintText:
                                              "Seu primeiro e ultimo nome"),
                                    ),
                                  ),
                                  options("Pessoas"),
                                ],
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: size.width * .7,
                                    child: TextFormField(
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(
                                            color: ControllerTheme.istance.opcao
                                                ? Colors.white
                                                : Colors.black),
                                        prefixIcon: const Icon(
                                          Icons.dinner_dining_sharp,
                                          color: Colors.orange,
                                        ),
                                        hintText: "Nome do prato",
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 0.0),
                                    child: options("Tempo"),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                // maxLength: 18,
                                minLines: 4,
                                maxLines: 12,

                                expands: false,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.description_outlined,
                                    color: Colors.orange,
                                  ),
                                  label: const Text("Informe os Ingredientes"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              TextFormField(
                                // maxLength: 18,
                                minLines: 4,
                                maxLines: 12,

                                expands: false,
                                decoration: InputDecoration(
                                  suffixIcon: const Icon(
                                    Icons.description_outlined,
                                    color: Colors.orange,
                                  ),
                                  label:
                                      const Text("Informe o Modo de Preparo"),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6)),
                                ),
                              ),
                              const SizedBox(
                                height: 8,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    width: 200,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Cadastrar Agora",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "Limpar",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),

      /*
      Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(80),
                  ),
                ),
                height: 150,
                width: 150,
                child: const Icon(
                  Icons.add,
                  size: 50,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(
                right: 10.0,
                top: 30,
                left: 10,
                bottom: 10,
              ),
              child: Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Text(
                  "Nome do Prato",
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            const Card(
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                    label: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "adiciona o nome do prato",
                    style: TextStyle(color: Colors.black45),
                  ),
                )),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                right: 10.0,
                top: 30,
                left: 10,
                bottom: 10,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: 8.0,
                ),
                child: Row(
                  children: [
                    Text(
                      "Titulo do Prato",
                      style: TextStyle(
                        color: Colors.black45,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 300,
                  child: const TextField(
                    decoration: InputDecoration(
                        label: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Adiciona o titulo do prato",
                        style: TextStyle(color: Colors.black45),
                      ),
                    )),
                  ),
                ),
                Container(
                  width: 50,
                  height: 50,
                  child: const Icon(
                    Icons.arrow_drop_down_sharp,
                    size: 50,
                    color: Colors.orange,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 140,
                  child: const TextField(
                    decoration: InputDecoration(
                        label: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "lista de igredientes",
                        style: TextStyle(color: Colors.black45),
                      ),
                    )),
                  ),
                ),
                Container(
                  width: 220,
                  child: const TextField(
                    decoration: InputDecoration(
                        label: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Descriçáo do prato",
                        style: TextStyle(color: Colors.black45),
                      ),
                    )),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            const Card(
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                    hintMaxLines: 10,
                    label: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        "Modo de preparo",
                        style: TextStyle(color: Colors.black45),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),*/
    );
  }
}
