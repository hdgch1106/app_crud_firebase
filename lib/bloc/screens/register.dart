import 'package:app_cursos/bloc/screens/login.dart';
import 'package:app_cursos/bloc/screens/registerPage.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  static const String routeName = "/register";
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<Register> {
  bool isLogin = true;
  void toggle() => setState(() => isLogin = !isLogin);
  @override
  Widget build(BuildContext context) => isLogin
      ? LoginScreen(
          onClickedSignUp: toggle,
        )
      : RegisterScreen(onClickedSignIn: toggle);
}
