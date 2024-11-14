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
  List<Datum>? events;

  Future<void> eventRequested() async {
    emit(EventLoading());
    Response response = await api.getData(
        URL: constants.getEventsURL,
        queryParameters: constants.eventsQueryParameters);
    if (response.statusCode == 200) {
      events = EventResponse.fromJson(response.data).data;
      emit(EventSuccess());
    } else {
      emit(EventError());
    }
  }
}
