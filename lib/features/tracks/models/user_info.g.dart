// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInfo _$UserInfoFromJson(Map<String, dynamic> json) => _UserInfo(
      age: (json['age'] as num?)?.toInt() ?? 0,
      weight: (json['weight'] as num?)?.toDouble() ?? 0.0,
      gender: $enumDecodeNullable(_$GenderEnumMap, json['gender']) ??
          Gender.notAvailable,
      height: (json['height'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$UserInfoToJson(_UserInfo instance) => <String, dynamic>{
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
