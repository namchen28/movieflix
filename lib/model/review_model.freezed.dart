// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return _ReviewModel.fromJson(json);
}

/// @nodoc
mixin _$ReviewModel {
  @JsonKey(name: 'id')
  String? get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'author')
  String? get author => throw _privateConstructorUsedError;
  @JsonKey(name: 'content')
  String? get content => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime? get createdAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'url')
  String? get url => throw _privateConstructorUsedError;
  @JsonKey(name: 'author_details')
  ReviewAuthorDetails? get authorDetails => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewModelCopyWith<ReviewModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewModelCopyWith<$Res> {
  factory $ReviewModelCopyWith(
          ReviewModel value, $Res Function(ReviewModel) then) =
      _$ReviewModelCopyWithImpl<$Res, ReviewModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'author_details') ReviewAuthorDetails? authorDetails});

  $ReviewAuthorDetailsCopyWith<$Res>? get authorDetails;
}

/// @nodoc
class _$ReviewModelCopyWithImpl<$Res, $Val extends ReviewModel>
    implements $ReviewModelCopyWith<$Res> {
  _$ReviewModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? url = freezed,
    Object? authorDetails = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      authorDetails: freezed == authorDetails
          ? _value.authorDetails
          : authorDetails // ignore: cast_nullable_to_non_nullable
              as ReviewAuthorDetails?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ReviewAuthorDetailsCopyWith<$Res>? get authorDetails {
    if (_value.authorDetails == null) {
      return null;
    }

    return $ReviewAuthorDetailsCopyWith<$Res>(_value.authorDetails!, (value) {
      return _then(_value.copyWith(authorDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewModelImplCopyWith<$Res>
    implements $ReviewModelCopyWith<$Res> {
  factory _$$ReviewModelImplCopyWith(
          _$ReviewModelImpl value, $Res Function(_$ReviewModelImpl) then) =
      __$$ReviewModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'id') String? id,
      @JsonKey(name: 'author') String? author,
      @JsonKey(name: 'content') String? content,
      @JsonKey(name: 'created_at') DateTime? createdAt,
      @JsonKey(name: 'url') String? url,
      @JsonKey(name: 'author_details') ReviewAuthorDetails? authorDetails});

  @override
  $ReviewAuthorDetailsCopyWith<$Res>? get authorDetails;
}

/// @nodoc
class __$$ReviewModelImplCopyWithImpl<$Res>
    extends _$ReviewModelCopyWithImpl<$Res, _$ReviewModelImpl>
    implements _$$ReviewModelImplCopyWith<$Res> {
  __$$ReviewModelImplCopyWithImpl(
      _$ReviewModelImpl _value, $Res Function(_$ReviewModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? author = freezed,
    Object? content = freezed,
    Object? createdAt = freezed,
    Object? url = freezed,
    Object? authorDetails = freezed,
  }) {
    return _then(_$ReviewModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      author: freezed == author
          ? _value.author
          : author // ignore: cast_nullable_to_non_nullable
              as String?,
      content: freezed == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
      authorDetails: freezed == authorDetails
          ? _value.authorDetails
          : authorDetails // ignore: cast_nullable_to_non_nullable
              as ReviewAuthorDetails?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewModelImpl implements _ReviewModel {
  const _$ReviewModelImpl(
      {@JsonKey(name: 'id') this.id,
      @JsonKey(name: 'author') this.author,
      @JsonKey(name: 'content') this.content,
      @JsonKey(name: 'created_at') this.createdAt,
      @JsonKey(name: 'url') this.url,
      @JsonKey(name: 'author_details') this.authorDetails});

  factory _$ReviewModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewModelImplFromJson(json);

  @override
  @JsonKey(name: 'id')
  final String? id;
  @override
  @JsonKey(name: 'author')
  final String? author;
  @override
  @JsonKey(name: 'content')
  final String? content;
  @override
  @JsonKey(name: 'created_at')
  final DateTime? createdAt;
  @override
  @JsonKey(name: 'url')
  final String? url;
  @override
  @JsonKey(name: 'author_details')
  final ReviewAuthorDetails? authorDetails;

  @override
  String toString() {
    return 'ReviewModel(id: $id, author: $author, content: $content, createdAt: $createdAt, url: $url, authorDetails: $authorDetails)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.author, author) || other.author == author) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.authorDetails, authorDetails) ||
                other.authorDetails == authorDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, author, content, createdAt, url, authorDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      __$$ReviewModelImplCopyWithImpl<_$ReviewModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewModelImplToJson(
      this,
    );
  }
}

abstract class _ReviewModel implements ReviewModel {
  const factory _ReviewModel(
      {@JsonKey(name: 'id') final String? id,
      @JsonKey(name: 'author') final String? author,
      @JsonKey(name: 'content') final String? content,
      @JsonKey(name: 'created_at') final DateTime? createdAt,
      @JsonKey(name: 'url') final String? url,
      @JsonKey(name: 'author_details')
      final ReviewAuthorDetails? authorDetails}) = _$ReviewModelImpl;

  factory _ReviewModel.fromJson(Map<String, dynamic> json) =
      _$ReviewModelImpl.fromJson;

  @override
  @JsonKey(name: 'id')
  String? get id;
  @override
  @JsonKey(name: 'author')
  String? get author;
  @override
  @JsonKey(name: 'content')
  String? get content;
  @override
  @JsonKey(name: 'created_at')
  DateTime? get createdAt;
  @override
  @JsonKey(name: 'url')
  String? get url;
  @override
  @JsonKey(name: 'author_details')
  ReviewAuthorDetails? get authorDetails;
  @override
  @JsonKey(ignore: true)
  _$$ReviewModelImplCopyWith<_$ReviewModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReviewAuthorDetails _$ReviewAuthorDetailsFromJson(Map<String, dynamic> json) {
  return _ReviewAuthorDetails.fromJson(json);
}

/// @nodoc
mixin _$ReviewAuthorDetails {
  @JsonKey(name: 'name')
  String? get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'username')
  String? get username => throw _privateConstructorUsedError;
  @JsonKey(name: 'avatar_path')
  String? get avatarPath => throw _privateConstructorUsedError;
  @JsonKey(name: 'rating')
  double? get rating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReviewAuthorDetailsCopyWith<ReviewAuthorDetails> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewAuthorDetailsCopyWith<$Res> {
  factory $ReviewAuthorDetailsCopyWith(
          ReviewAuthorDetails value, $Res Function(ReviewAuthorDetails) then) =
      _$ReviewAuthorDetailsCopyWithImpl<$Res, ReviewAuthorDetails>;
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'avatar_path') String? avatarPath,
      @JsonKey(name: 'rating') double? rating});
}

/// @nodoc
class _$ReviewAuthorDetailsCopyWithImpl<$Res, $Val extends ReviewAuthorDetails>
    implements $ReviewAuthorDetailsCopyWith<$Res> {
  _$ReviewAuthorDetailsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? username = freezed,
    Object? avatarPath = freezed,
    Object? rating = freezed,
  }) {
    return _then(_value.copyWith(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReviewAuthorDetailsImplCopyWith<$Res>
    implements $ReviewAuthorDetailsCopyWith<$Res> {
  factory _$$ReviewAuthorDetailsImplCopyWith(_$ReviewAuthorDetailsImpl value,
          $Res Function(_$ReviewAuthorDetailsImpl) then) =
      __$$ReviewAuthorDetailsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'name') String? name,
      @JsonKey(name: 'username') String? username,
      @JsonKey(name: 'avatar_path') String? avatarPath,
      @JsonKey(name: 'rating') double? rating});
}

/// @nodoc
class __$$ReviewAuthorDetailsImplCopyWithImpl<$Res>
    extends _$ReviewAuthorDetailsCopyWithImpl<$Res, _$ReviewAuthorDetailsImpl>
    implements _$$ReviewAuthorDetailsImplCopyWith<$Res> {
  __$$ReviewAuthorDetailsImplCopyWithImpl(_$ReviewAuthorDetailsImpl _value,
      $Res Function(_$ReviewAuthorDetailsImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = freezed,
    Object? username = freezed,
    Object? avatarPath = freezed,
    Object? rating = freezed,
  }) {
    return _then(_$ReviewAuthorDetailsImpl(
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      avatarPath: freezed == avatarPath
          ? _value.avatarPath
          : avatarPath // ignore: cast_nullable_to_non_nullable
              as String?,
      rating: freezed == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReviewAuthorDetailsImpl implements _ReviewAuthorDetails {
  const _$ReviewAuthorDetailsImpl(
      {@JsonKey(name: 'name') this.name,
      @JsonKey(name: 'username') this.username,
      @JsonKey(name: 'avatar_path') this.avatarPath,
      @JsonKey(name: 'rating') this.rating});

  factory _$ReviewAuthorDetailsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReviewAuthorDetailsImplFromJson(json);

  @override
  @JsonKey(name: 'name')
  final String? name;
  @override
  @JsonKey(name: 'username')
  final String? username;
  @override
  @JsonKey(name: 'avatar_path')
  final String? avatarPath;
  @override
  @JsonKey(name: 'rating')
  final double? rating;

  @override
  String toString() {
    return 'ReviewAuthorDetails(name: $name, username: $username, avatarPath: $avatarPath, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewAuthorDetailsImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.avatarPath, avatarPath) ||
                other.avatarPath == avatarPath) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, name, username, avatarPath, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewAuthorDetailsImplCopyWith<_$ReviewAuthorDetailsImpl> get copyWith =>
      __$$ReviewAuthorDetailsImplCopyWithImpl<_$ReviewAuthorDetailsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReviewAuthorDetailsImplToJson(
      this,
    );
  }
}

abstract class _ReviewAuthorDetails implements ReviewAuthorDetails {
  const factory _ReviewAuthorDetails(
          {@JsonKey(name: 'name') final String? name,
          @JsonKey(name: 'username') final String? username,
          @JsonKey(name: 'avatar_path') final String? avatarPath,
          @JsonKey(name: 'rating') final double? rating}) =
      _$ReviewAuthorDetailsImpl;

  factory _ReviewAuthorDetails.fromJson(Map<String, dynamic> json) =
      _$ReviewAuthorDetailsImpl.fromJson;

  @override
  @JsonKey(name: 'name')
  String? get name;
  @override
  @JsonKey(name: 'username')
  String? get username;
  @override
  @JsonKey(name: 'avatar_path')
  String? get avatarPath;
  @override
  @JsonKey(name: 'rating')
  double? get rating;
  @override
  @JsonKey(ignore: true)
  _$$ReviewAuthorDetailsImplCopyWith<_$ReviewAuthorDetailsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
