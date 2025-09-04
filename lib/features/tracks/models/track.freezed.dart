// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Track {
  ActivityType get activityType;
  SmartphonePosition get smartphonePosition;
  @TimestampConverter()
  DateTime get timestamp;
  UserInfo get userInfo;
  int get startBatteryLevel;
  bool get isInBatterySaveMode;
  String get cloudId;
  String get downloadUrl;
  int get testDuration;
  String? get experimentCode;
  List<InferenceOutput>? get inferenceOutputs;
  String get os;
  String get device;
  String get appVersion;
  bool get debug;

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $TrackCopyWith<Track> get copyWith =>
      _$TrackCopyWithImpl<Track>(this as Track, _$identity);

  /// Serializes this Track to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Track &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType) &&
            (identical(other.smartphonePosition, smartphonePosition) ||
                other.smartphonePosition == smartphonePosition) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.startBatteryLevel, startBatteryLevel) ||
                other.startBatteryLevel == startBatteryLevel) &&
            (identical(other.isInBatterySaveMode, isInBatterySaveMode) ||
                other.isInBatterySaveMode == isInBatterySaveMode) &&
            (identical(other.cloudId, cloudId) || other.cloudId == cloudId) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.testDuration, testDuration) ||
                other.testDuration == testDuration) &&
            (identical(other.experimentCode, experimentCode) ||
                other.experimentCode == experimentCode) &&
            const DeepCollectionEquality()
                .equals(other.inferenceOutputs, inferenceOutputs) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.debug, debug) || other.debug == debug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activityType,
      smartphonePosition,
      timestamp,
      userInfo,
      startBatteryLevel,
      isInBatterySaveMode,
      cloudId,
      downloadUrl,
      testDuration,
      experimentCode,
      const DeepCollectionEquality().hash(inferenceOutputs),
      os,
      device,
      appVersion,
      debug);

  @override
  String toString() {
    return 'Track(activityType: $activityType, smartphonePosition: $smartphonePosition, timestamp: $timestamp, userInfo: $userInfo, startBatteryLevel: $startBatteryLevel, isInBatterySaveMode: $isInBatterySaveMode, cloudId: $cloudId, downloadUrl: $downloadUrl, testDuration: $testDuration, experimentCode: $experimentCode, inferenceOutputs: $inferenceOutputs, os: $os, device: $device, appVersion: $appVersion, debug: $debug)';
  }
}

