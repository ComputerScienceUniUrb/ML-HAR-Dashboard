// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tensor_flow_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TensorFlowModel _$TensorFlowModelFromJson(Map<String, dynamic> json) =>
    TensorFlowModel(
      id: json['id'] as String,
      url: json['url'] as String,
      enabled: json['enabled'] as bool,
      version: (json['version'] as num).toInt(),
      addedOn: const TimestampConverter().fromJson(json['addedOn']),
      note: json['note'] as String?,
    );

Map<String, dynamic> _$TensorFlowModelToJson(TensorFlowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'enabled': instance.enabled,
      'version': instance.version,
      'note': instance.note,
      'addedOn': const TimestampConverter().toJson(instance.addedOn),
    };
