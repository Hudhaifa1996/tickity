import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tickity/bloc/home_cubits/category_cubit.dart';

import '../bloc/home_cubits/collection_cubit.dart';

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
                    context.read<CollectionCubit>().collectionRequested();
                    context.read<CategoryCubit>().categoryRequested();
                    // context.read<HomeCubit>().eventRequested();
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
          body: SingleChildScrollView(
            child: Column(
              children: [
                BlocBuilder<CollectionCubit, CollectionState>(
                  builder: (context, state) {
                    context.read<CollectionCubit>().collections == null
                        ? context.read<CollectionCubit>().collectionRequested()
                        : null;
                    if (state is CollectionLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CollectionSuccess) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        itemCount:
                            context.read<CollectionCubit>().collections!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(context
                                .read<CollectionCubit>()
                                .collections![index]
                                .name
                                .toString()),
                            // subtitle: CircleAvatar(backgroundImage: NetworkImage("http://${context.read<HomeCubit>().collection![index].iconUrl.toString()}",),
                            // ),
                            // backgroundColor: Colors.redAccent,
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text("فشل تحميل المجموعات"));
                    }
                  },
                ),
                BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    context.read<CategoryCubit>().categories == null
                        ? context.read<CategoryCubit>().categoryRequested()
                        : null;
                    if (state is CategoryLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is CategorySuccess) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        // scrollDirection: Axis.horizontal,
                        itemCount:
                            context.read<CategoryCubit>().categories!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(context
                                .read<CategoryCubit>()
                                .categories![index]
                                .name
                                .toString()),
                            // subtitle: CircleAvatar(backgroundImage: NetworkImage("http://${context.read<HomeCubit>().collection![index].iconUrl.toString()}",),
                            // ),
                            // backgroundColor: Colors.redAccent,
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text("فشل تحميل الاقسام"));
                    }
                  },
                ),
              ],
            ),
          )),
    ));
  }
}
