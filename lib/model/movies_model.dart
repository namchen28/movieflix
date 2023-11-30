import 'package:freezed_annotation/freezed_annotation.dart';

part 'movies_model.freezed.dart';
part 'movies_model.g.dart';

@freezed
class Movies with _$Movies {
  const factory Movies({
    required int id,
    @JsonKey(name: 'backdrop_path') String? backdropPath,
    String? title,
    String? overview,
    @JsonKey(name: 'poster_path') String? posterPath,
    @JsonKey(name: 'release_date') String? releaseDate,
    @JsonKey(name: 'vote_average') double? voteAverage,
    @JsonKey(name: 'vote_count') int? voteCount,
  }) = _Movies;

  factory Movies.fromJson(Map<String, dynamic> json) => _$MoviesFromJson(json);
}
