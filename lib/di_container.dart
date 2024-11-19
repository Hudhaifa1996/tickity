import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'API/api.dart';
import 'bloc/home_cubits/event_cubit.dart';
import 'bloc/signup_cubit.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton<Dio>(() => Dio());
  locator.registerLazySingleton<SignupCubit>(() => SignupCubit());
  locator.registerLazySingleton<EventCubit>(() => EventCubit());
  locator.registerLazySingleton<API>(() => API());
}
