import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movieflix/data/service/repositories.dart';
import 'package:movieflix/data/model/movies_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final Api _api = Api(Dio());
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(homeInitialEvent);
    on<HomeMovieClickedEvent>(homeMovieClickedEvent);
  }

  FutureOr<void> homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      List<Movies> moviesPopular = await _api.getPopularMovies();
      List<Movies> upComingMovies = await _api.getUpcomingMovies();
      List<Movies> moviesTrending = await _api.getTrendingMovies();
      List<Movies> moviesTopRated = await _api.getTopRatedMovies();

      emit(HomeLoadingSuccessState(
        popularMovies: moviesPopular,
        trendingMovies: moviesTrending,
        upComingMovies: upComingMovies,
        topRatedMovies: moviesTopRated,
      ));
    } catch (e) {
      emit(HomeLoadingErrorState());
    }
  }

  FutureOr<void> homeMovieClickedEvent(
      HomeMovieClickedEvent event, Emitter<HomeState> emit) {
    emit(HomeMovieClickedState(movie: event.movieId));
  }
}
