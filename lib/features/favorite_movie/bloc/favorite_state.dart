part of 'favorite_bloc.dart';

@immutable
class FavoriteState {}

class FavoriteActionState extends FavoriteState {}

class FavoriteMoviesInitial extends FavoriteState {}

class FavoriteMoviesLoading extends FavoriteState {}

class FavoriteMoviesLoadedState extends FavoriteState {
  final List<Movies> movies;

  FavoriteMoviesLoadedState({
    required this.movies,
  });
}

class FavoriteMoviesErrorState extends FavoriteState {
  final String message;

  FavoriteMoviesErrorState({
    required this.message,
  });
}

class FavoriteMovieRemoveMovieState extends FavoriteActionState {}

class FavoriteMovieRemoveSuccessState extends FavoriteState {
  final List<Movies> movies;

  FavoriteMovieRemoveSuccessState({
    required this.movies,
  });
}

class FavoriteMovieClickedState extends FavoriteActionState {
  final Movies movie;

  FavoriteMovieClickedState({
    required this.movie,
  });
}
