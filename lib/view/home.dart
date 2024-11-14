import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:tickity/bloc/home_cubits/category_cubit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/home_cubits/collection_cubit.dart';
import '../bloc/home_cubits/event_cubit.dart';

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
                    context.read<EventCubit>().eventRequested();
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
                        shrinkWrap: true,
                        // Important to avoid taking all available space
                        itemCount:
                            context.read<CollectionCubit>().collections!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              context
                                  .read<CollectionCubit>()
                                  .collections![index]
                                  .name
                                  .toString(),
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(child: Text("فشل تحميل المجموعات"));
                    }
                  },
                ),
                Container(
                  height: 200,
                  // Container height for the horizontal ListView
                  child: BlocBuilder<CategoryCubit, CategoryState>(
                    builder: (context, state) {
                      context.read<CategoryCubit>().categories == null
                          ? context.read<CategoryCubit>().categoryRequested()
                          : null;
                      if (state is CategoryLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is CategorySuccess) {
                        return ListView.builder(
                          scrollDirection: Axis.horizontal,
                          // Horizontal scrolling
                          shrinkWrap: true,
                          // Important to avoid taking all available space
                          itemCount:
                              context.read<CategoryCubit>().categories!.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: context
                                              .read<CategoryCubit>()
                                              .categories![index]
                                              .iconUrl!
                                              .substring(context
                                                      .read<CategoryCubit>()
                                                      .categories![index]
                                                      .iconUrl!
                                                      .length -
                                                  3) !=
                                          "svg"
                                      ? Image.network(
                                          "https://${context.read<CategoryCubit>().categories![index].iconUrl}",
                                          height: 24.0,
                                          width: 24.0,
                                          fit: BoxFit
                                              .contain, // Change image fill type
                                        )
                                      : SvgPicture.network(
                                          "https://${context.read<CategoryCubit>().categories![index].iconUrl}",
                                          height: 24.0,
                                          width: 24.0,
                                          fit: BoxFit
                                              .contain, // Change image fill type
                                        ),
                                ),
                                Text(
                                  context
                                      .read<CategoryCubit>()
                                      .categories![index]
                                      .name
                                      .toString(),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        return const Center(child: Text("فشل تحميل الاقسام"));
                      }
                    },
                  ),
                ),
                BlocBuilder<EventCubit, EventState>(
                  builder: (context, state) {
                    context.read<EventCubit>().events == null
                        ? context.read<EventCubit>().eventRequested()
                        : null;
                    if (state is EventLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is EventSuccess) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        // Important to avoid taking all available space
                        itemCount: context.read<EventCubit>().events!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              context
                                  .read<EventCubit>()
                                  .events![index]
                                  .title
                                  .toString(),
                            ),
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
