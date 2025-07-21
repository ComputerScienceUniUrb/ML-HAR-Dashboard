// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SessionStepImpl _$$SessionStepImplFromJson(Map<String, dynamic> json) =>
    _$SessionStepImpl(
      id: json['id'] as String,
      action: $enumDecode(_$SessionStepActionEnumMap, json['action']),
      currentStatus: $enumDecode(_$SessionStatusEnumMap, json['currentStatus']),
      createdAt: const TimestampConverter().fromJson(json['createdAt']),
      experimentId: json['experimentId'] as String?,
      runningId: json['runningId'] as String?,
    );

Map<String, dynamic> _$$SessionStepImplToJson(_$SessionStepImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'action': _$SessionStepActionEnumMap[instance.action]!,
      'currentStatus': _$SessionStatusEnumMap[instance.currentStatus]!,
      'createdAt': const TimestampConverter().toJson(instance.createdAt),
      'experimentId': instance.experimentId,
      'runningId': instance.runningId,
    };

const _$SessionStepActionEnumMap = {
  SessionStepAction.open: 'open',
  SessionStepAction.start: 'start',
  SessionStepAction.addExperiment: 'addExperiment',
  SessionStepAction.removeExperiment: 'removeExperiment',
  SessionStepAction.selectExperiment: 'selectExperiment',
  SessionStepAction.startExperiment: 'startExperiment',
  SessionStepAction.stopExperiment: 'stopExperiment',
  SessionStepAction.stop: 'stop',
  SessionStepAction.close: 'close',
  SessionStepAction.reset: 'reset',
  SessionStepAction.clearParticipants: 'clearParticipants',
};

const _$SessionStatusEnumMap = {
  SessionStatus.draft: 'draft',
  SessionStatus.opened: 'opened',
  SessionStatus.live: 'live',
  SessionStatus.closed: 'closed',
};
