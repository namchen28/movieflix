// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      authorName: json['authorName'] as String?,
      authorUserName: json['authorUserName'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      content: json['content'] as String?,
      elapsedTime: json['elapsedTime'] as String?,
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'authorName': instance.authorName,
      'authorUserName': instance.authorUserName,
      'avatarUrl': instance.avatarUrl,
      'rating': instance.rating,
      'content': instance.content,
      'elapsedTime': instance.elapsedTime,
    };
