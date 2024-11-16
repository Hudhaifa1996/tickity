import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../bloc/home_cubits/event_cubit.dart';

class AllEvents extends StatelessWidget {
  const AllEvents({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<EventCubit>().isStarted ? null : context.read<EventCubit>().setupScrollListener();
    context.read<EventCubit>().pageNumber == 1 ? context.read<EventCubit>().eventRequested() : null;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  context.go("/home");
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
          controller: context.read<EventCubit>().scrollController,
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.fromLTRB(30.0, 0.0, 16.0, 14.0),
                child: Text(
                  "الاحداث المضافة حديثاً",
                  style: TextStyle(
                    height: 1.5,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Ping AR + LT",
                    color: Color(0xff151D29),
                  ),
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
                      itemCount: context.read<EventCubit>().events!.data.length < context.read<EventCubit>().events!.totalCount!.toInt() ? context.read<EventCubit>().events!.data.length + 1 : context.read<EventCubit>().events!.data.length,
                      itemBuilder: (context, index) {
                        if (index == context.read<EventCubit>().events!.data.length && context.read<EventCubit>().events!.data.length < context.read<EventCubit>().events!.totalCount!.toInt()) {
                          return const Center(child: CircularProgressIndicator());
                        } else {
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
                                    context.read<EventCubit>().events!.data[index].title.toString(), //context.read<EventCubit>().events!.data[index].title.toString(),
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
                        }
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
