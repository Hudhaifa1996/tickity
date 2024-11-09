import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickity/view/home.dart';
import 'package:tickity/view/loginpage.dart';
import 'package:tickity/view/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:tickity/view/signuppage2.dart';
import 'package:tickity/view/splash.dart';

class Routing {
  static late final SharedPreferences prefs;

// GoRouter configuration
  static final router = GoRouter(
    initialLocation: '/loginPage',
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'loginPage',
        path: '/loginPage',
        builder: (context, state) => const Directionality(
            textDirection: TextDirection.rtl, child: LoginPage()),
      ),
      GoRoute(
        name: 'signupPage',
        path: '/signupPage',
        builder: (context, state) => const Directionality(
            textDirection: TextDirection.rtl, child: SignupPage()),
      ),
      GoRoute(
        name: 'signupPage2',
        path: '/signupPage2',
        builder: (context, state) => const Directionality(
            textDirection: TextDirection.rtl, child: SignupPage2()),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => const Directionality(
            textDirection: TextDirection.rtl, child: Home()),
      ),
    ],
  );
}
