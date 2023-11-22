part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeErrorState extends HomeState {}

class HomeLoadingSuccessState extends HomeState {
  final List<Movies> popularMovies;
  final List<Movies> trendingMovies;
  final List<Movies> upComingMovies;
  final List<Movies> topRatedMovies;

  HomeLoadingSuccessState(
      {required this.popularMovies,
      required this.trendingMovies,
      required this.upComingMovies,
      required this.topRatedMovies});
}

class HomeLoadingErrorState extends HomeState {}

class HomeMovieClickedState extends HomeActionState {
  final Movies movie;

  HomeMovieClickedState({required this.movie});
}
