// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'track.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Track _$TrackFromJson(Map<String, dynamic> json) {
  return _Track.fromJson(json);
}

/// @nodoc
mixin _$Track {
  ActivityType get activityType => throw _privateConstructorUsedError;
  SmartphonePosition get smartphonePosition =>
      throw _privateConstructorUsedError;
  @TimestampConverter()
  DateTime get timestamp => throw _privateConstructorUsedError;
  UserInfo get userInfo => throw _privateConstructorUsedError;
  int get startBatteryLevel => throw _privateConstructorUsedError;
  bool get isInBatterySaveMode => throw _privateConstructorUsedError;
  String get cloudId => throw _privateConstructorUsedError;
  String get downloadUrl => throw _privateConstructorUsedError;
  String? get experimentCode => throw _privateConstructorUsedError;
  String get os => throw _privateConstructorUsedError;
  String get device => throw _privateConstructorUsedError;
  String get appVersion => throw _privateConstructorUsedError;
  int get testDuration => throw _privateConstructorUsedError;

  /// Serializes this Track to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $TrackCopyWith<Track> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TrackCopyWith<$Res> {
  factory $TrackCopyWith(Track value, $Res Function(Track) then) =
      _$TrackCopyWithImpl<$Res, Track>;
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
      String? experimentCode,
      String os,
      String device,
      String appVersion,
      int testDuration});

  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class _$TrackCopyWithImpl<$Res, $Val extends Track>
    implements $TrackCopyWith<$Res> {
  _$TrackCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    Object? experimentCode = freezed,
    Object? os = null,
    Object? device = null,
    Object? appVersion = null,
    Object? testDuration = null,
  }) {
    return _then(_value.copyWith(
      activityType: null == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      smartphonePosition: null == smartphonePosition
          ? _value.smartphonePosition
          : smartphonePosition // ignore: cast_nullable_to_non_nullable
              as SmartphonePosition,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      startBatteryLevel: null == startBatteryLevel
          ? _value.startBatteryLevel
          : startBatteryLevel // ignore: cast_nullable_to_non_nullable
              as int,
      isInBatterySaveMode: null == isInBatterySaveMode
          ? _value.isInBatterySaveMode
          : isInBatterySaveMode // ignore: cast_nullable_to_non_nullable
              as bool,
      cloudId: null == cloudId
          ? _value.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      experimentCode: freezed == experimentCode
          ? _value.experimentCode
          : experimentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      testDuration: null == testDuration
          ? _value.testDuration
          : testDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserInfoCopyWith<$Res> get userInfo {
    return $UserInfoCopyWith<$Res>(_value.userInfo, (value) {
      return _then(_value.copyWith(userInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$TrackImplCopyWith<$Res> implements $TrackCopyWith<$Res> {
  factory _$$TrackImplCopyWith(
          _$TrackImpl value, $Res Function(_$TrackImpl) then) =
      __$$TrackImplCopyWithImpl<$Res>;
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
      String? experimentCode,
      String os,
      String device,
      String appVersion,
      int testDuration});

  @override
  $UserInfoCopyWith<$Res> get userInfo;
}

/// @nodoc
class __$$TrackImplCopyWithImpl<$Res>
    extends _$TrackCopyWithImpl<$Res, _$TrackImpl>
    implements _$$TrackImplCopyWith<$Res> {
  __$$TrackImplCopyWithImpl(
      _$TrackImpl _value, $Res Function(_$TrackImpl) _then)
      : super(_value, _then);

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
    Object? experimentCode = freezed,
    Object? os = null,
    Object? device = null,
    Object? appVersion = null,
    Object? testDuration = null,
  }) {
    return _then(_$TrackImpl(
      activityType: null == activityType
          ? _value.activityType
          : activityType // ignore: cast_nullable_to_non_nullable
              as ActivityType,
      smartphonePosition: null == smartphonePosition
          ? _value.smartphonePosition
          : smartphonePosition // ignore: cast_nullable_to_non_nullable
              as SmartphonePosition,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      userInfo: null == userInfo
          ? _value.userInfo
          : userInfo // ignore: cast_nullable_to_non_nullable
              as UserInfo,
      startBatteryLevel: null == startBatteryLevel
          ? _value.startBatteryLevel
          : startBatteryLevel // ignore: cast_nullable_to_non_nullable
              as int,
      isInBatterySaveMode: null == isInBatterySaveMode
          ? _value.isInBatterySaveMode
          : isInBatterySaveMode // ignore: cast_nullable_to_non_nullable
              as bool,
      cloudId: null == cloudId
          ? _value.cloudId
          : cloudId // ignore: cast_nullable_to_non_nullable
              as String,
      downloadUrl: null == downloadUrl
          ? _value.downloadUrl
          : downloadUrl // ignore: cast_nullable_to_non_nullable
              as String,
      experimentCode: freezed == experimentCode
          ? _value.experimentCode
          : experimentCode // ignore: cast_nullable_to_non_nullable
              as String?,
      os: null == os
          ? _value.os
          : os // ignore: cast_nullable_to_non_nullable
              as String,
      device: null == device
          ? _value.device
          : device // ignore: cast_nullable_to_non_nullable
              as String,
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      testDuration: null == testDuration
          ? _value.testDuration
          : testDuration // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$TrackImpl implements _Track {
  const _$TrackImpl(
      {required this.activityType,
      required this.smartphonePosition,
      @TimestampConverter() required this.timestamp,
      required this.userInfo,
      required this.startBatteryLevel,
      required this.isInBatterySaveMode,
      required this.cloudId,
      required this.downloadUrl,
      this.experimentCode,
      this.os = '-',
      this.device = '-',
      this.appVersion = '-',
      required this.testDuration});

  factory _$TrackImpl.fromJson(Map<String, dynamic> json) =>
      _$$TrackImplFromJson(json);

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
  final String? experimentCode;
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
  final int testDuration;

  @override
  String toString() {
    return 'Track(activityType: $activityType, smartphonePosition: $smartphonePosition, timestamp: $timestamp, userInfo: $userInfo, startBatteryLevel: $startBatteryLevel, isInBatterySaveMode: $isInBatterySaveMode, cloudId: $cloudId, downloadUrl: $downloadUrl, experimentCode: $experimentCode, os: $os, device: $device, appVersion: $appVersion, testDuration: $testDuration)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TrackImpl &&
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
            (identical(other.experimentCode, experimentCode) ||
                other.experimentCode == experimentCode) &&
            (identical(other.os, os) || other.os == os) &&
            (identical(other.device, device) || other.device == device) &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.testDuration, testDuration) ||
                other.testDuration == testDuration));
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
      experimentCode,
      os,
      device,
      appVersion,
      testDuration);

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      __$$TrackImplCopyWithImpl<_$TrackImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$TrackImplToJson(
      this,
    );
  }
}

abstract class _Track implements Track {
  const factory _Track(
      {required final ActivityType activityType,
      required final SmartphonePosition smartphonePosition,
      @TimestampConverter() required final DateTime timestamp,
      required final UserInfo userInfo,
      required final int startBatteryLevel,
      required final bool isInBatterySaveMode,
      required final String cloudId,
      required final String downloadUrl,
      final String? experimentCode,
      final String os,
      final String device,
      final String appVersion,
      required final int testDuration}) = _$TrackImpl;

  factory _Track.fromJson(Map<String, dynamic> json) = _$TrackImpl.fromJson;

  @override
  ActivityType get activityType;
  @override
  SmartphonePosition get smartphonePosition;
  @override
  @TimestampConverter()
  DateTime get timestamp;
  @override
  UserInfo get userInfo;
  @override
  int get startBatteryLevel;
  @override
  bool get isInBatterySaveMode;
  @override
  String get cloudId;
  @override
  String get downloadUrl;
  @override
  String? get experimentCode;
  @override
  String get os;
  @override
  String get device;
  @override
  String get appVersion;
  @override
  int get testDuration;

  /// Create a copy of Track
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$TrackImplCopyWith<_$TrackImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
