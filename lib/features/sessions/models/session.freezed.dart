// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Session {
  String get id;
  String get userId;
  String get name;
  String? get runningId;
  String? get selectedExperimentId;
  List<String> get experiments;
  SessionStatus get status;
  @TimestampConverter()
  DateTime get createdAt;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SessionCopyWith<Session> get copyWith =>
      _$SessionCopyWithImpl<Session>(this as Session, _$identity);

  /// Serializes this Session to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Session &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.runningId, runningId) ||
                other.runningId == runningId) &&
            (identical(other.selectedExperimentId, selectedExperimentId) ||
                other.selectedExperimentId == selectedExperimentId) &&
            const DeepCollectionEquality()
                .equals(other.experiments, experiments) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      runningId,
      selectedExperimentId,
      const DeepCollectionEquality().hash(experiments),
      status,
      createdAt);

  @override
  String toString() {
    return 'Session(id: $id, userId: $userId, name: $name, runningId: $runningId, selectedExperimentId: $selectedExperimentId, experiments: $experiments, status: $status, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class $SessionCopyWith<$Res> {
  factory $SessionCopyWith(Session value, $Res Function(Session) _then) =
      _$SessionCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String? runningId,
      String? selectedExperimentId,
      List<String> experiments,
      SessionStatus status,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class _$SessionCopyWithImpl<$Res> implements $SessionCopyWith<$Res> {
  _$SessionCopyWithImpl(this._self, this._then);

  final Session _self;
  final $Res Function(Session) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? runningId = freezed,
    Object? selectedExperimentId = freezed,
    Object? experiments = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      runningId: freezed == runningId
          ? _self.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedExperimentId: freezed == selectedExperimentId
          ? _self.selectedExperimentId
          : selectedExperimentId // ignore: cast_nullable_to_non_nullable
              as String?,
      experiments: null == experiments
          ? _self.experiments
          : experiments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// Adds pattern-matching-related methods to [Session].
extension SessionPatterns on Session {
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
    TResult Function(_Session value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Session() when $default != null:
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
    TResult Function(_Session value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Session():
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
    TResult? Function(_Session value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Session() when $default != null:
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
            String userId,
            String name,
            String? runningId,
            String? selectedExperimentId,
            List<String> experiments,
            SessionStatus status,
            @TimestampConverter() DateTime createdAt)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Session() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.name,
            _that.runningId,
            _that.selectedExperimentId,
            _that.experiments,
            _that.status,
            _that.createdAt);
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
            String userId,
            String name,
            String? runningId,
            String? selectedExperimentId,
            List<String> experiments,
            SessionStatus status,
            @TimestampConverter() DateTime createdAt)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Session():
        return $default(
            _that.id,
            _that.userId,
            _that.name,
            _that.runningId,
            _that.selectedExperimentId,
            _that.experiments,
            _that.status,
            _that.createdAt);
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
            String userId,
            String name,
            String? runningId,
            String? selectedExperimentId,
            List<String> experiments,
            SessionStatus status,
            @TimestampConverter() DateTime createdAt)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Session() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.name,
            _that.runningId,
            _that.selectedExperimentId,
            _that.experiments,
            _that.status,
            _that.createdAt);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Session implements Session {
  const _Session(
      {required this.id,
      required this.userId,
      required this.name,
      this.runningId,
      this.selectedExperimentId,
      final List<String> experiments = const [],
      this.status = SessionStatus.opened,
      @TimestampConverter() required this.createdAt})
      : _experiments = experiments;
  factory _Session.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String? runningId;
  @override
  final String? selectedExperimentId;
  final List<String> _experiments;
  @override
  @JsonKey()
  List<String> get experiments {
    if (_experiments is EqualUnmodifiableListView) return _experiments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_experiments);
  }

  @override
  @JsonKey()
  final SessionStatus status;
  @override
  @TimestampConverter()
  final DateTime createdAt;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SessionCopyWith<_Session> get copyWith =>
      __$SessionCopyWithImpl<_Session>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SessionToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Session &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.runningId, runningId) ||
                other.runningId == runningId) &&
            (identical(other.selectedExperimentId, selectedExperimentId) ||
                other.selectedExperimentId == selectedExperimentId) &&
            const DeepCollectionEquality()
                .equals(other._experiments, _experiments) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      runningId,
      selectedExperimentId,
      const DeepCollectionEquality().hash(_experiments),
      status,
      createdAt);

  @override
  String toString() {
    return 'Session(id: $id, userId: $userId, name: $name, runningId: $runningId, selectedExperimentId: $selectedExperimentId, experiments: $experiments, status: $status, createdAt: $createdAt)';
  }
}

/// @nodoc
abstract mixin class _$SessionCopyWith<$Res> implements $SessionCopyWith<$Res> {
  factory _$SessionCopyWith(_Session value, $Res Function(_Session) _then) =
      __$SessionCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String? runningId,
      String? selectedExperimentId,
      List<String> experiments,
      SessionStatus status,
      @TimestampConverter() DateTime createdAt});
}

/// @nodoc
class __$SessionCopyWithImpl<$Res> implements _$SessionCopyWith<$Res> {
  __$SessionCopyWithImpl(this._self, this._then);

  final _Session _self;
  final $Res Function(_Session) _then;

  /// Create a copy of Session
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? runningId = freezed,
    Object? selectedExperimentId = freezed,
    Object? experiments = null,
    Object? status = null,
    Object? createdAt = null,
  }) {
    return _then(_Session(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      runningId: freezed == runningId
          ? _self.runningId
          : runningId // ignore: cast_nullable_to_non_nullable
              as String?,
      selectedExperimentId: freezed == selectedExperimentId
          ? _self.selectedExperimentId
          : selectedExperimentId // ignore: cast_nullable_to_non_nullable
              as String?,
      experiments: null == experiments
          ? _self._experiments
          : experiments // ignore: cast_nullable_to_non_nullable
              as List<String>,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as SessionStatus,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
