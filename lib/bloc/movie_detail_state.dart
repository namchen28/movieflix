part of 'movie_detail_bloc.dart';

@immutable
abstract class MovieDetailState {}

class MovieDetailInitial extends MovieDetailState {}

class MovieDetailActionState extends MovieDetailState {}

class MovieDetailLoadingState extends MovieDetailState {}

class MovieDetailErrorState extends MovieDetailState {}

class MovieDetailLoadingSuccessState extends MovieDetailState {
  final Movies movieDetail;
  final List<CastModels> cast;
  final List<VideoModel> video;
  final List<ReviewModel> review;

  MovieDetailLoadingSuccessState({
    required this.movieDetail,
    required this.cast,
    required this.video,
    required this.review,
  });
}

class WatchTrailerNavigateState extends MovieDetailActionState {
  final String videoId;

  WatchTrailerNavigateState({required this.videoId});
}

class AddToFavoriteListState extends MovieDetailActionState {
  final Movies movieDetail;

  AddToFavoriteListState({required this.movieDetail});
}
