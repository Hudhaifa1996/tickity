import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../API/api.dart';
import 'package:tickity/constants.dart' as constants;
import '../../modal/event.dart';
import 'package:flutter/material.dart';

part 'event_state.dart';

class EventCubit extends Cubit<EventState> {
  EventCubit() : super(EventLoading());
  API api = API();
  EventResponse? events;
  EventResponse? newEvents;
  ScrollController scrollController = ScrollController();
  int pageNumber = 1;
  bool isStarted = false;

  Future<void> eventRequested() async {
    pageNumber == 1 ? emit(EventLoading()) : null;
    Response response = await api.getData(
        URL: constants.getEventsURL,
        queryParameters: {"PageNumber": pageNumber, "PageSize": 10});
    print("4");
    if (response.statusCode == 200) {
      newEvents = EventResponse.fromJson(response.data);
      if (events == null) {
        events = newEvents;
      } else if (events!.pageNumber != newEvents!.pageNumber) {
        events!.data.addAll(newEvents!.data);
      }
      emit(EventSuccess());
    } else {
      emit(EventError());
    }
  }

  void setupScrollListener() {
    isStarted = true;
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
              scrollController.position.maxScrollExtent &&
          events!.data.length < events!.totalCount!) {
        pageNumber++;
        eventRequested();
      }
    });
  }
}
