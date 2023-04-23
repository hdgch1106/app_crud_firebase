import 'package:app_cursos/bloc/items/utils.dart';
import 'package:app_cursos/bloc/screens/login.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text.trim());
      Utils.showSnackBar("Correo para restablecer contraseña enviado");
    } on FirebaseAuthException catch (e) {
      print(e);
      Utils.showSnackBar(e.message);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF6200EE),
        elevation: 0,
        title: const Text("Restablecer contraseña"),
      ),
      resizeToAvoidBottomInset:
          false, //Para que el cuerpo no cambie de tamaño cuando aparezca el teclado
      body: Form(
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
                padding: const EdgeInsets.only(top: 93),
                child: SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      const Text(
                        "Recibe un email para restablecer tu contraseña",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      const SizedBox(height: 20),
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
                          controller: emailController,
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
                      const SizedBox(height: 20),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF6200EE),
                            foregroundColor: Colors.white),
                        icon: const Icon(Icons.email_outlined),
                        onPressed: () {
                          resetPassword();
                        },
                        label: const Text("Enviar correo"),
                      ),
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
