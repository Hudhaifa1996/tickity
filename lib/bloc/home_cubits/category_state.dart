part of 'category_cubit.dart';

@immutable
sealed class CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategorySuccess extends CategoryState {}

final class CategoryError extends CategoryState {}
