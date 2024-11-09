// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'bloc/home_bloc.dart';
// import 'routing.dart';
//
// void main() {
//   // WidgetsFlutterBinding.ensureInitialized();
//   // final SharedPreferences prefs = await SharedPreferences.getInstance();
//   // Routing.prefs = prefs;
//   runApp(LoginBloc(
//     create: (context) => LoginBloc(),
//     child: MaterialApp.router(
//       routerConfig: Routing.router,
//       debugShowCheckedModeBanner: false,
//     ),
//   ),
//   )
//   );
// }

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickity/routing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Routing.prefs = prefs;
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routerConfig: Routing.router,
    ),
  );
}
