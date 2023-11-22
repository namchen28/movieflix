import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:movieflix/model/movies_model.dart';

part 'movie_response.freezed.dart';
part 'movie_response.g.dart';

@freezed
class MovieResponse with _$MovieResponse {
  const factory MovieResponse({
    int? page,
    required List<Movies> results,
    int? totalPages,
    int? totalResults,
  }) = _MovieResponse;

  factory MovieResponse.fromJson(Map<String, dynamic> json) =>
      _$MovieResponseFromJson(json);
}
