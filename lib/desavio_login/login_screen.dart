import 'package:aula02/desavio_login/created_account.dart';
import 'package:aula02/desavio_login/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import 'controller_login.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _keyForm = GlobalKey<FormState>();
  final _emailcontroller = TextEditingController();
  final _passewordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controllers = Provider.of<ControllerLogin>(context);
    // ignore: unused_local_variable
    final user = Provider.of<ControllerLogin>(context).LIST_USER;

    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: size.height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  height: size.height * .08,
                ),
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.purple,
                  child: Text(
                    "LZ",
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                    ),
                  ),
                ),

                SizedBox(
                  height: size.height * .02,
                ),
                const Text(
                  "Welcome back!",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  "Login to your existant account",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  height: size.height * .08,
                ),
                Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailcontroller,
                        decoration: const InputDecoration(
                          hintText: "Email Address",
                          hintStyle: TextStyle(color: Colors.grey),
                          prefixIcon: Icon(
                            Icons.email_outlined,
                            color: Colors.purple,
                          ),
                        ),
                        validator: Validatorless.multiple([
                          Validatorless.required("Email Obrigatório"),
                          Validatorless.email("Email Invalido")
                        ]),
                      ),
                      SizedBox(
                        height: size.height * .04,
                      ),
                      TextFormField(
                        controller: _passewordController,
                        decoration: InputDecoration(
                          hintText: "Input your Password",
                          hintStyle: const TextStyle(color: Colors.grey),
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: Colors.purple,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {
                              controllers.chengeStatePassword();
                            },
                            icon: Icon(
                              controllers.statePassword
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: Colors.purple,
                            ),
                          ),
                        ),
                        obscureText: controllers.statePassword ? false : true,
                        validator: Validatorless.multiple([
                          Validatorless.required("Senha Obrigatoria"),
                          Validatorless.min(
                              6, "Precisa de no Minimo 6 caracteres"),
                        ]),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: size.height * .04,
                ),
                InkWell(
                  onTap: () {
                    var formValid = _keyForm.currentState?.validate() ?? false;
                    if (formValid) {
                      // salvar os dados
                      var sms = controllers.returnUser(
                          _emailcontroller.text, _passewordController.text);
                      if (sms == null) {
                        showDialog(
                          context: context,
                          builder: (ctx) => const AlertDialog(
                            content: Text("Usuario não encontrado"),
                          ),
                        );
                      } else {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return WelcomeScreen(sms);
                          }),
                        );
                      }
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Colors.purple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        "Sing in",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * .02,
                ),
                const Center(
                  child: Text(
                    "------------------------ Or sing in wth ------------------------",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),

                // ignore: sized_box_for_whitespace
                Container(
                  width: double.infinity,
                  height: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: size.width * .45,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          title: Text(
                            "Facebook",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.purple,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                          leading: Icon(
                            Icons.facebook_outlined,
                            color: Colors.purple,
                            size: 28,
                          ),
                        ),
                      ),
                      Container(
                        width: size.width * .45,
                        height: 80,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12)),
                        child: const ListTile(
                          title: Text(
                            "Google",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.purple,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 2,
                            ),
                          ),
                          leading: Icon(
                            Icons.g_mobiledata_outlined,
                            color: Colors.purple,
                            size: 40,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * .12,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don´t have an account?",
                      style: TextStyle(color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) {
                            return const CreatedAccount();
                          }),
                        );
                      },
                      child: const Text(
                        "Sign up here",
                        style: TextStyle(color: Colors.purple, fontSize: 14),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
