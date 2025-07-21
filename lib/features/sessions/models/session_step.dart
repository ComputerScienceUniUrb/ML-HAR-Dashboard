import 'package:aifit_dashboard/core/data/converters.dart';
import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'session_step.freezed.dart';

part 'session_step.g.dart';

enum SessionStepAction {
  open,
  start,
  addExperiment,
  removeExperiment,
  selectExperiment,
  startExperiment,
  stopExperiment,
  stop,
  close,
  reset,
  clearParticipants;

  String get translate {
    switch (this) {
      case SessionStepAction.open:
        return 'Apri Sessione';
      case SessionStepAction.start:
        return 'Avvia Sessione';
      case SessionStepAction.addExperiment:
        return 'Associa Esperimento';
      case SessionStepAction.removeExperiment:
        return 'Rimuovi Esperimento';
      case SessionStepAction.selectExperiment:
        return 'Seleziona Esperimento';
      case SessionStepAction.startExperiment:
        return 'Avvio Esperimento';
        case SessionStepAction.stopExperiment:
        return 'Interrompi Esperimento';
      case SessionStepAction.stop:
        return 'Interrompi Sessione';
      case SessionStepAction.close:
        return 'Chiudi Sessione';
      case SessionStepAction.reset:
        return 'Reset Sessione';
      case SessionStepAction.clearParticipants:
        return 'Elimina partecipanti';
    }
  }
}

@freezed
class SessionStep with _$SessionStep {
  const factory SessionStep({
    required String id,
    required SessionStepAction action,
    required SessionStatus currentStatus,
    @TimestampConverter() required DateTime createdAt,
    String? experimentId,
    String? runningId,
  }) = _SessionStep;

  factory SessionStep.fromJson(Map<String, dynamic> json) =>
      _$SessionStepFromJson(json);
}
