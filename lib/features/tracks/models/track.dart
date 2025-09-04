import 'package:aifit_dashboard/core/data/converters.dart';
import 'package:aifit_dashboard/features/tracks/models/activity_type.dart';
import 'package:aifit_dashboard/features/tracks/models/inference_output.dart';
import 'package:aifit_dashboard/features/tracks/models/smartphone_position.dart';
import 'package:aifit_dashboard/features/tracks/models/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';

part 'track.g.dart';

@freezed
abstract class Track with _$Track {
  const factory Track({
    required ActivityType activityType,
    required SmartphonePosition smartphonePosition,
    @TimestampConverter() required DateTime timestamp,
    required UserInfo userInfo,
    required int startBatteryLevel,
    required bool isInBatterySaveMode,
    required String cloudId,
    required String downloadUrl,
    required int testDuration,
    String? experimentCode,
    List<InferenceOutput>? inferenceOutputs,
    @Default('-') String os,
    @Default('-') String device,
    @Default('-') String appVersion,
    @Default(false) bool debug,
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
