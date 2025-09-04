
import 'package:freezed_annotation/freezed_annotation.dart';

part 'inference_output.g.dart';

enum ActivityOutput {
  stand,
  armRotation,
  backwardsArmRotation,
  walkOnSpot,
  runOnSpot,
  sideOpening,
  torsoTorsion,
  heelLift,
  jump,
}

@JsonSerializable()
class InferenceOutput {
  final double age;
  final double weight;
  final double height;
  final ActivityOutput activity;
  final List<Map<ActivityOutput, double>> activities;
  final int activityIndex;
  final double gender;

  const InferenceOutput({
    required this.age,
    required this.weight,
    required this.height,
    required this.activity,
    required this.activities,
    required this.activityIndex,
    required this.gender,
  });

  factory InferenceOutput.fromJson(Map<String, dynamic> json) =>
      _$InferenceOutputFromJson(json);
}
