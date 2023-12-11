import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:movieflix/data/model/cast_response.dart';
import 'package:movieflix/data/model/movie_response.dart';
import 'package:movieflix/data/model/movies_model.dart';
import 'package:movieflix/data/model/review_response.dart';
import 'package:movieflix/data/model/video_response.dart';

part "services.g.dart";

@RestApi(baseUrl: 'https://api.themoviedb.org/3')
abstract class MovieService {
  factory MovieService(Dio dio, {String baseUrl}) = _MovieService;

  @GET('/trending/movie/day')
  Future<MovieResponse> getTrendingMovies(@Query('api_key') String apiKey);

  @GET('/movie/top_rated')
  Future<MovieResponse> getTopRatedMovies(@Query('api_key') String apiKey);

  @GET('/movie/upcoming')
  Future<MovieResponse> getUpcomingMovies(@Query('api_key') String apiKey);

  @GET('/movie/popular')
  Future<MovieResponse> getPopularMovies(@Query('api_key') String apiKey);

  @GET('/movie/{movieId}')
  Future<Movies> fetchMovieDetails(
    @Path('movieId') int movieId,
    @Query('api_key') String apiKey,
  );

  @GET('/movie/{movieId}/credits')
  Future<CastResponse> movieCast(
    @Path('movieId') int movieId,
    @Query('api_key') String apiKey,
  );

  @GET('/movie/{movieId}/videos')
  Future<VideoResponse> movieVideo(
    @Path('movieId') int movieId,
    @Query('api_key') String apiKey,
  );

  @GET('/movie/{movieId}/reviews')
  Future<ReviewResponse> movieReview(
    @Path('movieId') int movieId,
    @Query('api_key') String apiKey,
  );

  @GET('/search/movie')
  Future<MovieResponse> searchMovie(
    @Query('api_key') String apiKey,
    @Query('query') String query,
  );

  @GET('/movie/{movieId}/similar')
  Future<MovieResponse> getSimilarMovies(
    @Path('movieId') int movieId,
    @Query('api_key') String apiKey,
  );
}
