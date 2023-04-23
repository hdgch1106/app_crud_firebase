import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class AddData extends StatefulWidget {
  static const String routeName = "/addDocentes";
  @override
  _AddDataState createState() => new _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controllerCodiDoce = TextEditingController();
  TextEditingController controllerNombDoce = TextEditingController();
  TextEditingController controllerAppaDoce = TextEditingController();
  TextEditingController controllerApmaDoce = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Adicionar Usuarios"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  ListTile(
                    leading:
                        const Icon(Icons.account_circle, color: Colors.black),
                    title: TextFormField(
                      controller: controllerCodiDoce,
                      validator: (value) {
                        if (value!.isEmpty) return "Ingresa el codigo";
                      },
                      decoration: const InputDecoration(
                        hintText: "Codigo",
                        labelText: "Codigo",
                      ),
                    ),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.account_circle, color: Colors.black),
                    title: TextFormField(
                      controller: controllerNombDoce,
                      validator: (value) {
                        if (value!.isEmpty) return "Ingresa el nombre";
                      },
                      decoration: const InputDecoration(
                        hintText: "Nombre",
                        labelText: "Nombre",
                      ),
                    ),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.account_circle, color: Colors.black),
                    title: TextFormField(
                      controller: controllerAppaDoce,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa el apellido paterno";
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Apellido P",
                        labelText: "Apellido P",
                      ),
                    ),
                  ),
                  ListTile(
                    leading:
                        const Icon(Icons.account_circle, color: Colors.black),
                    title: TextFormField(
                      controller: controllerApmaDoce,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingresa el apellido materno";
                        }
                      },
                      decoration: const InputDecoration(
                        hintText: "Apellido M",
                        labelText: "Apellido M",
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(30.0),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(30.0)),
                    ),
                    onPressed: () async {
                      await addDocente(
                          int.parse(controllerCodiDoce.text),
                          controllerNombDoce.text,
                          controllerAppaDoce.text,
                          controllerApmaDoce.text);
                      Navigator.pushReplacementNamed(
                          context, '/listarDocentes');
                    },
                    child: const Text("Agregar"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                    ),
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, '/listarDocentes');
                    },
                    child: const Text("Salir"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
