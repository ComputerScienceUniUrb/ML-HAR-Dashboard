// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionImpl _$$SessionImplFromJson(Map<String, dynamic> json) =>
    _$SessionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      name: json['name'] as String,
      selectedExperimentId: json['selectedExperimentId'] as String?,
      experiments: (json['experiments'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      status: $enumDecodeNullable(_$SessionStatusEnumMap, json['status']) ??
          SessionStatus.opened,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$SessionImplToJson(_$SessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'name': instance.name,
      'selectedExperimentId': instance.selectedExperimentId,
      'experiments': instance.experiments,
      'status': _$SessionStatusEnumMap[instance.status]!,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };

const _$SessionStatusEnumMap = {
  SessionStatus.draft: 'draft',
  SessionStatus.opened: 'opened',
  SessionStatus.live: 'live',
  SessionStatus.closed: 'closed',
};
