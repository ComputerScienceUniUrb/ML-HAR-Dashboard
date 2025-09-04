// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'experiment.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Experiment {
  String get id;
  String get userId;
  String get name;
  String get shortCode;
  @TimestampConverter()
  DateTime get createdAt;
  String? get description;
  ActivityType? get activityTypeOverride;
  SmartphonePosition? get smartphonePositionOverride;
  int? get duration;
  bool get enabled;

  /// Create a copy of Experiment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ExperimentCopyWith<Experiment> get copyWith =>
      _$ExperimentCopyWithImpl<Experiment>(this as Experiment, _$identity);

  /// Serializes this Experiment to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Experiment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.activityTypeOverride, activityTypeOverride) ||
                other.activityTypeOverride == activityTypeOverride) &&
            (identical(other.smartphonePositionOverride,
                    smartphonePositionOverride) ||
                other.smartphonePositionOverride ==
                    smartphonePositionOverride) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      shortCode,
      createdAt,
      description,
      activityTypeOverride,
      smartphonePositionOverride,
      duration,
      enabled);

  @override
  String toString() {
    return 'Experiment(id: $id, userId: $userId, name: $name, shortCode: $shortCode, createdAt: $createdAt, description: $description, activityTypeOverride: $activityTypeOverride, smartphonePositionOverride: $smartphonePositionOverride, duration: $duration, enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class $ExperimentCopyWith<$Res> {
  factory $ExperimentCopyWith(
          Experiment value, $Res Function(Experiment) _then) =
      _$ExperimentCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String shortCode,
      @TimestampConverter() DateTime createdAt,
      String? description,
      ActivityType? activityTypeOverride,
      SmartphonePosition? smartphonePositionOverride,
      int? duration,
      bool enabled});
}

/// @nodoc
class _$ExperimentCopyWithImpl<$Res> implements $ExperimentCopyWith<$Res> {
  _$ExperimentCopyWithImpl(this._self, this._then);

  final Experiment _self;
  final $Res Function(Experiment) _then;

