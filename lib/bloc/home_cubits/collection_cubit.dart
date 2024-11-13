import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tickity/constants.dart' as constants;
import 'package:flutter/material.dart';

import '../../API/api.dart';
import '../../modal/collection.dart';

part 'collection_state.dart';

class CollectionCubit extends Cubit<CollectionState> {
  CollectionCubit() : super(CollectionLoading());
  API api = API();
  List<Collections>? collections;

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
}
