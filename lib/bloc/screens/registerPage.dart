import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../items/utils.dart';

class RegisterScreen extends StatefulWidget {
  final Function() onClickedSignIn;

  const RegisterScreen({super.key, required this.onClickedSignIn});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();

  Future signUp() async {
    final isValid = formKey.currentState!.validate();
    if (!isValid) return;
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: user.text.trim(), password: pass.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset:
          false, //Para que el cuerpo no cambie de tamaño cuando aparezca el teclado
      body: Form(
        key: formKey,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("images/fondo.jpg"), fit: BoxFit.cover),
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.only(top: 77.0),
                width: 170.0,
                height: 170.0,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: const CircleAvatar(
                  backgroundColor: Color(0xF81F7F3),
                  child: Image(
                    width: 135,
                    height: 135,
                    image: AssetImage("images/avatar.png"),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 93),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        padding: const EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: user,
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.email,
                                color: Colors.black,
                              ),
                              hintText: 'Email'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (user) =>
                              user != null && !EmailValidator.validate(user)
                                  ? "Ingrese un email valido"
                                  : null,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        margin: const EdgeInsets.only(top: 32),
                        padding: const EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextFormField(
                          controller: pass,
                          obscureText: true,
                          decoration: const InputDecoration(
                              icon: Icon(
                                Icons.vpn_key,
                                color: Colors.black,
                              ),
                              hintText: 'Contraseña'),
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (value) =>
                              value != null && value.length < 6
                                  ? "Ingrese 6 carácteres como mínimo!"
                                  : null,
                        ),
                      ),
                      const Divider(),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF6200EE),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            signUp();
                          },
                          child: const Text("Registrar")),
                      const SizedBox(height: 24),
                      RichText(
                          text: TextSpan(
                              style: const TextStyle(color: Colors.white),
                              text: "Ya tienes una cuenta?  ",
                              children: [
                            TextSpan(
                                recognizer: TapGestureRecognizer()
                                  ..onTap = widget.onClickedSignIn,
                                text: "Logeate",
                                style: const TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: Colors.cyanAccent))
                          ])),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
