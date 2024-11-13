import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:tickity/modal/category.dart';
import '../../API/api.dart';
import 'package:tickity/constants.dart' as constants;

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryLoading());
  API api = API();
  List<Categories>? categories;

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
}
