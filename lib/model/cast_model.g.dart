// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CastModelsImpl _$$CastModelsImplFromJson(Map<String, dynamic> json) =>
    _$CastModelsImpl(
      adult: json['adult'] as bool?,
      gender: json['gender'] as int?,
      id: json['id'] as int?,
      knownForDepartment: json['knownForDepartment'] as String?,
      name: json['name'] as String?,
      originalName: json['originalName'] as String?,
      popularity: (json['popularity'] as num?)?.toDouble(),
      profilePath: json['profile_path'] as String?,
      castId: json['castId'] as int?,
      character: json['character'] as String?,
      creditId: json['creditId'] as String?,
      order: json['order'] as int?,
    );

Map<String, dynamic> _$$CastModelsImplToJson(_$CastModelsImpl instance) =>
    <String, dynamic>{
      'adult': instance.adult,
      'gender': instance.gender,
      'id': instance.id,
      'knownForDepartment': instance.knownForDepartment,
      'name': instance.name,
      'originalName': instance.originalName,
      'popularity': instance.popularity,
      'profile_path': instance.profilePath,
      'castId': instance.castId,
      'character': instance.character,
      'creditId': instance.creditId,
      'order': instance.order,
    };
