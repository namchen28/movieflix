// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cast_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CastResponseImpl _$$CastResponseImplFromJson(Map<String, dynamic> json) =>
    _$CastResponseImpl(
      id: json['id'] as int?,
      cast: (json['cast'] as List<dynamic>)
          .map((e) => CastModels.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CastResponseImplToJson(_$CastResponseImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'cast': instance.cast,
    };
