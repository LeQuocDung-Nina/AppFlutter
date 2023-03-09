// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'slideshow_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SlideshowModel _$SlideshowModelFromJson(Map<String, dynamic> json) {
  return _SlideshowModel.fromJson(json);
}

/// @nodoc
mixin _$SlideshowModel {
  String get id => throw _privateConstructorUsedError;
  String get link => throw _privateConstructorUsedError;
  String get namevi => throw _privateConstructorUsedError;
  String get photo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SlideshowModelCopyWith<SlideshowModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SlideshowModelCopyWith<$Res> {
  factory $SlideshowModelCopyWith(
          SlideshowModel value, $Res Function(SlideshowModel) then) =
      _$SlideshowModelCopyWithImpl<$Res, SlideshowModel>;
  @useResult
  $Res call({String id, String link, String namevi, String photo});
}

/// @nodoc
class _$SlideshowModelCopyWithImpl<$Res, $Val extends SlideshowModel>
    implements $SlideshowModelCopyWith<$Res> {
  _$SlideshowModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? link = null,
    Object? namevi = null,
    Object? photo = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      namevi: null == namevi
          ? _value.namevi
          : namevi // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_SlideshowModelCopyWith<$Res>
    implements $SlideshowModelCopyWith<$Res> {
  factory _$$_SlideshowModelCopyWith(
          _$_SlideshowModel value, $Res Function(_$_SlideshowModel) then) =
      __$$_SlideshowModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String link, String namevi, String photo});
}

/// @nodoc
class __$$_SlideshowModelCopyWithImpl<$Res>
    extends _$SlideshowModelCopyWithImpl<$Res, _$_SlideshowModel>
    implements _$$_SlideshowModelCopyWith<$Res> {
  __$$_SlideshowModelCopyWithImpl(
      _$_SlideshowModel _value, $Res Function(_$_SlideshowModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? link = null,
    Object? namevi = null,
    Object? photo = null,
  }) {
    return _then(_$_SlideshowModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      link: null == link
          ? _value.link
          : link // ignore: cast_nullable_to_non_nullable
              as String,
      namevi: null == namevi
          ? _value.namevi
          : namevi // ignore: cast_nullable_to_non_nullable
              as String,
      photo: null == photo
          ? _value.photo
          : photo // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SlideshowModel implements _SlideshowModel {
  _$_SlideshowModel(
      {required this.id,
      required this.link,
      required this.namevi,
      required this.photo});

  factory _$_SlideshowModel.fromJson(Map<String, dynamic> json) =>
      _$$_SlideshowModelFromJson(json);

  @override
  final String id;
  @override
  final String link;
  @override
  final String namevi;
  @override
  final String photo;

  @override
  String toString() {
    return 'SlideshowModel(id: $id, link: $link, namevi: $namevi, photo: $photo)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_SlideshowModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.link, link) || other.link == link) &&
            (identical(other.namevi, namevi) || other.namevi == namevi) &&
            (identical(other.photo, photo) || other.photo == photo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, link, namevi, photo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_SlideshowModelCopyWith<_$_SlideshowModel> get copyWith =>
      __$$_SlideshowModelCopyWithImpl<_$_SlideshowModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SlideshowModelToJson(
      this,
    );
  }
}

abstract class _SlideshowModel implements SlideshowModel {
  factory _SlideshowModel(
      {required final String id,
      required final String link,
      required final String namevi,
      required final String photo}) = _$_SlideshowModel;

  factory _SlideshowModel.fromJson(Map<String, dynamic> json) =
      _$_SlideshowModel.fromJson;

  @override
  String get id;
  @override
  String get link;
  @override
  String get namevi;
  @override
  String get photo;
  @override
  @JsonKey(ignore: true)
  _$$_SlideshowModelCopyWith<_$_SlideshowModel> get copyWith =>
      throw _privateConstructorUsedError;
}
