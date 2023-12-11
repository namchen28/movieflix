import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

import 'package:movieflix/data/model/cast_model.dart';

part 'cast_response.freezed.dart';
part 'cast_response.g.dart';

CastResponse castResponseFromJson(String str) =>
    CastResponse.fromJson(json.decode(str));

String castResponseToJson(CastResponse data) => json.encode(data.toJson());

@freezed
class CastResponse with _$CastResponse {
  const factory CastResponse({
    int? id,
    required List<CastModels> cast,
  }) = _CastResponse;

  factory CastResponse.fromJson(Map<String, dynamic> json) =>
      _$CastResponseFromJson(json);
}
