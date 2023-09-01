// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exercise_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExerciseData _$ExerciseDataFromJson(Map<String, dynamic> json) {
  return _ExerciseData.fromJson(json);
}

/// @nodoc
mixin _$ExerciseData {
  String get id => throw _privateConstructorUsedError;
  String get bodyPart => throw _privateConstructorUsedError;
  String get equipment => throw _privateConstructorUsedError;
  String get gifUrl => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get target => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseDataCopyWith<ExerciseData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseDataCopyWith<$Res> {
  factory $ExerciseDataCopyWith(
          ExerciseData value, $Res Function(ExerciseData) then) =
      _$ExerciseDataCopyWithImpl<$Res, ExerciseData>;
  @useResult
  $Res call(
      {String id,
      String bodyPart,
      String equipment,
      String gifUrl,
      String name,
      String target});
}

/// @nodoc
class _$ExerciseDataCopyWithImpl<$Res, $Val extends ExerciseData>
    implements $ExerciseDataCopyWith<$Res> {
  _$ExerciseDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bodyPart = null,
    Object? equipment = null,
    Object? gifUrl = null,
    Object? name = null,
    Object? target = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bodyPart: null == bodyPart
          ? _value.bodyPart
          : bodyPart // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      gifUrl: null == gifUrl
          ? _value.gifUrl
          : gifUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ExerciseDataCopyWith<$Res>
    implements $ExerciseDataCopyWith<$Res> {
  factory _$$_ExerciseDataCopyWith(
          _$_ExerciseData value, $Res Function(_$_ExerciseData) then) =
      __$$_ExerciseDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String bodyPart,
      String equipment,
      String gifUrl,
      String name,
      String target});
}

/// @nodoc
class __$$_ExerciseDataCopyWithImpl<$Res>
    extends _$ExerciseDataCopyWithImpl<$Res, _$_ExerciseData>
    implements _$$_ExerciseDataCopyWith<$Res> {
  __$$_ExerciseDataCopyWithImpl(
      _$_ExerciseData _value, $Res Function(_$_ExerciseData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? bodyPart = null,
    Object? equipment = null,
    Object? gifUrl = null,
    Object? name = null,
    Object? target = null,
  }) {
    return _then(_$_ExerciseData(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      bodyPart: null == bodyPart
          ? _value.bodyPart
          : bodyPart // ignore: cast_nullable_to_non_nullable
              as String,
      equipment: null == equipment
          ? _value.equipment
          : equipment // ignore: cast_nullable_to_non_nullable
              as String,
      gifUrl: null == gifUrl
          ? _value.gifUrl
          : gifUrl // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      target: null == target
          ? _value.target
          : target // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ExerciseData with DiagnosticableTreeMixin implements _ExerciseData {
  _$_ExerciseData(
      {this.id = "",
      this.bodyPart = "",
      this.equipment = "",
      this.gifUrl = "",
      this.name = "",
      this.target = ""});

  factory _$_ExerciseData.fromJson(Map<String, dynamic> json) =>
      _$$_ExerciseDataFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  @JsonKey()
  final String bodyPart;
  @override
  @JsonKey()
  final String equipment;
  @override
  @JsonKey()
  final String gifUrl;
  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final String target;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'ExerciseData(id: $id, bodyPart: $bodyPart, equipment: $equipment, gifUrl: $gifUrl, name: $name, target: $target)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'ExerciseData'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('bodyPart', bodyPart))
      ..add(DiagnosticsProperty('equipment', equipment))
      ..add(DiagnosticsProperty('gifUrl', gifUrl))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('target', target));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ExerciseData &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.bodyPart, bodyPart) ||
                other.bodyPart == bodyPart) &&
            (identical(other.equipment, equipment) ||
                other.equipment == equipment) &&
            (identical(other.gifUrl, gifUrl) || other.gifUrl == gifUrl) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.target, target) || other.target == target));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, bodyPart, equipment, gifUrl, name, target);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ExerciseDataCopyWith<_$_ExerciseData> get copyWith =>
      __$$_ExerciseDataCopyWithImpl<_$_ExerciseData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ExerciseDataToJson(
      this,
    );
  }
}

abstract class _ExerciseData implements ExerciseData {
  factory _ExerciseData(
      {final String id,
      final String bodyPart,
      final String equipment,
      final String gifUrl,
      final String name,
      final String target}) = _$_ExerciseData;

  factory _ExerciseData.fromJson(Map<String, dynamic> json) =
      _$_ExerciseData.fromJson;

  @override
  String get id;
  @override
  String get bodyPart;
  @override
  String get equipment;
  @override
  String get gifUrl;
  @override
  String get name;
  @override
  String get target;
  @override
  @JsonKey(ignore: true)
  _$$_ExerciseDataCopyWith<_$_ExerciseData> get copyWith =>
      throw _privateConstructorUsedError;
}
