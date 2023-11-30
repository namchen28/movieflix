import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:movieflix/api.dart';
import 'package:movieflix/model/movies_model.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final Api _api = Api(Dio());
  SearchBloc() : super(SearchInitial()) {
    on<SearchInitialEvent>(searchInitialEvent);
    on<SearchQueryEvent>(searchQueryEvent);
    on<SearchMovieClickedEvent>(searchMovieClickedEvent);
  }

  FutureOr<void> searchInitialEvent(
      SearchInitialEvent event, Emitter<SearchState> emit) {
    emit(SearchLoadingState());
    List<Movies> searchRepo = [];
    emit(SearchLoadingSuccessState(movieList: searchRepo));
  }

  FutureOr<void> searchQueryEvent(
      SearchQueryEvent event, Emitter<SearchState> emit) async {
    emit(SearchingState(query: event.query));
    List<Movies> searchRepo = await _api.searchMovie(event.query);
    emit(SearchLoadingSuccessState(movieList: searchRepo));
  }

  FutureOr<void> searchMovieClickedEvent(
      SearchMovieClickedEvent event, Emitter<SearchState> emit) {
    emit(SearchMovieClickedState(movie: event.movie));
  }
}
