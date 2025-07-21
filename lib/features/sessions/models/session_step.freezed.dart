// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SessionStep _$SessionStepFromJson(Map<String, dynamic> json) {
  return _SessionStep.fromJson(json);
}

/// @nodoc
mixin _$SessionStep {
  String get id => throw _privateConstructorUsedError;
  SessionStepAction get action => throw _privateConstructorUsedError;
  SessionStatus get currentStatus => throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get experimentId => throw _privateConstructorUsedError;
  String? get runningId => throw _privateConstructorUsedError;

  /// Serializes this SessionStep to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SessionStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SessionStepCopyWith<SessionStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStepCopyWith<$Res> {
  factory $SessionStepCopyWith(
          SessionStep value, $Res Function(SessionStep) then) =
      _$SessionStepCopyWithImpl<$Res, SessionStep>;
  @useResult
  $Res call(
      {String id,
      SessionStepAction action,
      SessionStatus currentStatus,
      @TimestampConverter() DateTime createdAt,
      String? experimentId,
      String? runningId});
}

/// @nodoc
class _$SessionStepCopyWithImpl<$Res, $Val extends SessionStep>
    implements $SessionStepCopyWith<$Res> {
  _$SessionStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SessionStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? currentStatus = null,
    Object? createdAt = null,
    Object? experimentId = freezed,
    Object? runningId = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SessionStepAction,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      experimentId: freezed == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as String?,
      runningId: freezed == runningId
          ? _value.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SessionStepImplCopyWith<$Res>
    implements $SessionStepCopyWith<$Res> {
  factory _$$SessionStepImplCopyWith(
          _$SessionStepImpl value, $Res Function(_$SessionStepImpl) then) =
      __$$SessionStepImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      SessionStepAction action,
      SessionStatus currentStatus,
      @TimestampConverter() DateTime createdAt,
      String? experimentId,
      String? runningId});
}

/// @nodoc
class __$$SessionStepImplCopyWithImpl<$Res>
    extends _$SessionStepCopyWithImpl<$Res, _$SessionStepImpl>
    implements _$$SessionStepImplCopyWith<$Res> {
  __$$SessionStepImplCopyWithImpl(
      _$SessionStepImpl _value, $Res Function(_$SessionStepImpl) _then)
      : super(_value, _then);

  /// Create a copy of SessionStep
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? currentStatus = null,
    Object? createdAt = null,
    Object? experimentId = freezed,
    Object? runningId = freezed,
  }) {
    return _then(_$SessionStepImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as SessionStepAction,
      currentStatus: null == currentStatus
          ? _value.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      experimentId: freezed == experimentId
          ? _value.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as String?,
      runningId: freezed == runningId
          ? _value.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SessionStepImpl implements _SessionStep {
  const _$SessionStepImpl(
      {required this.id,
      required this.action,
      required this.currentStatus,
      @TimestampConverter() required this.createdAt,
      this.experimentId,
      this.runningId});

  factory _$SessionStepImpl.fromJson(Map<String, dynamic> json) =>
      _$$SessionStepImplFromJson(json);

  @override
  final String id;
  @override
  final SessionStepAction action;
  @override
  final SessionStatus currentStatus;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String? experimentId;
  @override
  final String? runningId;

  @override
  String toString() {
    return 'SessionStep(id: $id, action: $action, currentStatus: $currentStatus, createdAt: $createdAt, experimentId: $experimentId, runningId: $runningId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SessionStepImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.currentStatus, currentStatus) ||
                other.currentStatus == currentStatus) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.experimentId, experimentId) ||
                other.experimentId == experimentId) &&
            (identical(other.runningId, runningId) ||
                other.runningId == runningId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, action, currentStatus,
      createdAt, experimentId, runningId);

  /// Create a copy of SessionStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SessionStepImplCopyWith<_$SessionStepImpl> get copyWith =>
      __$$SessionStepImplCopyWithImpl<_$SessionStepImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SessionStepImplToJson(
      this,
    );
  }
}

abstract class _SessionStep implements SessionStep {
  const factory _SessionStep(
      {required final String id,
      required final SessionStepAction action,
      required final SessionStatus currentStatus,
      @TimestampConverter() required final DateTime createdAt,
      final String? experimentId,
      final String? runningId}) = _$SessionStepImpl;

  factory _SessionStep.fromJson(Map<String, dynamic> json) =
      _$SessionStepImpl.fromJson;

  @override
  String get id;
  @override
  SessionStepAction get action;
  @override
  SessionStatus get currentStatus;
  @override
  @TimestampConverter()
  DateTime get createdAt;
  @override
  String? get experimentId;
  @override
  String? get runningId;

  /// Create a copy of SessionStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SessionStepImplCopyWith<_$SessionStepImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
