import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

//Consulta a la base de datos
Future<List> getDocente() async {
  List docente = [];
  //Referencia a la colección
  CollectionReference collectionReferenceDocente = db.collection("docente");
  //Recupera toda la colección de docentes
  QuerySnapshot queryDocente = await collectionReferenceDocente.get();
  for (var documento in queryDocente.docs) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final doce = {
      "uid": documento.id,
      "codiDoce": data['codiDoce'],
      "nombDoce": data['nombDoce'],
      "appaDoce": data['appaDoce'],
      "apmaDoce": data['apmaDoce'],
    };
    docente.add(doce);
  }
  return docente;
}

Future<void> addDocente(
    int codiDoce, String nombDoce, String appaDoce, String apmaDoce) async {
  await db.collection("docente").add({
    "codiDoce": codiDoce,
    "nombDoce": nombDoce,
    "appaDoce": appaDoce,
    "apmaDoce": apmaDoce,
  });
}

Future<void> updateDocente(String uid, String codiDoce, String nombDoce,
    String appaDoce, String apmaDoce) async {
  await db.collection("docente").doc(uid).set({
    "codiDoce": codiDoce,
    "nombDoce": nombDoce,
    "appaDoce": appaDoce,
    "apmaDoce": apmaDoce,
  });
}

Future<void> deleteDocente(String uid) async {
  await db.collection("docente").doc(uid).delete();
}
