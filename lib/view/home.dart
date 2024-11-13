import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../API/api.dart';
import '../bloc/home_cubit.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.read<HomeCubit>().eventsRequested();
                },
                child: Image.asset("lib/assets/tickitylogo.png",
                    width: 96.36, height: 32),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), //or 15.0
                child: GestureDetector(
                  onTap: () {
                    context.go("/loginPage");
                  },
                  child: Image.asset("lib/assets/profile.png",
                      width: 32, height: 32),
                ),
              ),
            ],
          ),
          titleTextStyle: const TextStyle(
              height: 1.667,
              fontWeight: FontWeight.w500,
              fontSize: 12,
              fontFamily: "Ping AR + LT",
              color: Color(0xff344154)),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            state.events.isEmpty ? context.read<HomeCubit>().eventsRequested(): print(state.events[0][2].toString());

            return SingleChildScrollView(
              child: Column(
                children: [
                  context.read<HomeCubit>().a != null ? ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    // scrollDirection: Axis.horizontal,
                    itemCount: context.watch<HomeCubit>().a!.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return ListTile(
                          title: Text(context.watch<HomeCubit>().a![index].name.toString()),
                        subtitle: ImageIcon( NetworkImage("http://${context.watch<HomeCubit>().a![index].iconUrl.toString()}"),
                        color: Colors.redAccent,),

                      );
                    },
                  )
                      : const SizedBox()
                ],
              ),
            );
          },
        ),
      ),
    ));
  }
}
