import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tickity/bloc/home_cubit.dart';
import 'package:tickity/bloc/signup_cubit.dart';
import 'package:tickity/view/home.dart';
import 'package:tickity/view/loginpage.dart';
import 'package:tickity/view/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:tickity/view/signuppage2.dart';
import 'package:tickity/view/splash.dart';
import 'bloc/login_cubit.dart';

SignupCubit _signupCubit = SignupCubit();

class Routing {
  static late final SharedPreferences prefs;

// GoRouter configuration
  static final router = GoRouter(
    initialLocation: '/home',
    routes: [
      GoRoute(
        name: 'splash',
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: 'loginPage',
        path: '/loginPage',
        builder: (context, state) => Directionality(
          textDirection: TextDirection.rtl,
          child: BlocProvider(
            create: (context) => LoginCubit(),
            child: const LoginPage(),
          ),
        ),
      ),
      GoRoute(
        name: 'signupPage',
        path: '/signupPage',
        builder: (context, state) => Directionality(
            textDirection: TextDirection.rtl,
            child: BlocProvider.value(
              value: _signupCubit,
              child: const SignupPage(),
            )),
      ),
      GoRoute(
        name: 'signupPage2',
        path: '/signupPage2',
        builder: (context, state) => Directionality(
            textDirection: TextDirection.rtl,
            child: BlocProvider.value(
              value: _signupCubit,
              child: const SignupPage2(),
            )),
      ),
      GoRoute(
        name: 'home',
        path: '/home',
        builder: (context, state) => Directionality(
            textDirection: TextDirection.rtl,
            child: BlocProvider(
              create: (context) => HomeCubit(),
              child: const Home(),
            )),
      ),
    ],
    redirect: (context, state) {
      if (['/signupPage'].contains(state.uri.toString())) {
        _signupCubit = SignupCubit();
      }
      return null;
    },
  );
}
