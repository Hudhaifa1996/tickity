import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tickity/modal/category.dart';
import '../API/api.dart';
import 'package:tickity/constants.dart' as constants;
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(const HomeState());
  API api = API();
  List<Categories>? a;
  Future<void> eventsRequested() async {
    Response response = await api.getData(URL: constants.getCategoriesURL);
    // final List<dynamic> jsonData = json.decode(response.data);
    // final Map parsed = json.decode(response);
    // final signUp = CategoryResponse.fromJson(parsed);
    //assuming this json returns an array of signupresponse objects
    // List<dynamic> parsedList =jsonDecode(response.data).toList();
    if (response.statusCode == 200) {
      // var jsonData = response.data;
      // print(List);
       // print(jsonData.map((json) => CategoryResponse.fromJson(json)).toList());
       a = CategoryResponse.fromJson(response.data).categories;
      print( a?[1].name);

    } else {
      throw Exception('Failed to load users');
    }

    // List<CategoryResponse> list = parsedList.map((val) =>  CategoryResponse.fromJson(val)).toList();
    // List<dynamic> a = jsonData.map((json) => CategoryResponse.fromJson(response.data)).toList();
    // print(parsedList.toString());
    // emit(state.copyWith(events: eventData));
  }



}
