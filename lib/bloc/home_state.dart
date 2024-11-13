part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class CollectionLoading extends HomeState {}

final class CollectionSuccess extends HomeState {}

final class CollectionError extends HomeState {}

final class CategoryLoading extends HomeState {}

final class CategorySuccess extends HomeState {}

final class CategoryError extends HomeState {}

final class EventLoading extends HomeState {}

final class EventSuccess extends HomeState {}

final class EventError extends HomeState {}