/// @nodoc
abstract mixin class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) _then) =
      _$TrackCopyWithImpl;
  @useResult
  $Res call(
      {ActivityType activityType,
      SmartphonePosition smartphonePosition,
      @TimestampConverter() DateTime timestamp,
      UserInfo userInfo,
      int startBatteryLevel,
      bool isInBatterySaveMode,
      String cloudId,
      String downloadUrl,
      int testDuration,
      String? experimentCode,
      List<InferenceOutput>? inferenceOutputs,
      String os,
      String device,
      String appVersion,
      bool debug});

  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$TrackCopyWithImpl<$Res> implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._self, this._then);

  final Track _self;
  final $Res Function(Track) _then;

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? activityType = null,
    Object? smartphonePosition = null,
    Object? timestamp = null,
    Object? userInfo = null,
    Object? startBatteryLevel = null,
    Object? isInBatterySaveMode = null,
    Object? cloudId = null,
    Object? downloadUrl = null,
    Object? testDuration = null,
    Object? experimentCode = freezed,
    Object? inferenceOutputs = freezed,
    Object? os = null,
    Object? device = null,
    Object? appVersion = null,
    Object? debug = null,
  }) {
    return _then(_self.copyWith(
      activityType: null == activityType
          ? _self.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      smartphonePosition: null == smartphonePosition
          ? _self.smartphonePosition
          : smartphonePosition // ignore: cast_nullable_to_non_nullable
              as SmartphonePosition,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userInfo: null == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      startBatteryLevel: null == startBatteryLevel
          ? _self.startBatteryLevel
          : startBatteryLevel // ignore: cast_nullable_to_non_nullable
              as int,
      isInBatterySaveMode: null == isInBatterySaveMode
          ? _self.isInBatterySaveMode
          : isInBatterySaveMode // ignore: cast_nullable_to_non_nullable
              as bool,
      cloudId: null == cloudId
          ? _self.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _self.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      testDuration: null == testDuration
          ? _self.testDuration
          : testDuration // ignore: cast_nullable_to_non_nullable
              as int,
      experimentCode: freezed == experimentCode
          ? _self.experimentCode
          : experimentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      inferenceOutputs: freezed == inferenceOutputs
          ? _self.inferenceOutputs
          : inferenceOutputs // ignore: cast_nullable_to_non_nullable
              as List<InferenceOutput>?,
      os: null == os
          ? _self.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _self.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      debug: null == debug
          ? _self.debug
          : debug // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_self.userInfo, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

/// Adds pattern-matching-related methods to [Track].
extension TrackPatterns on Track {
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
    TResult Function(_Track value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Track() when $default != null:
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
    TResult Function(_Track value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Track():
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
    TResult? Function(_Track value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Track() when $default != null:
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
            ActivityType activityType,
            SmartphonePosition smartphonePosition,
            @TimestampConverter() DateTime timestamp,
            UserInfo userInfo,
            int startBatteryLevel,
            bool isInBatterySaveMode,
            String cloudId,
            String downloadUrl,
            int testDuration,
            String? experimentCode,
            List<InferenceOutput>? inferenceOutputs,
            String os,
            String device,
            String appVersion,
            bool debug)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Track() when $default != null:
        return $default(
            _that.activityType,
            _that.smartphonePosition,
            _that.timestamp,
            _that.userInfo,
            _that.startBatteryLevel,
            _that.isInBatterySaveMode,
            _that.cloudId,
            _that.downloadUrl,
            _that.testDuration,
            _that.experimentCode,
            _that.inferenceOutputs,
            _that.os,
            _that.device,
            _that.appVersion,
            _that.debug);
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
            ActivityType activityType,
            SmartphonePosition smartphonePosition,
            @TimestampConverter() DateTime timestamp,
            UserInfo userInfo,
            int startBatteryLevel,
            bool isInBatterySaveMode,
            String cloudId,
            String downloadUrl,
            int testDuration,
            String? experimentCode,
            List<InferenceOutput>? inferenceOutputs,
            String os,
            String device,
            String appVersion,
            bool debug)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Track():
        return $default(
            _that.activityType,
            _that.smartphonePosition,
            _that.timestamp,
            _that.userInfo,
            _that.startBatteryLevel,
            _that.isInBatterySaveMode,
            _that.cloudId,
            _that.downloadUrl,
            _that.testDuration,
            _that.experimentCode,
            _that.inferenceOutputs,
            _that.os,
            _that.device,
            _that.appVersion,
            _that.debug);
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
            ActivityType activityType,
            SmartphonePosition smartphonePosition,
            @TimestampConverter() DateTime timestamp,
            UserInfo userInfo,
            int startBatteryLevel,
            bool isInBatterySaveMode,
            String cloudId,
            String downloadUrl,
            int testDuration,
            String? experimentCode,
            List<InferenceOutput>? inferenceOutputs,
            String os,
            String device,
            String appVersion,
            bool debug)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Track() when $default != null:
        return $default(
            _that.activityType,
            _that.smartphonePosition,
            _that.timestamp,
            _that.userInfo,
            _that.startBatteryLevel,
            _that.isInBatterySaveMode,
            _that.cloudId,
            _that.downloadUrl,
            _that.testDuration,
            _that.experimentCode,
            _that.inferenceOutputs,
            _that.os,
            _that.device,
            _that.appVersion,
            _that.debug);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Track implements Track {
  const _Track(
      {required this.activityType,
      required this.smartphonePosition,
      @TimestampConverter() required this.timestamp,
      required this.userInfo,
      required this.startBatteryLevel,
      required this.isInBatterySaveMode,
      required this.cloudId,
      required this.downloadUrl,
      required this.testDuration,
      this.experimentCode,
      final List<InferenceOutput>? inferenceOutputs,
      this.os = '-',
      this.device = '-',
      this.appVersion = '-',
      this.debug = false})
      : _inferenceOutputs = inferenceOutputs;
  factory _Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);

  @override
  final ActivityType activityType;
  @override
  final SmartphonePosition smartphonePosition;
  @override
  @TimestampConverter()
  final DateTime timestamp;
  @override
  final UserInfo userInfo;
  @override
  final int startBatteryLevel;
  @override
  final bool isInBatterySaveMode;
  @override
  final String cloudId;
  @override
  final String downloadUrl;
  @override
  final int testDuration;
  @override
  final String? experimentCode;
  final List<InferenceOutput>? _inferenceOutputs;
  @override
  List<InferenceOutput>? get inferenceOutputs {
    final value = _inferenceOutputs;
    if (value == null) return null;
    if (_inferenceOutputs is EqualUnmodifiableListView)
      return _inferenceOutputs;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey()
  final String os;
  @override
  @JsonKey()
  final String device;
  @override
  @JsonKey()
  final String appVersion;
  @override
  @JsonKey()
  final bool debug;

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TrackCopyWith<_Track> get copyWith =>
      __$TrackCopyWithImpl<_Track>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$TrackToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Track &&
            (identical(other.activityType, activityType) ||
                other.activityType == activityType) &&
            (identical(other.smartphonePosition, smartphonePosition) ||
                other.smartphonePosition == smartphonePosition) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.userInfo, userInfo) ||
                other.userInfo == userInfo) &&
            (identical(other.startBatteryLevel, startBatteryLevel) ||
                other.startBatteryLevel == startBatteryLevel) &&
            (identical(other.isInBatterySaveMode, isInBatterySaveMode) ||
                other.isInBatterySaveMode == isInBatterySaveMode) &&
            (identical(other.cloudId, cloudId) || other.cloudId == cloudId) &&
            (identical(other.downloadUrl, downloadUrl) ||
                other.downloadUrl == downloadUrl) &&
            (identical(other.testDuration, testDuration) ||
                other.testDuration == testDuration) &&
            (identical(other.experimentCode, experimentCode) ||
                other.experimentCode == experimentCode) &&
            const DeepCollectionEquality()
                .equals(other._inferenceOutputs, _inferenceOutputs) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.debug, debug) || other.debug == debug));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      activityType,
      smartphonePosition,
      timestamp,
      userInfo,
      startBatteryLevel,
      isInBatterySaveMode,
      cloudId,
      downloadUrl,
      testDuration,
      experimentCode,
      const DeepCollectionEquality().hash(_inferenceOutputs),
      os,
      device,
      appVersion,
      debug);

  @override
  String toString() {
    return 'Track(activityType: $activityType, smartphonePosition: $smartphonePosition, timestamp: $timestamp, userInfo: $userInfo, startBatteryLevel: $startBatteryLevel, isInBatterySaveMode: $isInBatterySaveMode, cloudId: $cloudId, downloadUrl: $downloadUrl, testDuration: $testDuration, experimentCode: $experimentCode, inferenceOutputs: $inferenceOutputs, os: $os, device: $device, appVersion: $appVersion, debug: $debug)';
  }
}

