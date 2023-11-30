import 'package:freezed_annotation/freezed_annotation.dart';

part 'review_model.freezed.dart';
part 'review_model.g.dart';

@freezed
class ReviewModel with _$ReviewModel {
  const factory ReviewModel({
    @JsonKey(name: 'id') String? id,
    @JsonKey(name: 'author') String? author,
    @JsonKey(name: 'content') String? content,
    @JsonKey(name: 'created_at') DateTime? createdAt,
    @JsonKey(name: 'url') String? url,
    @JsonKey(name: 'author_details') ReviewAuthorDetails? authorDetails,
  }) = _ReviewModel;

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
}

@freezed
class ReviewAuthorDetails with _$ReviewAuthorDetails {
  const factory ReviewAuthorDetails({
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'username') String? username,
    @JsonKey(name: 'avatar_path') String? avatarPath,
    @JsonKey(name: 'rating') double? rating,
  }) = _ReviewAuthorDetails;

  factory ReviewAuthorDetails.fromJson(Map<String, dynamic> json) =>
      _$ReviewAuthorDetailsFromJson(json);
}
