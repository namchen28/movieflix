import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movieflix/constants.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    String? authorName,
    String? authorUserName,
    String? avatarUrl,
    double? rating,
    String? content,
    String? elapsedTime,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}
