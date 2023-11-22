import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movieflix/model/review_model.dart';

part 'review_response.freezed.dart';
part 'review_response.g.dart';

@freezed
class ReviewResponse with _$ReviewResponse {
  const factory ReviewResponse({
    int? page,
    required List<ReviewModel> results,
    int? totalPages,
    int? totalResults,
  }) = _ReviewResponse;

  factory ReviewResponse.fromJson(Map<String, dynamic> json) =>
      _$ReviewResponseFromJson(json);
}
