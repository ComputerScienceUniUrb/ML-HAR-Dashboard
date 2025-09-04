// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inference_output.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InferenceOutput _$InferenceOutputFromJson(Map<String, dynamic> json) =>
    InferenceOutput(
      age: (json['age'] as num).toDouble(),
      weight: (json['weight'] as num).toDouble(),
      height: (json['height'] as num).toDouble(),
      activity: $enumDecode(_$ActivityOutputEnumMap, json['activity']),
      activities: (json['activities'] as List<dynamic>)
          .map((e) => (e as Map<String, dynamic>).map(
                (k, e) => MapEntry($enumDecode(_$ActivityOutputEnumMap, k),
                    (e as num).toDouble()),
              ))
          .toList(),
      activityIndex: (json['activityIndex'] as num).toInt(),
      gender: (json['gender'] as num).toDouble(),
    );

Map<String, dynamic> _$InferenceOutputToJson(InferenceOutput instance) =>
    <String, dynamic>{
      'age': instance.age,
      'weight': instance.weight,
      'height': instance.height,
      'activity': _$ActivityOutputEnumMap[instance.activity]!,
      'activities': instance.activities
          .map((e) => e.map((k, e) => MapEntry(_$ActivityOutputEnumMap[k]!, e)))
          .toList(),
      'activityIndex': instance.activityIndex,
      'gender': instance.gender,
    };

const _$ActivityOutputEnumMap = {
  ActivityOutput.stand: 'stand',
  ActivityOutput.armRotation: 'armRotation',
  ActivityOutput.backwardsArmRotation: 'backwardsArmRotation',
  ActivityOutput.walkOnSpot: 'walkOnSpot',
  ActivityOutput.runOnSpot: 'runOnSpot',
  ActivityOutput.sideOpening: 'sideOpening',
  ActivityOutput.torsoTorsion: 'torsoTorsion',
  ActivityOutput.heelLift: 'heelLift',
  ActivityOutput.jump: 'jump',
};
