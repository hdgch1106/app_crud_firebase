import 'package:app_cursos/bloc/screens/listarDocentes.dart';
import 'package:flutter/material.dart';

import '../services/firebase_service.dart';

class Detail extends StatefulWidget {
  List list;
  int index;
  Detail({Key? key, required this.index, required this.list}) : super(key: key);
  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  void confirm() {
    AlertDialog alertDialog = AlertDialog(
      content: Text(
          "Esta seguto de eliminar '${widget.list[widget.index]['logiDoce']}'"),
      actions: <Widget>[
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          onPressed: () async {
            await deleteDocente(widget.list[widget.index]["uid"]);
            Navigator.pushNamedAndRemoveUntil(
                context, "/listarDocentes", ((route) => false));
          },
          child: const Text(
            "OK Eliminado!",
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
          onPressed: () => Navigator.pop(context),
          child: const Text("CANCELAR", style: TextStyle(color: Colors.black)),
        ),
      ],
    );

    showDialog(context: context, builder: (_) => alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.list[widget.index]['nombDoce']}"),
      ),
      body: Container(
        height: 270.0,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          child: Center(
            child: Column(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Text(
                  "COD.: ${widget.list[widget.index]['codiDoce']}",
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Text(
                  "NOMB.: ${widget.list[widget.index]['nombDoce']}",
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Text(
                  "APELL.: ${widget.list[widget.index]['appaDoce']} ${widget.list[widget.index]['apmaDoce']}",
                  style: const TextStyle(fontSize: 16.0),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      onPressed: () => Navigator.pushNamedAndRemoveUntil(
                          context, "/editDocentes", (route) => false,
                          arguments: {
                            "list": widget.list,
                            "index": widget.index
                          }),
                      child: const Text("EDITAR"),
                    ),
                    const VerticalDivider(),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0)),
                      ),
                      onPressed: () => confirm(),
                      child: const Text("ELIMINAR"),
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
