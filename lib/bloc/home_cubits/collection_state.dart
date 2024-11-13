part of 'collection_cubit.dart';

@immutable
sealed class CollectionState {}

final class CollectionLoading extends CollectionState {}

final class CollectionSuccess extends CollectionState {}

final class CollectionError extends CollectionState {}
