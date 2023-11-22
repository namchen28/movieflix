// import 'dart:convert';

// import 'package:movieflix/constants.dart';
// import 'package:movieflix/model/cast_model.dart';
// import 'package:movieflix/model/review_model.dart';
// import 'package:movieflix/model/trending_movies.dart';
// import 'package:http/http.dart' as http;
// import 'package:movieflix/model/video_model.dart';

// class Api {
//   static const _trendingUrl =
//       'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constant.apiKey}';

//   static const _topRatedUrl =
//       'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constant.apiKey}';

//   static const _upComingUrl =
//       'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constant.apiKey}';

//   static const _popularUrl =
//       'https://api.themoviedb.org/3/movie/popular?api_key=${Constant.apiKey}';

// Future<List<Movies>> getTrendingMovies() async {
//   final response = await http.get(Uri.parse(_trendingUrl));
//   print('Trending Movies API Response: ${response.body}');
//   if (response.statusCode == 200) {
//     final decodedData = json.decode(response.body)['results'] as List;
//     return decodedData.map((movie) => Movies.fromJson(movie)).toList();
//   } else {
//     throw Exception('Error');
//   }
// }

//   Future<List<Movies>> getTopRatedMovies() async {
//     final response = await http.get(Uri.parse(_topRatedUrl));
//     if (response.statusCode == 200) {
//       final decodedData = json.decode(response.body)['results'] as List;
//       return decodedData.map((movie) => Movies.fromJson(movie)).toList();
//     } else {
//       throw Exception('Error');
//     }
//   }

//   Future<List<Movies>> getUpcomingMovies() async {
//     final response = await http.get(Uri.parse(_upComingUrl));
//     if (response.statusCode == 200) {
//       final decodedData = json.decode(response.body)['results'] as List;
//       return decodedData.map((movie) => Movies.fromJson(movie)).toList();
//     } else {
//       throw Exception('Error');
//     }
//   }

//   Future<List<Movies>> getPopularMovies() async {
//     final response = await http.get(Uri.parse(_popularUrl));
//     if (response.statusCode == 200) {
//       final decodedData = json.decode(response.body)['results'] as List;
//       return decodedData.map((movie) => Movies.fromJson(movie)).toList();
//     } else {
//       throw Exception('Error');
//     }
//   }

//   Future<Movies> fetchMovieDetails(String movieId) async {
//     final url = Uri.parse(
//         'https://api.themoviedb.org/3/movie/$movieId?api_key=${Constant.apiKey}');

//     try {
//       final response = await http.get(url);
//       if (response.statusCode == 200) {
//         final movieData = json.decode(response.body);
//         return Movies.fromJson(movieData);
//       } else {
//         throw Exception('Failed to fetch movie details');
//       }
//     } catch (error) {
//       throw Exception('Failed to fetch movie details');
//     }
//   }

//   Future<List<CastModels>> movieCast(int movieId) async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//             'https://api.themoviedb.org/3/movie/$movieId/credits?api_key=${Constant.apiKey}'),
//       );
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonList = json.decode(response.body)['cast'];
//         return jsonList.map((json) => CastModels.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed ');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<List<VideoModel>> movieVideo(int movieId) async {
//     var client = http.Client();
//     try {
//       final response = await client.get(
//         Uri.parse(
//             'https://api.themoviedb.org/3/movie/$movieId/videos?api_key=${Constant.apiKey}'),
//       );
//       final List<dynamic> jsonList = json.decode(response.body)['results'];
//       return jsonList.map((json) => VideoModel.fromJson(json)).toList();
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<List<ReviewModel>> movieReview(int movieId) async {
//     try {
//       final response = await http.get(
//         Uri.parse(
//             'https://api.themoviedb.org/3/movie/$movieId/reviews?api_key=${Constant.apiKey}'),
//       );
//       print('${response.body}');
//       if (response.statusCode == 200) {
//         final List<dynamic> jsonList = json.decode(response.body)['results'];
//         return jsonList.map((json) => ReviewModel.fromJson(json)).toList();
//       } else {
//         throw Exception('Failed ');
//       }
//     } catch (e) {
//       throw Exception(e);
//     }
//   }

//   Future<List<Movies>> searchMovie(String query) async {
//     var client = http.Client();
//     List<Movies> search = [];
//     try {
//       final response = await client.get(
//         Uri.parse(
//             'https://api.themoviedb.org/3/search/movie?api_key=${Constant.apiKey}&query=$query'),
//       );
//       print(response.body);
//       var data = json.decode(response.body);
//       List results = data['results'];
//       for (int i = 0; i < results.length; i++) {
//         search.add(Movies.fromJson(results[i]));
//       }
//       return search;
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:movieflix/constants.dart';
import 'package:movieflix/model/cast_model.dart';
import 'package:movieflix/model/review_model.dart';
import 'package:movieflix/model/movies_model.dart';
import 'package:movieflix/model/video_model.dart';
import 'package:movieflix/services.dart';

class Api {
  final MovieService _movieService;

  Api(Dio dio) : _movieService = MovieService(dio);

  Future<List<Movies>> getPopularMovies() async {
    final response = await _movieService.getPopularMovies(Constant.apiKey);
    print(response.toString());
    return response.results;
  }

  Future<List<Movies>> getTopRatedMovies() async {
    final response = await _movieService.getTopRatedMovies(Constant.apiKey);
    print(await response.toString());
    return response.results;
  }

  Future<List<Movies>> getTrendingMovies() async {
    final response = await _movieService.getTrendingMovies(Constant.apiKey);
    print(await response.toString());
    return response.results;
  }

  Future<List<Movies>> getUpcomingMovies() async {
    final response = await _movieService.getUpcomingMovies(Constant.apiKey);
    print(await response.toString());
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
      final response = await _movieService.searchMovie(query, Constant.apiKey);

      List results = response.results;
      for (int i = 0; i < results.length; i++) {
        search.add(Movies.fromJson(results[i]));
      }
      return search;
    } catch (e) {
      throw Exception(e);
    }
  }
}
