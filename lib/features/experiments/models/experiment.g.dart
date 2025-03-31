// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperimentImpl _$$ExperimentImplFromJson(Map<String, dynamic> json) =>
    _$ExperimentImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      shortCode: json['shortCode'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      description: json['description'] as String?,
      activityTypeOverride: $enumDecodeNullable(
          _$ActivityTypeEnumMap, json['activityTypeOverride']),
      smartphonePositionOverride: $enumDecodeNullable(
          _$SmartphonePositionEnumMap, json['smartphonePositionOverride']),
      enabled: json['enabled'] as bool? ?? false,
    );

Map<String, dynamic> _$$ExperimentImplToJson(_$ExperimentImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'shortCode': instance.shortCode,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'description': instance.description,
      'activityTypeOverride':
          _$ActivityTypeEnumMap[instance.activityTypeOverride],
      'smartphonePositionOverride':
          _$SmartphonePositionEnumMap[instance.smartphonePositionOverride],
      'enabled': instance.enabled,
    };

const _$ActivityTypeEnumMap = {
  ActivityType.armRotation: 'armRotation',
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
};

const _$SmartphonePositionEnumMap = {
  SmartphonePosition.byHand: 'byHand',
  SmartphonePosition.byHandPortrait: 'byHandPortrait',
  SmartphonePosition.pocket: 'pocket',
  SmartphonePosition.pouch: 'pouch',
  SmartphonePosition.handleBar: 'handleBar',
};
