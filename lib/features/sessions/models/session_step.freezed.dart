// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SessionStep {
  String get id;
  SessionStepAction get action;
  SessionStatus get currentStatus;
  @TimestampConverter()
  DateTime get createdAt;
  String? get experimentId;
  String? get runningId;

  /// Create a copy of SessionStep
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionStepCopyWith<SessionStep> get copyWith =>
      _$SessionStepCopyWithImpl<SessionStep>(this as SessionStep, _$identity);

  /// Serializes this SessionStep to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SessionStep &&
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

  @override
  String toString() {
    return 'SessionStep(id: $id, action: $action, currentStatus: $currentStatus, createdAt: $createdAt, experimentId: $experimentId, runningId: $runningId)';
  }
}

/// @nodoc
abstract mixin class $SessionStepCopyWith<$Res> {
  factory $SessionStepCopyWith(
          SessionStep value, $Res Function(SessionStep) _then) =
      _$SessionStepCopyWithImpl;
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
class _$SessionStepCopyWithImpl<$Res> implements $SessionStepCopyWith<$Res> {
  _$SessionStepCopyWithImpl(this._self, this._then);

  final SessionStep _self;
  final $Res Function(SessionStep) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as SessionStepAction,
      currentStatus: null == currentStatus
          ? _self.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      experimentId: freezed == experimentId
          ? _self.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as String?,
      runningId: freezed == runningId
          ? _self.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// Adds pattern-matching-related methods to [SessionStep].
extension SessionStepPatterns on SessionStep {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_SessionStep value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionStep() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_SessionStep value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionStep():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_SessionStep value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionStep() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String id,
            SessionStepAction action,
            SessionStatus currentStatus,
            @TimestampConverter() DateTime createdAt,
            String? experimentId,
            String? runningId)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _SessionStep() when $default != null:
        return $default(_that.id, _that.action, _that.currentStatus,
            _that.createdAt, _that.experimentId, _that.runningId);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String id,
            SessionStepAction action,
            SessionStatus currentStatus,
            @TimestampConverter() DateTime createdAt,
            String? experimentId,
            String? runningId)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionStep():
        return $default(_that.id, _that.action, _that.currentStatus,
            _that.createdAt, _that.experimentId, _that.runningId);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String id,
            SessionStepAction action,
            SessionStatus currentStatus,
            @TimestampConverter() DateTime createdAt,
            String? experimentId,
            String? runningId)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _SessionStep() when $default != null:
        return $default(_that.id, _that.action, _that.currentStatus,
            _that.createdAt, _that.experimentId, _that.runningId);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _SessionStep implements SessionStep {
  const _SessionStep(
      {required this.id,
      required this.action,
      required this.currentStatus,
      @TimestampConverter() required this.createdAt,
      this.experimentId,
      this.runningId});
  factory _SessionStep.fromJson(Map<String, dynamic> json) =>
      _$SessionStepFromJson(json);

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

  /// Create a copy of SessionStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionStepCopyWith<_SessionStep> get copyWith =>
      __$SessionStepCopyWithImpl<_SessionStep>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionStepToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionStep &&
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

  @override
  String toString() {
    return 'SessionStep(id: $id, action: $action, currentStatus: $currentStatus, createdAt: $createdAt, experimentId: $experimentId, runningId: $runningId)';
  }
}

/// @nodoc
abstract mixin class _$SessionStepCopyWith<$Res>
    implements $SessionStepCopyWith<$Res> {
  factory _$SessionStepCopyWith(
          _SessionStep value, $Res Function(_SessionStep) _then) =
      __$SessionStepCopyWithImpl;
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
class __$SessionStepCopyWithImpl<$Res> implements _$SessionStepCopyWith<$Res> {
  __$SessionStepCopyWithImpl(this._self, this._then);

  final _SessionStep _self;
  final $Res Function(_SessionStep) _then;

  /// Create a copy of SessionStep
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? action = null,
    Object? currentStatus = null,
    Object? createdAt = null,
    Object? experimentId = freezed,
    Object? runningId = freezed,
  }) {
    return _then(_SessionStep(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _self.action
          : action // ignore: cast_nullable_to_non_nullable
              as SessionStepAction,
      currentStatus: null == currentStatus
          ? _self.currentStatus
          : currentStatus // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      experimentId: freezed == experimentId
          ? _self.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as String?,
      runningId: freezed == runningId
          ? _self.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
