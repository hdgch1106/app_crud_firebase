// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class EditData extends StatefulWidget {
  static const String routeName = "/editDocentes";
  final List list;
  final int index;

  // ignore: use_key_in_widget_constructors
  const EditData({required this.list, required this.index});

  @override
  _EditDataState createState() => _EditDataState();
}

class _EditDataState extends State<EditData> {
  late TextEditingController controllerUid;
  late TextEditingController controllerCodiDoce;
  late TextEditingController controllerNombDoce;
  late TextEditingController controllerAppaDoce;
  late TextEditingController controllerApmaDoce;

  //Carga el listado apenas inicia
  @override
  void initState() {
    controllerUid =
        TextEditingController(text: widget.list[widget.index]['uid']);
    controllerCodiDoce = TextEditingController(
        text: widget.list[widget.index]['codiDoce'].toString());
    controllerNombDoce =
        TextEditingController(text: widget.list[widget.index]['nombDoce']);
    controllerAppaDoce =
        TextEditingController(text: widget.list[widget.index]['appaDoce']);
    controllerApmaDoce =
        TextEditingController(text: widget.list[widget.index]['apmaDoce']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("EDITAR"),
      ),
      body: Form(
        child: ListView(
          padding: const EdgeInsets.all(10.0),
          children: <Widget>[
            Column(
              children: <Widget>[
                ListTile(
                  leading:
                      const Icon(Icons.account_circle, color: Colors.black),
                  title: TextFormField(
                    controller: controllerCodiDoce,
                    validator: (value) {
                      if (value!.isEmpty) return "Ingrese el codigo";
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
                      if (value!.isEmpty) return "Ingrese el nombre";
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
                      if (value!.isEmpty) return "Ingrese el apellido paterno ";
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
                      if (value!.isEmpty) return "Ingrese el apellido materno ";
                    },
                    decoration: const InputDecoration(
                      hintText: "Apellido M",
                      labelText: "Apellido M",
                    ),
                  ),
                ),
                const Divider(
                  height: 1.0,
                ),
                const Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent),
                  onPressed: () async {
                    await updateDocente(
                        controllerUid.text.toString(),
                        controllerCodiDoce.text.toString(),
                        controllerNombDoce.text.toString(),
                        controllerAppaDoce.text.toString(),
                        controllerApmaDoce.text.toString());
                    Navigator.pushReplacementNamed(context, "/listarDocentes");
                  },
                  child: const Text("Guardar"),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