  /// Create a copy of Experiment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? shortCode = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? activityTypeOverride = freezed,
    Object? smartphonePositionOverride = freezed,
    Object? duration = freezed,
    Object? enabled = null,
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
      shortCode: null == shortCode
          ? _self.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      activityTypeOverride: freezed == activityTypeOverride
          ? _self.activityTypeOverride
          : activityTypeOverride // ignore: cast_nullable_to_non_nullable
              as ActivityType?,
      smartphonePositionOverride: freezed == smartphonePositionOverride
          ? _self.smartphonePositionOverride
          : smartphonePositionOverride // ignore: cast_nullable_to_non_nullable
              as SmartphonePosition?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// Adds pattern-matching-related methods to [Experiment].
extension ExperimentPatterns on Experiment {
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
    TResult Function(_Experiment value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Experiment() when $default != null:
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
    TResult Function(_Experiment value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Experiment():
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
    TResult? Function(_Experiment value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Experiment() when $default != null:
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
            String shortCode,
            @TimestampConverter() DateTime createdAt,
            String? description,
            ActivityType? activityTypeOverride,
            SmartphonePosition? smartphonePositionOverride,
            int? duration,
            bool enabled)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Experiment() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.name,
            _that.shortCode,
            _that.createdAt,
            _that.description,
            _that.activityTypeOverride,
            _that.smartphonePositionOverride,
            _that.duration,
            _that.enabled);
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
            String shortCode,
            @TimestampConverter() DateTime createdAt,
            String? description,
            ActivityType? activityTypeOverride,
            SmartphonePosition? smartphonePositionOverride,
            int? duration,
            bool enabled)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Experiment():
        return $default(
            _that.id,
            _that.userId,
            _that.name,
            _that.shortCode,
            _that.createdAt,
            _that.description,
            _that.activityTypeOverride,
            _that.smartphonePositionOverride,
            _that.duration,
            _that.enabled);
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
            String shortCode,
            @TimestampConverter() DateTime createdAt,
            String? description,
            ActivityType? activityTypeOverride,
            SmartphonePosition? smartphonePositionOverride,
            int? duration,
            bool enabled)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Experiment() when $default != null:
        return $default(
            _that.id,
            _that.userId,
            _that.name,
            _that.shortCode,
            _that.createdAt,
            _that.description,
            _that.activityTypeOverride,
            _that.smartphonePositionOverride,
            _that.duration,
            _that.enabled);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Experiment implements Experiment {
  const _Experiment(
      {required this.id,
      required this.userId,
      required this.name,
      required this.shortCode,
      @TimestampConverter() required this.createdAt,
      this.description,
      this.activityTypeOverride,
      this.smartphonePositionOverride,
      this.duration,
      this.enabled = false});
  factory _Experiment.fromJson(Map<String, dynamic> json) =>
      _$ExperimentFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String name;
  @override
  final String shortCode;
  @override
  @TimestampConverter()
  final DateTime createdAt;
  @override
  final String? description;
  @override
  final ActivityType? activityTypeOverride;
  @override
  final SmartphonePosition? smartphonePositionOverride;
  @override
  final int? duration;
  @override
  @JsonKey()
  final bool enabled;

  /// Create a copy of Experiment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ExperimentCopyWith<_Experiment> get copyWith =>
      __$ExperimentCopyWithImpl<_Experiment>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ExperimentToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Experiment &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.shortCode, shortCode) ||
                other.shortCode == shortCode) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.activityTypeOverride, activityTypeOverride) ||
                other.activityTypeOverride == activityTypeOverride) &&
            (identical(other.smartphonePositionOverride,
                    smartphonePositionOverride) ||
                other.smartphonePositionOverride ==
                    smartphonePositionOverride) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.enabled, enabled) || other.enabled == enabled));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      name,
      shortCode,
      createdAt,
      description,
      activityTypeOverride,
      smartphonePositionOverride,
      duration,
      enabled);

  @override
  String toString() {
    return 'Experiment(id: $id, userId: $userId, name: $name, shortCode: $shortCode, createdAt: $createdAt, description: $description, activityTypeOverride: $activityTypeOverride, smartphonePositionOverride: $smartphonePositionOverride, duration: $duration, enabled: $enabled)';
  }
}

/// @nodoc
abstract mixin class _$ExperimentCopyWith<$Res>
    implements $ExperimentCopyWith<$Res> {
  factory _$ExperimentCopyWith(
          _Experiment value, $Res Function(_Experiment) _then) =
      __$ExperimentCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String name,
      String shortCode,
      @TimestampConverter() DateTime createdAt,
      String? description,
      ActivityType? activityTypeOverride,
      SmartphonePosition? smartphonePositionOverride,
      int? duration,
      bool enabled});
}

/// @nodoc
class __$ExperimentCopyWithImpl<$Res> implements _$ExperimentCopyWith<$Res> {
  __$ExperimentCopyWithImpl(this._self, this._then);

  final _Experiment _self;
  final $Res Function(_Experiment) _then;

  /// Create a copy of Experiment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? name = null,
    Object? shortCode = null,
    Object? createdAt = null,
    Object? description = freezed,
    Object? activityTypeOverride = freezed,
    Object? smartphonePositionOverride = freezed,
    Object? duration = freezed,
    Object? enabled = null,
  }) {
    return _then(_Experiment(
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
      shortCode: null == shortCode
          ? _self.shortCode
          : shortCode // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _self.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      activityTypeOverride: freezed == activityTypeOverride
          ? _self.activityTypeOverride
          : activityTypeOverride // ignore: cast_nullable_to_non_nullable
              as ActivityType?,
      smartphonePositionOverride: freezed == smartphonePositionOverride
          ? _self.smartphonePositionOverride
          : smartphonePositionOverride // ignore: cast_nullable_to_non_nullable
              as SmartphonePosition?,
      duration: freezed == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int?,
      enabled: null == enabled
          ? _self.enabled
          : enabled // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
