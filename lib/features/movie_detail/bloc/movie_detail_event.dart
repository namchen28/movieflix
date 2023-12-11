// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailEvent {}

class MovieDetailInitialEvent extends MovieDetailEvent {
  final Movies movieId;

  MovieDetailInitialEvent({
    required this.movieId,
  });
}

class WatchTrailerNavigateEvent extends MovieDetailEvent {
  final Movies movieId;

  WatchTrailerNavigateEvent({
    required this.movieId,
  });
}

class AddToFavoriteListEvent extends MovieDetailEvent {
  final Movies movie;

  AddToFavoriteListEvent({
    required this.movie,
  });
}

class RemoveFromFavoriteListEvent extends MovieDetailEvent {
  final Movies movie;

  RemoveFromFavoriteListEvent({
    required this.movie,
  });
}
