part of 'search_bloc.dart';

@immutable
abstract class SearchState {}

abstract class SearchActionState extends SearchState {}

class SearchInitial extends SearchState {}

class SearchLoadingState extends SearchState {}

class SearchErrorState extends SearchState {}

class SearchLoadingSuccessState extends SearchState {
  final List<Movies> movieList;

  SearchLoadingSuccessState({
    required this.movieList,
  });
}

class SearchingState extends SearchActionState {
  final String query;

  SearchingState({
    required this.query,
  });
}

class SearchMovieClickedState extends SearchActionState {
  final Movies movie;

  SearchMovieClickedState({
    required this.movie,
  });
}
