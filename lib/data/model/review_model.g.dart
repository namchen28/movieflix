// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReviewModelImpl _$$ReviewModelImplFromJson(Map<String, dynamic> json) =>
    _$ReviewModelImpl(
      id: json['id'] as String?,
      author: json['author'] as String?,
      content: json['content'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      url: json['url'] as String?,
      authorDetails: json['author_details'] == null
          ? null
          : ReviewAuthorDetails.fromJson(
              json['author_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ReviewModelImplToJson(_$ReviewModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'author': instance.author,
      'content': instance.content,
      'created_at': instance.createdAt?.toIso8601String(),
      'url': instance.url,
      'author_details': instance.authorDetails,
    };

_$ReviewAuthorDetailsImpl _$$ReviewAuthorDetailsImplFromJson(
        Map<String, dynamic> json) =>
    _$ReviewAuthorDetailsImpl(
      name: json['name'] as String?,
      username: json['username'] as String?,
      avatarPath: json['avatar_path'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$ReviewAuthorDetailsImplToJson(
        _$ReviewAuthorDetailsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'username': instance.username,
      'avatar_path': instance.avatarPath,
      'rating': instance.rating,
    };
