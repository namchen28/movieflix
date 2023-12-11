part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeMovieClickedEvent extends HomeEvent {
  final Movies movieId;

  HomeMovieClickedEvent({required this.movieId});
}
