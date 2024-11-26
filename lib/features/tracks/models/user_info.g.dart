// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInfoImpl _$$UserInfoImplFromJson(Map<String, dynamic> json) =>
    _$UserInfoImpl(
      age: (json['age'] as num).toInt(),
      weight: (json['weight'] as num).toDouble(),
      gender: $enumDecode(_$GenderEnumMap, json['gender']),
      height: (json['height'] as num).toInt(),
    );

Map<String, dynamic> _$$UserInfoImplToJson(_$UserInfoImpl instance) =>
    <String, dynamic>{
      'age': instance.age,
      'weight': instance.weight,
      'gender': _$GenderEnumMap[instance.gender]!,
      'height': instance.height,
    };

const _$GenderEnumMap = {
  Gender.male: 'male',
  Gender.female: 'female',
  Gender.notBinary: 'notBinary',
  Gender.notAvailable: 'notAvailable',
};
