import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movieflix/api.dart';
import 'package:movieflix/favorite_repo.dart';
import 'package:movieflix/model/movies_model.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final Api _api = Api(Dio());
  FavoriteBloc() : super(FavoriteMoviesInitial()) {
    on<FavoriteMoviesInitialEvent>(favoriteMoviesInitialEvent);
    on<FavoriteRemoveMovieEvent>(favoriteRemoveMovieEvent);
    on<FavoriteMovieClickedEvent>(favoriteMovieClickedEvent);
  }

  FutureOr<void> favoriteMoviesInitialEvent(
      FavoriteMoviesInitialEvent event, Emitter<FavoriteState> emit) async {
    try {
      emit(FavoriteMoviesLoading());
      List<String?> movieId = await FavoriteRepo().getFavoriteMovieIds();
      List<Movies> favoriteMovies = [];
      print("movieId: ${movieId.runtimeType}");
      for (var id in movieId) {
        final idInt = int.parse(id!);
        Movies movie = (await _api.fetchMovieDetails(idInt));
        favoriteMovies.add(movie);
      }
      emit(FavoriteMoviesLoadedState(movies: favoriteMovies));
    } catch (e) {
      emit(FavoriteMoviesErrorState(message: e.toString()));
    }
  }

  FutureOr<void> favoriteRemoveMovieEvent(
      FavoriteRemoveMovieEvent event, Emitter<FavoriteState> emit) async {
    try {
      await FavoriteRepo().removeMovieFromFavorites(event.movie.id);
      emit(FavoriteMoviesLoading());
      emit(FavoriteMovieRemoveMovieState());
      List<String?> movieId = await FavoriteRepo().getFavoriteMovieIds();
      List<Movies> favoriteMovies = [];
      print("movieIdRemove: ${movieId.runtimeType}");
      for (var id in movieId) {
        final idInt = int.parse(id!);
        Movies movie = (await _api.fetchMovieDetails(idInt));
        favoriteMovies.add(movie);
      }
      emit(FavoriteMoviesLoadedState(movies: favoriteMovies));
    } catch (e) {
      emit(FavoriteMoviesErrorState(message: e.toString()));
    }
  }

  FutureOr<void> favoriteMovieClickedEvent(
      FavoriteMovieClickedEvent event, Emitter<FavoriteState> emit) {
    emit(FavoriteMovieClickedState(movie: event.movie));
  }
}
