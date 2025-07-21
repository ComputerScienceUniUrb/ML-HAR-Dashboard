// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experiment_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExperimentLog _$ExperimentLogFromJson(Map<String, dynamic> json) {
  return _ExperimentLog.fromJson(json);
}

/// @nodoc
mixin _$ExperimentLog {
  String get id => throw _privateConstructorUsedError;
  String get experimentId => throw _privateConstructorUsedError;
  String get runningId => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;

  /// Serializes this ExperimentLog to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExperimentLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExperimentLogCopyWith<ExperimentLog> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExperimentLogCopyWith<$Res> {
  factory $ExperimentLogCopyWith(
          ExperimentLog value, $Res Function(ExperimentLog) then) =
      _$ExperimentLogCopyWithImpl<$Res, ExperimentLog>;
  @useResult
  $Res call(
      {String id,
      String experimentId,
      String runningId,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$ExperimentLogCopyWithImpl<$Res, $Val extends ExperimentLog>
    implements $ExperimentLogCopyWith<$Res> {
  _$ExperimentLogCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExperimentLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? experimentId = null,
    Object? runningId = null,
    Object? createdAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as String,
      runningId: null == runningId
          ? _value.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExperimentLogImplCopyWith<$Res>
    implements $ExperimentLogCopyWith<$Res> {
  factory _$$ExperimentLogImplCopyWith(
          _$ExperimentLogImpl value, $Res Function(_$ExperimentLogImpl) then) =
      __$$ExperimentLogImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String experimentId,
      String runningId,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$$ExperimentLogImplCopyWithImpl<$Res>
    extends _$ExperimentLogCopyWithImpl<$Res, _$ExperimentLogImpl>
    implements _$$ExperimentLogImplCopyWith<$Res> {
  __$$ExperimentLogImplCopyWithImpl(
      _$ExperimentLogImpl _value, $Res Function(_$ExperimentLogImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExperimentLog
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? experimentId = null,
    Object? runningId = null,
    Object? createdAt = null,
  }) {
    return _then(_$ExperimentLogImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      experimentId: null == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as String,
      runningId: null == runningId
          ? _value.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExperimentLogImpl implements _ExperimentLog {
  const _$ExperimentLogImpl(
      {required this.id,
      required this.experimentId,
      required this.runningId,
      @TimestampConverter() required this.createdAt});

  factory _$ExperimentLogImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExperimentLogImplFromJson(json);

  @override
  final String id;
  @override
  final String experimentId;
  @override
  final String runningId;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  @override
  String toString() {
    return 'ExperimentLog(id: $id, experimentId: $experimentId, runningId: $runningId, createdAt: $createdAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExperimentLogImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.experimentId, experimentId) ||
                other.experimentId == experimentId) &&
            (identical(other.runningId, runningId) ||
                other.runningId == runningId) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, experimentId, runningId, createdAt);

  /// Create a copy of ExperimentLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExperimentLogImplCopyWith<_$ExperimentLogImpl> get copyWith =>
      __$$ExperimentLogImplCopyWithImpl<_$ExperimentLogImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExperimentLogImplToJson(
      this,
    );
  }
}

abstract class _ExperimentLog implements ExperimentLog {
  const factory _ExperimentLog(
          {required final String id,
          required final String experimentId,
          required final String runningId,
          @TimestampConverter() required final DateTime createdAt}) =
      _$ExperimentLogImpl;

  factory _ExperimentLog.fromJson(Map<String, dynamic> json) =
      _$ExperimentLogImpl.fromJson;

  @override
  String get id;
  @override
  String get experimentId;
  @override
  String get runningId;
  @override
  @TimestampConverter()
  DateTime get createdAt;

  /// Create a copy of ExperimentLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExperimentLogImplCopyWith<_$ExperimentLogImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
