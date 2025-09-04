// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Player _$PlayerFromJson(Map<String, dynamic> json) => _Player(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Sconosciuto',
      age: (json['age'] as num?)?.toInt(),
      height: (json['height'] as num?)?.toDouble(),
      weight: (json['weight'] as num?)?.toDouble(),
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']),
      subscribedOn: const TimestampConverter().fromJson(json['subscribedOn']),
      experimentLogs: (json['experimentLogs'] as List<dynamic>?)
              ?.map((e) => ExperimentLog.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PlayerToJson(_Player instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'age': instance.age,
      'height': instance.height,
      'weight': instance.weight,
      'gender': _$GenderEnumMap[instance.gender],
      'subscribedOn': _$JsonConverterToJson<dynamic, DateTime>(
          instance.subscribedOn, const TimestampConverter().toJson),
      'experimentLogs': instance.experimentLogs,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.notBinary: 'notBinary',
  Gender.notAvailable: 'notAvailable',
};

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
