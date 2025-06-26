import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:aifit_dashboard/features/sessions/models/session_step.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'session_steps_notifier.g.dart';

@riverpod
Stream<List<SessionStep>> getSessionSteps(Ref ref, String sessionId) async* {
  final ref = FirebaseFirestore.instance
      .collection('sessions')
      .doc(sessionId)
      .collection('steps')
      .orderBy('createdAt', descending: true);
  final stream = ref.snapshots();
  await for (final s in stream) {
    final docs = s.docs;
    try {
      yield docs.map((d) => SessionStep.fromJson(d.data())).toList();
    } catch (ex, st) {
      print(ex);
      print(st);
    }
  }
}
