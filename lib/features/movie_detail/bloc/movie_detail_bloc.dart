import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'package:movieflix/data/service/repositories.dart';
import 'package:movieflix/data/model/cast_model.dart';
import 'package:movieflix/data/model/movies_model.dart';
import 'package:movieflix/data/model/review_model.dart';
import 'package:movieflix/data/model/video_model.dart';
import 'package:movieflix/features/favorite_movie/data/favorite_repo.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final Api _api = Api(Dio());
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailInitialEvent>(movieDetailInitialEvent);
    on<WatchTrailerNavigateEvent>(watchTrailerNavigateEvent);
    on<AddToFavoriteListEvent>(addToFavoriteListEvent);
    on<RemoveFromFavoriteListEvent>(removeFromFavoriteListEvent);
  }

  FutureOr<void> movieDetailInitialEvent(
      MovieDetailInitialEvent event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoadingState());
    List<CastModels> cast = await _api.getMovieCast(event.movieId.id);
    List<VideoModel> video = await _api.getMovieVideos(event.movieId.id);
    List<ReviewModel> review = await _api.getMovieReviews(event.movieId.id);
    List<Movies> similarMovie = await _api.getSimilarMovies(event.movieId.id);
    emit(MovieDetailLoadingSuccessState(
      movieDetail: event.movieId,
      cast: cast,
      video: video,
      review: review,
      similarMovies: similarMovie,
    ));
  }

  FutureOr<void> watchTrailerNavigateEvent(
      WatchTrailerNavigateEvent event, Emitter<MovieDetailState> emit) async {
    List<VideoModel> video = await _api.getMovieVideos(event.movieId.id);
    if (video.isNotEmpty) {
      emit(WatchTrailerNavigateState(videoId: video[0].key!));
    } else {
      emit(WatchTrailerErrorState());
    }

    // emit(WatchTrailerNavigateState(videoId: video[0].key!));
  }

  FutureOr<void> addToFavoriteListEvent(
      AddToFavoriteListEvent event, Emitter<MovieDetailState> emit) async {
    try {
      await FavoriteRepo().addToFavorite(event.movie);
      emit(AddToFavoriteListState(movieDetail: event.movie));
    } catch (e) {
      emit(MovieDetailErrorState());
    }
  }

  FutureOr<void> removeFromFavoriteListEvent(
      RemoveFromFavoriteListEvent event, Emitter<MovieDetailState> emit) async {
    try {
      await FavoriteRepo().removeFromFavorite(event.movie);
      emit(RemoveFromFavoriteListState(movieDetail: event.movie));
    } catch (e) {
      emit(MovieDetailErrorState());
    }
  }
}
