import 'package:dio/dio.dart';
import 'package:movieflix/utils/constants.dart';
import 'package:movieflix/data/model/cast_model.dart';
import 'package:movieflix/data/model/review_model.dart';
import 'package:movieflix/data/model/movies_model.dart';
import 'package:movieflix/data/model/video_model.dart';
import 'package:movieflix/data/service/services.dart';

class Api {
  final MovieService _movieService;

  Api(Dio dio) : _movieService = MovieService(dio);

  Future<List<Movies>> getPopularMovies() async {
    final response = await _movieService.getPopularMovies(Constant.apiKey);
    return response.results;
  }

  Future<List<Movies>> getTopRatedMovies() async {
    final response = await _movieService.getTopRatedMovies(Constant.apiKey);
    return response.results;
  }

  Future<List<Movies>> getTrendingMovies() async {
    final response = await _movieService.getTrendingMovies(Constant.apiKey);
    return response.results;
  }

  Future<List<Movies>> getUpcomingMovies() async {
    final response = await _movieService.getUpcomingMovies(Constant.apiKey);
    return response.results;
  }

  Future<List<Movies>> getSimilarMovies(int movieId) async {
    final response =
        await _movieService.getSimilarMovies(movieId, Constant.apiKey);
    return response.results;
  }

  Future<Movies> fetchMovieDetails(int movieId) async {
    final response =
        await _movieService.fetchMovieDetails(movieId, Constant.apiKey);
    return response;
  }

  Future<List<ReviewModel>> getMovieReviews(int movieId) async {
    final response = await _movieService.movieReview(movieId, Constant.apiKey);
    return response.results;
  }

  Future<List<CastModels>> getMovieCast(int movieId) async {
    final response = await _movieService.movieCast(movieId, Constant.apiKey);
    return response.cast;
  }

  Future<List<VideoModel>> getMovieVideos(int movieId) async {
    final response = await _movieService.movieVideo(movieId, Constant.apiKey);
    return response.results;
  }

  Future<List<Movies>> searchMovie(String query) async {
    List<Movies> search = [];
    try {
      final response = await _movieService.searchMovie(Constant.apiKey, query);
      search = List<Movies>.from(
          response.results.map((movie) => Movies.fromJson(movie.toJson())));

      return search;
    } catch (e) {
      throw Exception(e);
    }
  }
}
