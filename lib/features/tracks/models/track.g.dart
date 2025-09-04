// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Track _$TrackFromJson(Map<String, dynamic> json) => _Track(
      activityType: $enumDecode(_$ActivityTypeEnumMap, json['activityType']),
      smartphonePosition:
          $enumDecode(_$SmartphonePositionEnumMap, json['smartphonePosition']),
      timestamp: const TimestampConverter().fromJson(json['timestamp']),
      userInfo: UserInfo.fromJson(json['userInfo'] as Map<String, dynamic>),
      startBatteryLevel: (json['startBatteryLevel'] as num).toInt(),
      isInBatterySaveMode: json['isInBatterySaveMode'] as bool,
      cloudId: json['cloudId'] as String,
      downloadUrl: json['downloadUrl'] as String,
      testDuration: (json['testDuration'] as num).toInt(),
      experimentCode: json['experimentCode'] as String?,
      inferenceOutputs: (json['inferenceOutputs'] as List<dynamic>?)
          ?.map((e) => InferenceOutput.fromJson(e as Map<String, dynamic>))
          .toList(),
      os: json['os'] as String? ?? '-',
      device: json['device'] as String? ?? '-',
      appVersion: json['appVersion'] as String? ?? '-',
      debug: json['debug'] as bool? ?? false,
    );

Map<String, dynamic> _$TrackToJson(_Track instance) => <String, dynamic>{
      'activityType': _$ActivityTypeEnumMap[instance.activityType]!,
      'smartphonePosition':
          _$SmartphonePositionEnumMap[instance.smartphonePosition]!,
      'timestamp': const TimestampConverter().toJson(instance.timestamp),
      'userInfo': instance.userInfo,
      'startBatteryLevel': instance.startBatteryLevel,
      'isInBatterySaveMode': instance.isInBatterySaveMode,
      'cloudId': instance.cloudId,
      'downloadUrl': instance.downloadUrl,
      'testDuration': instance.testDuration,
      'experimentCode': instance.experimentCode,
      'inferenceOutputs': instance.inferenceOutputs,
      'os': instance.os,
      'device': instance.device,
      'appVersion': instance.appVersion,
      'debug': instance.debug,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.forwardArmRotation: 'forwardArmRotation',
  ActivityType.backwardsArmRotation: 'backwardsArmRotation',
  ActivityType.clapHands: 'clapHands',
  ActivityType.onBicycle: 'onBicycle',
  ActivityType.inVehicle: 'inVehicle',
  ActivityType.stand: 'stand',
  ActivityType.sit: 'sit',
  ActivityType.talkSit: 'talkSit',
  ActivityType.standSit: 'standSit',
  ActivityType.lay: 'lay',
  ActivityType.jump: 'jump',
  ActivityType.walk: 'walk',
  ActivityType.walkOnSpot: 'walkOnSpot',
  ActivityType.walkingBack: 'walkingBack',
  ActivityType.walkingCircle: 'walkingCircle',
  ActivityType.tapisRoulant: 'tapisRoulant',
  ActivityType.horizontalCyclette: 'horizontalCyclette',
  ActivityType.verticalCyclette: 'verticalCyclette',
  ActivityType.run: 'run',
  ActivityType.runOnSpot: 'runOnSpot',
  ActivityType.sideOpening: 'sideOpening',
  ActivityType.upperArmAndTorsoStretch: 'upperArmAndTorsoStretch',
  ActivityType.middleSquat: 'middleSquat',
  ActivityType.standingLunges: 'standingLunges',
  ActivityType.heelLift: 'heelLift',
  ActivityType.torsoTorsion: 'torsoTorsion',
};

const _$SmartphonePositionEnumMap = {
  SmartphonePosition.byHand: 'byHand',
  SmartphonePosition.byHandPortrait: 'byHandPortrait',
  SmartphonePosition.pocket: 'pocket',
};
