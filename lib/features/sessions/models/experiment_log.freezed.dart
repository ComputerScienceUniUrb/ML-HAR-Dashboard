// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experiment_log.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExperimentLog {
  String get id;
  String get experimentId;
  String get runningId;
  @TimestampConverter()
  DateTime get createdAt;

  /// Create a copy of ExperimentLog
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExperimentLogCopyWith<ExperimentLog> get copyWith =>
      _$ExperimentLogCopyWithImpl<ExperimentLog>(
          this as ExperimentLog, _$identity);

  /// Serializes this ExperimentLog to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ExperimentLog &&
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

  @override
  String toString() {
    return 'ExperimentLog(id: $id, experimentId: $experimentId, runningId: $runningId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $ExperimentLogCopyWith<$Res> {
  factory $ExperimentLogCopyWith(
          ExperimentLog value, $Res Function(ExperimentLog) _then) =
      _$ExperimentLogCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String experimentId,
      String runningId,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$ExperimentLogCopyWithImpl<$Res>
    implements $ExperimentLogCopyWith<$Res> {
  _$ExperimentLogCopyWithImpl(this._self, this._then);

  final ExperimentLog _self;
  final $Res Function(ExperimentLog) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      experimentId: null == experimentId
          ? _self.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as String,
      runningId: null == runningId
          ? _self.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [ExperimentLog].
extension ExperimentLogPatterns on ExperimentLog {
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
    TResult Function(_ExperimentLog value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExperimentLog() when $default != null:
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
    TResult Function(_ExperimentLog value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExperimentLog():
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
    TResult? Function(_ExperimentLog value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExperimentLog() when $default != null:
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
    TResult Function(String id, String experimentId, String runningId,
            @TimestampConverter() DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ExperimentLog() when $default != null:
        return $default(
            _that.id, _that.experimentId, _that.runningId, _that.createdAt);
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
    TResult Function(String id, String experimentId, String runningId,
            @TimestampConverter() DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExperimentLog():
        return $default(
            _that.id, _that.experimentId, _that.runningId, _that.createdAt);
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
    TResult? Function(String id, String experimentId, String runningId,
            @TimestampConverter() DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ExperimentLog() when $default != null:
        return $default(
            _that.id, _that.experimentId, _that.runningId, _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ExperimentLog implements ExperimentLog {
  const _ExperimentLog(
      {required this.id,
      required this.experimentId,
      required this.runningId,
      @TimestampConverter() required this.createdAt});
  factory _ExperimentLog.fromJson(Map<String, dynamic> json) =>
      _$ExperimentLogFromJson(json);

  @override
  final String id;
  @override
  final String experimentId;
  @override
  final String runningId;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  /// Create a copy of ExperimentLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExperimentLogCopyWith<_ExperimentLog> get copyWith =>
      __$ExperimentLogCopyWithImpl<_ExperimentLog>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExperimentLogToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ExperimentLog &&
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

  @override
  String toString() {
    return 'ExperimentLog(id: $id, experimentId: $experimentId, runningId: $runningId, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$ExperimentLogCopyWith<$Res>
    implements $ExperimentLogCopyWith<$Res> {
  factory _$ExperimentLogCopyWith(
          _ExperimentLog value, $Res Function(_ExperimentLog) _then) =
      __$ExperimentLogCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String experimentId,
      String runningId,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$ExperimentLogCopyWithImpl<$Res>
    implements _$ExperimentLogCopyWith<$Res> {
  __$ExperimentLogCopyWithImpl(this._self, this._then);

  final _ExperimentLog _self;
  final $Res Function(_ExperimentLog) _then;

  /// Create a copy of ExperimentLog
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? experimentId = null,
    Object? runningId = null,
    Object? createdAt = null,
  }) {
    return _then(_ExperimentLog(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      experimentId: null == experimentId
          ? _self.experimentId
          : experimentId // ignore: cast_nullable_to_non_nullable
              as String,
      runningId: null == runningId
          ? _self.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
