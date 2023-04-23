// ignore_for_file: deprecated_member_use

import 'package:app_cursos/bloc/items/utils.dart';
import 'package:app_cursos/bloc/screens/registroDocentes.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../items/itemList.dart';
import '../services/firebase_service.dart';

class ListarDocentes extends StatefulWidget {
  static const String routeName = "/listarDocentes";

  const ListarDocentes({super.key});
  @override
  _ListarDocentesState createState() => _ListarDocentesState();
}

class _ListarDocentesState extends State<ListarDocentes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Listado de Docentes"),
          actions: [
            IconButton(
                icon: const Icon(Icons.logout_outlined),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Utils.signOut(context);
                })
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () =>
              Navigator.pushReplacementNamed(context, "/addDocentes"),
        ),
        body: FutureBuilder<List>(
            future: getDocente(),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return ItemList(list: snapshot.data ?? []);
              } else {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
            })));
  }
}
