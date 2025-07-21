import 'package:aifit_dashboard/features/tracks/models/track.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tracks_notifier.g.dart';

@riverpod
Stream<List<Track>> getTracks(Ref ref) async* {
  final ref = FirebaseFirestore.instance
      .collection('tracks')
      .orderBy('timestamp', descending: true);
  final stream = ref.snapshots();
  await for (final s in stream) {
    final docs = s.docs;
    try {
      final list = docs.map((d) {
        try {
          final s = Track.fromJson(d.data());
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
Stream<List<Track>> getTracksByExperimentId(
    Ref ref, String experimentId) async* {
  final ref = FirebaseFirestore.instance
      .collection('tracks')
      .where('experimentId', isEqualTo: experimentId);
  final stream = ref.snapshots();
  await for (final s in stream) {
    final docs = s.docs;
    try {
      final list = docs.map((d) {
        try {
          final s = Track.fromJson(d.data());
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
Stream<List<Track>> getTracksBySessionId(Ref ref, String sessionId) async* {
  final ref = FirebaseFirestore.instance
      .collection('tracks')
      .where('sessionId', isEqualTo: sessionId);
  final stream = ref.snapshots();
  await for (final s in stream) {
    final docs = s.docs;
    try {
      final list = docs.map((d) {
        try {
          final s = Track.fromJson(d.data());
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
