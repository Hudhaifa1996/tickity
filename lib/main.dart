import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickity/routing.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  Routing.prefs = prefs;
  await initializeDateFormatting('ar_SA', null);
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Login App',
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      routerConfig: Routing.router,
    ),
  );
}