/// @nodoc
abstract mixin class _$TrackCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$TrackCopyWith(_Track value, $Res Function(_Track) _then) =
      __$TrackCopyWithImpl;
  @override
  @useResult
  $Res call(
      {ActivityType activityType,
      SmartphonePosition smartphonePosition,
      @TimestampConverter() DateTime timestamp,
      UserInfo userInfo,
      int startBatteryLevel,
      bool isInBatterySaveMode,
      String cloudId,
      String downloadUrl,
      int testDuration,
      String? experimentCode,
      List<InferenceOutput>? inferenceOutputs,
      String os,
      String device,
      String appVersion,
      bool debug});

  @override
  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$TrackCopyWithImpl<$Res> implements _$TrackCopyWith<$Res> {
  __$TrackCopyWithImpl(this._self, this._then);

  final _Track _self;
  final $Res Function(_Track) _then;

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? activityType = null,
    Object? smartphonePosition = null,
    Object? timestamp = null,
    Object? userInfo = null,
    Object? startBatteryLevel = null,
    Object? isInBatterySaveMode = null,
    Object? cloudId = null,
    Object? downloadUrl = null,
    Object? testDuration = null,
    Object? experimentCode = freezed,
    Object? inferenceOutputs = freezed,
    Object? os = null,
    Object? device = null,
    Object? appVersion = null,
    Object? debug = null,
  }) {
    return _then(_Track(
      activityType: null == activityType
          ? _self.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      smartphonePosition: null == smartphonePosition
          ? _self.smartphonePosition
          : smartphonePosition // ignore: cast_nullable_to_non_nullable
              as SmartphonePosition,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userInfo: null == userInfo
          ? _self.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      startBatteryLevel: null == startBatteryLevel
          ? _self.startBatteryLevel
          : startBatteryLevel // ignore: cast_nullable_to_non_nullable
              as int,
      isInBatterySaveMode: null == isInBatterySaveMode
          ? _self.isInBatterySaveMode
          : isInBatterySaveMode // ignore: cast_nullable_to_non_nullable
              as bool,
      cloudId: null == cloudId
          ? _self.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _self.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      testDuration: null == testDuration
          ? _self.testDuration
          : testDuration // ignore: cast_nullable_to_non_nullable
              as int,
      experimentCode: freezed == experimentCode
          ? _self.experimentCode
          : experimentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      inferenceOutputs: freezed == inferenceOutputs
          ? _self._inferenceOutputs
          : inferenceOutputs // ignore: cast_nullable_to_non_nullable
              as List<InferenceOutput>?,
      os: null == os
          ? _self.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _self.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _self.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      debug: null == debug
          ? _self.debug
          : debug // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_self.userInfo, (value) {
      return _then(_self.copyWith(userInfo: value));
    });
  }
}

// dart format on
