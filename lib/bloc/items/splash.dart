import 'dart:async';

import 'package:app_cursos/bloc/screens/adminPage.dart';
import 'package:app_cursos/bloc/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  static const String routeName = "/splash";
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => StreamBuilder<User?>(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return const Admin();
              } else {
                return const Register();
              }
            }),
      ));
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[900],
      body: Center(
        child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
            children: <TextSpan>[
              TextSpan(
                text: "Aplicación Móvil\nCrud",
                style: TextStyle(
                  fontSize: 40.0,
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: "\n\n\n           Hugo Grados",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 28.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
