import 'package:aula02/desavio_login/model_user.dart';
import 'package:aula02/desavio_login/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import 'controller_login.dart';
import 'login_screen.dart';

class CreatedAccount extends StatefulWidget {
  const CreatedAccount({Key? key}) : super(key: key);

  @override
  State<CreatedAccount> createState() => _CreatedAccountState();
}

class _CreatedAccountState extends State<CreatedAccount> {
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _password2FocusNode = FocusNode();
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();
  final _password2controller = TextEditingController();

  final _keyForm = GlobalKey<FormState>();
  final _formData = <String, Object>{};

  bool stateloLoading = false;

  Future<void> _saveForm() async {
    var formValid = _keyForm.currentState?.validate() ?? false;
    if (!formValid) {
      // salvar os dados
      return;
    }

    _keyForm.currentState?.save();

    final user = ModellUser(
      id: _formData['id'].toString(),
      name: _formData['name'].toString(),
      email: _formData["email"].toString(),
      password: _formData['password'].toString(),
    );
    setState(() {
      stateloLoading = true;
    });
    final users = Provider.of<ControllerLogin>(context, listen: false);
    if (_formData['id'] == null) {
      try {
        await users.addUser(user);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            return WelcomeScreen(user.name);
          }),
        );
      } catch (error) {
        await showDialog(
            context: context,
            builder: (cxt) {
              return AlertDialog(
                title: const Text("Ocorreu um erro"),
                content: const Text("Ocoreeu um erro ao cadastrar um Usuário"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text("Ok"))
                ],
              );
            });
      } finally {
        setState(() {
          stateloLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final controllers = Provider.of<ControllerLogin>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign up"),
        backgroundColor: Colors.white,
        elevation: 0.4,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {
                _namecontroller.text = "";
                _emailcontroller.text = "";
                _passwordcontroller.text = "";
                _password2controller.text = "";
              },
              icon: const Icon(Icons.refresh),
            ),
          ),
        ],
      ),
      body: stateloLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        "Create Your Account",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 26,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      const Text(
                        "Please enter info to create account",
                        style: TextStyle(color: Colors.grey, fontSize: 14),
                      ),
                      SizedBox(
                        height: size.height * .05,
                      ),
                      Form(
                        key: _keyForm,
                        child: Column(
                          children: [
                            TextFormField(
                              controller: _namecontroller,
                              decoration: const InputDecoration(
                                hintText: "Full name",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(
                                  Icons.person_outline_rounded,
                                  color: Colors.purple,
                                ),
                              ),
                              textInputAction: TextInputAction.next,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_emailFocusNode);
                              },
                              onSaved: (value) =>
                                  _formData['name'] = value.toString(),
                              validator:
                                  Validatorless.required("Nome Obrigatório"),
                            ),
                            SizedBox(
                              height: size.height * .05,
                            ),
                            TextFormField(
                              controller: _emailcontroller,
                              textInputAction: TextInputAction.next,
                              focusNode: _emailFocusNode,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_passwordFocusNode);
                              },
                              decoration: const InputDecoration(
                                hintText: "Email Address",
                                hintStyle: TextStyle(color: Colors.grey),
                                prefixIcon: Icon(
                                  Icons.email_outlined,
                                  color: Colors.purple,
                                ),
                              ),
                              onSaved: (value) =>
                                  _formData['email'] = value.toString(),
                              validator: Validatorless.multiple([
                                Validatorless.required("Email Obrigatório"),
                                Validatorless.email("Email Invalido")
                              ]),
                            ),
                            SizedBox(
                              height: size.height * .05,
                            ),
                            TextFormField(
                              controller: _passwordcontroller,
                              textInputAction: TextInputAction.next,
                              focusNode: _passwordFocusNode,
                              onFieldSubmitted: (_) {
                                FocusScope.of(context)
                                    .requestFocus(_password2FocusNode);
                              },
                              decoration: InputDecoration(
                                hintText: "Password",
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
                              obscureText:
                                  controllers.statePassword ? false : true,
                              onSaved: (value) =>
                                  _formData['password'] = value.toString(),
                              validator: Validatorless.multiple([
                                Validatorless.required("Senha Obrigatoria"),
                                Validatorless.min(6,
                                    "Senha precisa ter pelo menos 6 Caracteres"),
                              ]),
                            ),
                            SizedBox(
                              height: size.height * .05,
                            ),
                            TextFormField(
                              controller: _password2controller,
                              focusNode: _password2FocusNode,
                              decoration: InputDecoration(
                                hintText: "Confirm Password",
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
                              obscureText:
                                  controllers.statePassword ? false : true,
                              onFieldSubmitted: (_) {
                                _saveForm();
                              },
                              validator: Validatorless.multiple([
                                Validatorless.required("Senha Obrigatoria"),
                                Validatorless.min(6,
                                    "Senha precisa ter pelo menos 6 Caracteres"),
                                controllers.compare(_passwordcontroller,
                                    "Senha diferente de confirma Senha"),
                              ]),
                            ),
                            SizedBox(
                              height: size.height * .05,
                            ),
                            InkWell(
                              onTap: () {
                                _saveForm();
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
                                    "Create",
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
                          ],
                        ),
                      ),
                      SizedBox(
                        height: size.height * .15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Did you have account? ",
                            style: TextStyle(color: Colors.grey),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return LoginScreen();
                              }));
                            },
                            child: const Text(
                              "Sign in",
                              style: TextStyle(
                                  color: Colors.purple,
                                  fontWeight: FontWeight.bold),
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
