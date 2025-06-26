import 'package:aifit_dashboard/core/data/converters.dart';
import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_step.freezed.dart';

part 'session_step.g.dart';

enum SessionStepAction{
  open,
  start,
  addExperiment,
  removeExperiment,
  selectExperiment,
  stop,
  close,
  reset,
  clearParticipants,
}

@freezed
class SessionStep with _$SessionStep {
  const factory SessionStep({
    required String id,
    required SessionStepAction action,
    required SessionStatus currentStatus,
    @TimestampConverter() required DateTime createdAt,
    String? experimentId,
  }) = _SessionStep;

  factory SessionStep.fromJson(Map<String, dynamic> json) =>
      _$SessionStepFromJson(json);
}
