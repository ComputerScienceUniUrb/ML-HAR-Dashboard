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
      fileName: json['fileName'] as String,
      trainedOn: const TimestampConverter().fromJson(json['trainedOn']),
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$TensorFlowModelToJson(TensorFlowModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'url': instance.url,
      'enabled': instance.enabled,
      'version': instance.version,
      'notes': instance.notes,
      'fileName': instance.fileName,
      'addedOn': _$JsonConverterToJson<dynamic, DateTime>(
          instance.addedOn, const TimestampConverter().toJson),
      'trainedOn': _$JsonConverterToJson<dynamic, DateTime>(
          instance.trainedOn, const TimestampConverter().toJson),
    };

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
