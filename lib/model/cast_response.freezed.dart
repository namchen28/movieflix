// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cast_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CastResponse _$CastResponseFromJson(Map<String, dynamic> json) {
  return _CastResponse.fromJson(json);
}

/// @nodoc
mixin _$CastResponse {
  int? get id => throw _privateConstructorUsedError;
  List<CastModels> get cast => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CastResponseCopyWith<CastResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CastResponseCopyWith<$Res> {
  factory $CastResponseCopyWith(
          CastResponse value, $Res Function(CastResponse) then) =
      _$CastResponseCopyWithImpl<$Res, CastResponse>;
  @useResult
  $Res call({int? id, List<CastModels> cast});
}

/// @nodoc
class _$CastResponseCopyWithImpl<$Res, $Val extends CastResponse>
    implements $CastResponseCopyWith<$Res> {
  _$CastResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cast = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cast: null == cast
          ? _value.cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastModels>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CastResponseImplCopyWith<$Res>
    implements $CastResponseCopyWith<$Res> {
  factory _$$CastResponseImplCopyWith(
          _$CastResponseImpl value, $Res Function(_$CastResponseImpl) then) =
      __$$CastResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? id, List<CastModels> cast});
}

/// @nodoc
class __$$CastResponseImplCopyWithImpl<$Res>
    extends _$CastResponseCopyWithImpl<$Res, _$CastResponseImpl>
    implements _$$CastResponseImplCopyWith<$Res> {
  __$$CastResponseImplCopyWithImpl(
      _$CastResponseImpl _value, $Res Function(_$CastResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? cast = null,
  }) {
    return _then(_$CastResponseImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      cast: null == cast
          ? _value._cast
          : cast // ignore: cast_nullable_to_non_nullable
              as List<CastModels>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CastResponseImpl implements _CastResponse {
  const _$CastResponseImpl({this.id, required final List<CastModels> cast})
      : _cast = cast;

  factory _$CastResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$CastResponseImplFromJson(json);

  @override
  final int? id;
  final List<CastModels> _cast;
  @override
  List<CastModels> get cast {
    if (_cast is EqualUnmodifiableListView) return _cast;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cast);
  }

  @override
  String toString() {
    return 'CastResponse(id: $id, cast: $cast)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CastResponseImpl &&
            (identical(other.id, id) || other.id == id) &&
            const DeepCollectionEquality().equals(other._cast, _cast));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, const DeepCollectionEquality().hash(_cast));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CastResponseImplCopyWith<_$CastResponseImpl> get copyWith =>
      __$$CastResponseImplCopyWithImpl<_$CastResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CastResponseImplToJson(
      this,
    );
  }
}

abstract class _CastResponse implements CastResponse {
  const factory _CastResponse(
      {final int? id,
      required final List<CastModels> cast}) = _$CastResponseImpl;

  factory _CastResponse.fromJson(Map<String, dynamic> json) =
      _$CastResponseImpl.fromJson;

  @override
  int? get id;
  @override
  List<CastModels> get cast;
  @override
  @JsonKey(ignore: true)
  _$$CastResponseImplCopyWith<_$CastResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
