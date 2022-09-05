import 'dart:io';
import 'dart:math';
import 'package:aula02/controllers/controller_theme.dart';
import 'package:aula02/models/meal_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class AddMealOff extends StatefulWidget {
  const AddMealOff({Key? key}) : super(key: key);

  @override
  State<AddMealOff> createState() => _AddMealOffState();
}

class _AddMealOffState extends State<AddMealOff> {
  final ControllerName = TextEditingController();
  final ControllerName2 = TextEditingController();
  final ControllerQt = TextEditingController();
  final ControllerTime = TextEditingController();
  final ControllerReceita = TextEditingController();
  final ControllerIngrediente = TextEditingController();

  final dropValue = ValueNotifier("");
  XFile? imageMeal;
  final _form = GlobalKey<FormState>();
  final _formData = Map<String, Object>();

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
                        decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(100)),
                          image: imageMeal != null
                              ? DecorationImage(
                                  image: FileImage(File(imageMeal!.path)),
                                  fit: BoxFit.cover,
                                )
                              : const DecorationImage(
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
                          onPressed: () {
                            selecionarImage();
                          },
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
                  height: sizeHeight * .66,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _form,
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
                                  controller: ControllerName,
                                  decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: ControllerTheme.istance.opcao
                                              ? Colors.white
                                              : Colors.black),
                                      prefixIcon: const Icon(
                                        Icons.person_outline_outlined,
                                        color: Colors.orange,
                                      ),
                                      hintText: "Seu primeiro e ultimo nome"),
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) =>
                                      _formData["yourName"] = value,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Informe o nome (campo obrigatório!)";
                                    }
                                    if (value!.trim().length < 3) {
                                      return "Nome deve ter mais de duas letras";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: TextFormField(
                                    controller: ControllerQt,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: ControllerTheme.istance.opcao
                                              ? Colors.white
                                              : Colors.black),
                                      hintText: "Pessoas",
                                    ),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) =>
                                        _formData["peaple"] = int.parse(value),
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "obrigatório!";
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: size.width * .7,
                                child: TextFormField(
                                  controller: ControllerName2,
                                  minLines: 1,
                                  maxLines: 1,
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
                                  textInputAction: TextInputAction.next,
                                  onChanged: (value) =>
                                      _formData["mealName"] = value,
                                  validator: (value) {
                                    if (value!.trim().isEmpty) {
                                      return "Informe o nome do Prato (campo obrigatório!)";
                                    }
                                    if (value!.trim().length < 3) {
                                      return "Nome deve ter mais de duas letras";
                                    }
                                    return null;
                                  },
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: TextFormField(
                                    controller: ControllerTime,
                                    decoration: InputDecoration(
                                      hintStyle: TextStyle(
                                          color: ControllerTheme.istance.opcao
                                              ? Colors.white
                                              : Colors.black),
                                      hintText: "Duração",
                                    ),
                                    textInputAction: TextInputAction.next,
                                    keyboardType: TextInputType.datetime,
                                    onChanged: (value) =>
                                        _formData["time"] = value,
                                    validator: (value) {
                                      if (value!.trim().isEmpty) {
                                        return "obrigatório!";
                                      }

                                      return null;
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: ControllerName2,
                            minLines: 1,
                            maxLines: 1,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                  color: ControllerTheme.istance.opcao
                                      ? Colors.white
                                      : Colors.black),
                              prefixIcon: const Icon(
                                Icons.dinner_dining_sharp,
                                color: Colors.orange,
                              ),
                              hintText: "Url da imagem",
                            ),
                            textInputAction: TextInputAction.next,
                            onChanged: (value) => _formData["url"] = value,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Informe a url da imagem(campo obrigatório!)";
                              }

                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: ControllerIngrediente,
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
                            textInputAction: TextInputAction.newline,
                            onChanged: (value) =>
                                _formData["ingrediente"] = value,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Informe os ingredientes (campo obrigatório!)";
                              }
                              if (value!.trim().length < 10) {
                                return "Os ingredientes deve ter mais de 10 letras";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            controller: ControllerReceita,
                            minLines: 4,
                            maxLines: 12,
                            expands: false,
                            decoration: InputDecoration(
                              suffixIcon: const Icon(
                                Icons.description_outlined,
                                color: Colors.orange,
                              ),
                              label: const Text("Informe o Modo de Preparo"),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(6)),
                            ),
                            textInputAction: TextInputAction.done,
                            onChanged: (value) => _formData["receita"] = value,
                            validator: (value) {
                              if (value!.trim().isEmpty) {
                                return "Informe o modo de Preparo (campo obrigatório!)";
                              }
                              if (value!.trim().length < 15) {
                                return "O modo de Preparo deve ter mais de 15 letras";
                              }
                              return null;
                            },
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                width: size.width * .5,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _salveForm();
                                  },
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
                                width: size.width * .3,
                                child: ElevatedButton(
                                  onPressed: () {
                                    _limpar();
                                  },
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
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _limpar() {
    ControllerName.text = "";
    ControllerIngrediente.text = "";
    ControllerName2.text = "";
    ControllerReceita.text = "";
    ControllerTime.text = "";
    ControllerQt.text = "";
  }

  void _salveForm() {
    bool isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    _form.currentState?.save();
    final newMeal = MealModel(
      id: Random().nextDouble().toString(),
      title: _formData["mealName"].toString(),
      country: "Diversos",
      people: _formData["peaple"].toString(),
      duration: _formData["time"].toString(),
      ingredient: _formData["ingrediente"].toString(),
      preparation: _formData["receita"].toString(),
      image: "",
      by: _formData["yourName"].toString(),
    );
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black45,
        duration: Duration(seconds: 5),
        content:
            Text("A sua Receita será avaliada dentro de 72 horas! obrigado"),
      ),
    );
  }

  selecionarImage() async {
    final ImagePicker picker = ImagePicker();
    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        setState(() {
          imageMeal = file;
        });
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
