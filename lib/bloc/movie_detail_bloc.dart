import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import 'package:movieflix/api.dart';
import 'package:movieflix/favorite_repo.dart';
import 'package:movieflix/model/cast_model.dart';
import 'package:movieflix/model/movies_model.dart';
import 'package:movieflix/model/review_model.dart';
import 'package:movieflix/model/video_model.dart';

part 'movie_detail_event.dart';
part 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final Api _api = Api(Dio());
  MovieDetailBloc() : super(MovieDetailInitial()) {
    on<MovieDetailInitialEvent>(movieDetailInitialEvent);
    on<WatchTrailerNavigateEvent>(watchTrailerNavigateEvent);
    on<AddToFavoriteListEvent>(addToFavoriteListEvent);
  }

  FutureOr<void> movieDetailInitialEvent(
      MovieDetailInitialEvent event, Emitter<MovieDetailState> emit) async {
    emit(MovieDetailLoadingState());
    List<CastModels> cast = await _api.getMovieCast(event.movieId.id);
    List<VideoModel> video = await _api.getMovieVideos(event.movieId.id);
    List<ReviewModel> review = await _api.getMovieReviews(event.movieId.id);
    emit(MovieDetailLoadingSuccessState(
      movieDetail: event.movieId,
      cast: cast,
      video: video,
      review: review,
    ));
  }

  FutureOr<void> watchTrailerNavigateEvent(
      WatchTrailerNavigateEvent event, Emitter<MovieDetailState> emit) async {
    List<VideoModel> video = await _api.getMovieVideos(event.movieId.id);

    emit(WatchTrailerNavigateState(videoId: video[0].key!));
  }

  FutureOr<void> addToFavoriteListEvent(
      AddToFavoriteListEvent event, Emitter<MovieDetailState> emit) async {
    try {
      await FavoriteRepo().switchFavoriteMovie(event.movie);
      emit(AddToFavoriteListState(movieDetail: event.movie));
    } catch (e) {
      emit(MovieDetailErrorState());
    }
  }
}
