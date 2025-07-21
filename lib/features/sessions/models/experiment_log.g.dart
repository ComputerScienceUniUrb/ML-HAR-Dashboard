// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'experiment_log.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExperimentLogImpl _$$ExperimentLogImplFromJson(Map<String, dynamic> json) =>
    _$ExperimentLogImpl(
      id: json['id'] as String,
      experimentId: json['experimentId'] as String,
      runningId: json['runningId'] as String,
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
    );

Map<String, dynamic> _$$ExperimentLogImplToJson(_$ExperimentLogImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'experimentId': instance.experimentId,
      'runningId': instance.runningId,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
    };
