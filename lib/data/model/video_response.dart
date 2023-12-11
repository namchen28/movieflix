import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:movieflix/data/model/video_model.dart';

part 'video_response.freezed.dart';
part 'video_response.g.dart';

@freezed
class VideoResponse with _$VideoResponse {
  const factory VideoResponse({
    int? page,
    required List<VideoModel> results,
    int? totalPages,
    int? totalResults,
  }) = _VideoResponse;

  factory VideoResponse.fromJson(Map<String, dynamic> json) =>
      _$VideoResponseFromJson(json);
}
