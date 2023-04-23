import 'package:app_cursos/bloc/items/splash.dart';
import 'package:app_cursos/bloc/items/utils.dart';
import 'package:app_cursos/bloc/screens/adminPage.dart';
import 'package:app_cursos/bloc/screens/editDocentes.dart';
import 'package:app_cursos/bloc/screens/listarDocentes.dart';
import 'package:app_cursos/bloc/screens/login.dart';
import 'package:app_cursos/bloc/screens/register.dart';
import 'package:app_cursos/bloc/screens/registroDocentes.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MaterialApp(
    home: const Splash(),
    scaffoldMessengerKey: Utils.messengerKey,
    debugShowCheckedModeBanner: false,
    routes: <String, WidgetBuilder>{
      Splash.routeName: (context) => Splash(),
      Admin.routeName: (context) => Admin(),
      ListarDocentes.routeName: (context) => ListarDocentes(),
      AddData.routeName: (context) => AddData(),
      EditData.routeName: (context) {
        final args =
            ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
        return EditData(
          list: args['list'] as List,
          index: args['index'] as int,
        );
      },
    },
  ));
}
