import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../screens/detailDocentes.dart';

class ItemList extends StatelessWidget {
  final List list;
  const ItemList({Key? key, required this.list}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      //Numero de iteraciones
      itemCount: list.length,
      itemBuilder: (context, index) {
        final codiDoce = list[index]["codiDoce"];
        final nombDoce = list[index]["nombDoce"];
        final appaDoce = list[index]["appaDoce"];
        final apmaDoce = list[index]["apmaDoce"];
        return Container(
          padding: EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => Detail(list: list, index: index),
            )),
            child: Card(
              child: ListTile(
                title: Text(
                  codiDoce.toString() +
                      " | " +
                      nombDoce +
                      " | " +
                      appaDoce +
                      " | " +
                      apmaDoce,
                  style: const TextStyle(
                      fontSize: 25.0, color: Colors.orangeAccent),
                ),
                leading: const Icon(Icons.person_pin,
                    size: 77.0, color: Colors.orangeAccent),
              ),
            ),
          ),
        );
      },
    );
  }
}
