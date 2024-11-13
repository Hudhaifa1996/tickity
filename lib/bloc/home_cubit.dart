import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tickity/bloc/cubit/login_cubit.dart';
import 'package:tickity/modal/category.dart';
import '../API/api.dart';
import 'package:tickity/constants.dart' as constants;

import '../modal/collection.dart';
import '../modal/event.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(CollectionLoading());
  API api = API();
  List<Collections>? collections;
  List<Categories>? categories;
  List<Data>? events;

  Future<void> collectionRequested() async {
    emit(CollectionLoading());
    Response response = await api.getData(URL: constants.getCollectionsURL);
    if (response.statusCode == 200) {
      collections = CollectionResponse.fromJson(response.data).collections;
      emit(CollectionSuccess());
    } else {
      emit(CollectionError());
    }
  }

  Future<void> categoryRequested() async {
    emit(CategoryLoading());
    Response response = await api.getData(URL: constants.getCategoriesURL);
    if (response.statusCode == 200) {
      categories = CategoryResponse.fromJson(response.data).categories;
      emit(CategorySuccess());
    } else {
      emit(CategoryError());
    }
  }

  Future<void> eventRequested() async {
    emit(EventLoading());
    Response response = await api.getData(URL: constants.getEventsURL, queryParameters: constants.eventsQueryParameters);
    if (response.statusCode == 200) {
      events = EventResponse.fromJson(response.data).data;
      emit(EventSuccess());
    } else {
      emit(EventError());
    }
  }

}
