part of 'home_cubit.dart';

@immutable
class HomeState {
  final List<dynamic> events;

  const HomeState({
    this.events = const [],
  });
  
  HomeState copyWith({
    List<dynamic>? events,
  }) {
    return HomeState(
      events: events ?? this.events,
    );
  }
}
