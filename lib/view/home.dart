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
    context.read<CollectionCubit>().collections == null ? context.read<CollectionCubit>().collectionRequested() : null;
    context.read<CategoryCubit>().categories == null ? context.read<CategoryCubit>().categoryRequested() : null;
    context.read<EventCubit>().events == null ? context.read<EventCubit>().eventRequested() : null;

    return Scaffold(
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
                child: Image.asset("lib/assets/tickitylogo.png", width: 96.36, height: 32),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0), //or 15.0
                child: GestureDetector(
                  onTap: () {
                    context.go("/loginPage");
                  },
                  child: Image.asset("lib/assets/profile.png", width: 32, height: 32),
                ),
              ),
            ],
          ),
          titleTextStyle: const TextStyle(height: 1.667, fontWeight: FontWeight.w500, fontSize: 12, fontFamily: "Ping AR + LT", color: Color(0xff344154)),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              BlocBuilder<CollectionCubit, CollectionState>(
                builder: (context, state) {
                  if (state is CollectionLoading) {
                    return SizedBox(height: MediaQuery.of(context).size.height * 0.4, child: const Center(child: CircularProgressIndicator()));
                  } else if (state is CollectionSuccess) {
                    return SizedBox(
                      height: 250.42, // Height of the PageView
                      child: PageView.builder(
                        controller: PageController(
                          initialPage: context.read<CollectionCubit>().collections!.length * 500,
                          viewportFraction: 0.75,
                        ),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueAccent,
                                borderRadius: BorderRadius.circular(10.02),
                              ),
                              child: Center(
                                child: Text(
                                  context.read<CollectionCubit>().collections![index % context.read<CollectionCubit>().collections!.length].name.toString(),
                                  style: const TextStyle(
                                    height: 1.3,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 24,
                                    fontFamily: "Ping AR + LT",
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  } else {
                    return SizedBox(height: MediaQuery.of(context).size.height * 0.4, child: const Center(child: Text("فشل تحميل المجموعات")));
                  }
                },
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 100,
                child: BlocBuilder<CategoryCubit, CategoryState>(
                  builder: (context, state) {
                    if (state is CategoryLoading) {
                      return SizedBox(height: MediaQuery.of(context).size.height * 0.3, child: const Center(child: CircularProgressIndicator()));
                    } else if (state is CategorySuccess) {
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: context.read<CategoryCubit>().categories!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(24.0),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: context.read<CategoryCubit>().categories![index].iconUrl!.substring(context.read<CategoryCubit>().categories![index].iconUrl!.length - 3) != "svg"
                                        ? Image.network(
                                            "https://${context.read<CategoryCubit>().categories![index].iconUrl}",
                                            height: 48.0,
                                            width: 48.0,
                                            fit: BoxFit.contain, // Change image fill type
                                          )
                                        : SvgPicture.network(
                                            "https://${context.read<CategoryCubit>().categories![index].iconUrl}",
                                            height: 48.0,
                                            width: 48.0,
                                            fit: BoxFit.contain, // Change image fill type
                                          ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  context.read<CategoryCubit>().categories![index].name.toString(),
                                  style: const TextStyle(
                                    height: 1.6,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 12,
                                    fontFamily: "Ping AR + LT",
                                    color: Color(0xff1E1E1E),
                                    letterSpacing: 1,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else {
                      return SizedBox(height: MediaQuery.of(context).size.height * 0.3, child: const Center(child: Text("فشل تحميل الاقسام")));
                    }
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 0.0, 16.0, 14.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "الاحداث المضافة حديثاً",
                      style: TextStyle(
                        height: 1.5,
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily: "Ping AR + LT",
                        color: Color(0xff151D29),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        context.go("/allEvents");
                      },
                      child: const Text(
                        "عرض الجميع",
                        style: TextStyle(
                          color: Color(0xffF84932),
                          height: 1.5,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                          fontFamily: "Ping AR + LT",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              BlocBuilder<EventCubit, EventState>(
                builder: (context, state) {
                  if (state is EventLoading) {
                    return SizedBox(height: MediaQuery.of(context).size.height * 0.3, child: const Center(child: CircularProgressIndicator()));
                  } else if (state is EventSuccess) {
                    return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(6.0, 4.0, 16.0, 4.0),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10.73),
                                  child: Image.network(
                                    "https://${context.read<EventCubit>().events!.data[index].images[0].imageUrl}",
                                    height: 96.0,
                                    width: 134.0,
                                    fit: BoxFit.cover, // Change image fill type
                                  )),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  context.read<EventCubit>().events!.data[index].title.toString(),
                                  style: const TextStyle(
                                    height: 1.5,
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                    fontFamily: "Ping AR + LT",
                                    color: Color(0xff151D29),
                                  ),
                                ),
                                Text(
                                  "تبقى ${context.read<EventCubit>().events!.data[index].totalAvailableTickets.toString()} تذاكر",
                                  style: const TextStyle(
                                    height: 1.6,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    fontFamily: "Ping AR + LT",
                                    color: Color(0xff0089DE),
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text(" "),
                                    SvgPicture.asset(
                                      "lib/assets/calendaricon.svg",
                                      width: 10.0,
                                      height: 10.83,
                                    ),
                                    const Text("   "),
                                    Text(
                                      context.read<EventCubit>().events!.data[index].formattedStartDate.toString(),
                                      style: const TextStyle(
                                        height: 1.6,
                                        fontWeight: FontWeight.w400,
                                        fontSize: 10,
                                        fontFamily: "Ping AR + LT",
                                        color: Color(0xff485568),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(" "),
                                    SvgPicture.asset(
                                      "lib/assets/ticketicon.svg",
                                      width: 11.3,
                                      height: 12.02,
                                    ),
                                    const Text("   "),
                                    Text(
                                      context.read<EventCubit>().events!.data[index].startPrice == context.read<EventCubit>().events!.data[index].endPrice
                                          ? context.read<EventCubit>().events!.data[index].startPrice.toString()
                                          : "${context.read<EventCubit>().events!.data[index].endPrice.toString()} - ${context.read<EventCubit>().events!.data[index].startPrice.toString()}",
                                      style: const TextStyle(
                                        height: 1.5,
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                        fontFamily: "Ping AR + LT",
                                        color: Color(0xff667185),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    return SizedBox(height: MediaQuery.of(context).size.height * 0.3, child: const Center(child: Text("فشل تحميل الاقسام")));
                  }
                },
              ),
            ],
          ),
        ));
  }
}
