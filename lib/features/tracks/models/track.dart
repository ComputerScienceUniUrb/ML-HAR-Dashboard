import 'package:aifit_dashboard/features/tracks/models/activity_type.dart';
import 'package:aifit_dashboard/features/tracks/models/smartphone_position.dart';
import 'package:aifit_dashboard/features/tracks/models/user_info.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';

part 'track.g.dart';

@freezed
class Track with _$Track {
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
  }) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}

class TimestampConverter implements JsonConverter<DateTime, dynamic> {
  const TimestampConverter();

  @override
  DateTime fromJson(dynamic value) {
    return (value as Timestamp).toDate();
  }

  @override
  Timestamp toJson(DateTime fieldValue) => Timestamp.fromDate(fieldValue);
}
