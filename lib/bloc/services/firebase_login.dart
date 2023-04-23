import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<bool> verificarCredenciales(String email, String pass) async {
  try {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: pass);
    return FirebaseAuth.instance
        .authStateChanges()
        .map((user) => user != null)
        .first;
  } on FirebaseAuthException catch (e) {
    print(e);
    return false;
  }
}
