import 'package:aifit_dashboard/core/data/firestore_references.dart';
import 'package:aifit_dashboard/features/sessions/models/session_step.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_repository.g.dart';

@riverpod
SessionRepository getSessionRepository(Ref ref) {
  return SessionRepository();
}

class SessionRepository{


  Future<void> writeStep(String sessionId, SessionStep step) async {
    await FirestoreReference.stepDoc(sessionId, step.id).set(step.toJson());
  }
}