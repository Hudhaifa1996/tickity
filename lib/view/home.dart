import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
body: Center(

  child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state)
    {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Color(0xff344154),
                size: 12.5,
                weight: 1.6,
              ),
              onPressed: () {
                context.read<LoginBloc>().add(ResetStates());
                context.go('/loginPage');
              }),
          title: const Text("تسجيل الدخول"),
          leadingWidth: 40,
          titleTextStyle: const TextStyle(
              height: 1.667,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontFamily: "Ping AR + LT",
              color: Color(0xff344154)),
        ),
      );
  }
),
    ));
  }
}
