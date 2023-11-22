import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_model.freezed.dart';
part 'movies_model.g.dart';

@freezed
class Movies with _$Movies {
  const factory Movies({
    required int id,
    String? backdropPath,
    String? title,
    String? overview,
    String? posterPath,
    String? releaseDate,
    double? voteAverage,
    int? voteCount,
  }) = _Movies;

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}
