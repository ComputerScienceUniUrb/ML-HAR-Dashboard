import 'package:aifit_dashboard/features/tracks/models/gender.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_info.freezed.dart';

part 'user_info.g.dart';

@freezed
class UserInfo with _$UserInfo {
  const factory UserInfo({
    required int age,
    required double weight,
    required Gender gender,
    required int height,
  }) = _UserInfo;

  factory UserInfo.fromJson(Map<String, dynamic> json) =>
      _$UserInfoFromJson(json);
}

extension UserInfoX on UserInfo {
  // bool get isSomethingMissing {
  //   return age == null || weight == null || height == null || gender == null;
  // }
}
