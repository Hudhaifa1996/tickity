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
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/login_bloc.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Routing.prefs = prefs;
  runApp(BlocProvider(
        create: (_) => LoginBloc(),
    child: MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routerConfig: Routing.router,
    )),
      );

}