import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:collection/collection.dart';

part 'sessions_notifier.g.dart';

@riverpod
Stream<List<Session>> getSessions(Ref ref) async* {
  final ref = FirebaseFirestore.instance
      .collection('sessions')
      .orderBy('createdAt', descending: true);
  final stream = ref.snapshots();
  await for (final s in stream) {
    final docs = s.docs;
    try {
      final list = docs.map((d) {
        try {
          final s = Session.fromJson(d.data());
          return s;
        } catch (ex, st) {
          print(ex);
          print(st);
          return null;
        }
      });
      yield list.nonNulls.toList();
    } catch (ex, st) {
      print(ex);
      print(st);
    }
  }
}

@riverpod
Stream<Session> getSessionsById(Ref ref, String sessionId) async* {
  final ref = FirebaseFirestore.instance.collection('sessions').doc(sessionId);
  final stream = ref.snapshots();
  await for (final s in stream) {
    try {
      final data = s.data();
      if (s.exists && data != null) {
        yield Session.fromJson(data);
      }
    } catch (ex, st) {
      print(ex);
      print(st);
    }
  }
}

