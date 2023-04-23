import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Admin extends StatelessWidget {
  static const String routeName = "/adminPage";

  const Admin({super.key});
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text("${user.email}"),
          actions: [
            IconButton(
                icon: const Icon(Icons.logout_outlined),
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                })
          ],
        ),
        body: OrientationBuilder(
          builder: ((context, orientation) {
            return GridView.count(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 4,
              childAspectRatio: 1.0,
              padding: const EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/listarDocentes');
                  },
                  shape: const CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                  child: const Icon(
                    Icons.people,
                    color: Colors.blueAccent,
                    size: 63.0,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/listarDocentes');
                  },
                  shape: const CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                  child: Icon(
                    Icons.people,
                    color: Colors.grey[300],
                    size: 63.0,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/listarDocentes');
                  },
                  shape: const CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                  child: const Icon(
                    Icons.people,
                    color: Colors.greenAccent,
                    size: 63.0,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/listarDocentes');
                  },
                  shape: const CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                  child: Icon(
                    Icons.people,
                    color: Colors.orangeAccent[100],
                    size: 63.0,
                  ),
                ),
                RawMaterialButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/listarDocentes');
                  },
                  shape: const CircleBorder(),
                  elevation: 2.0,
                  fillColor: Colors.white,
                  padding: const EdgeInsets.all(7.0),
                  child: const Icon(
                    Icons.people,
                    color: Colors.redAccent,
                    size: 63.0,
                  ),
                ),
              ],
            );
          }),
        ));
  }
}
