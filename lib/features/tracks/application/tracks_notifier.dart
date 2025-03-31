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
      yield docs.map((d) => Track.fromJson(d.data())).toList();
    } catch (ex, st) {
      print(ex);
      print(st);
    }
  }
}

@riverpod
Stream<List<Track>> getTracksByExperimentCode(Ref ref, String code) async* {
  final ref = FirebaseFirestore.instance
      .collection('tracks')
      .where('experimentCode', isEqualTo: code);
  final stream = ref.snapshots();
  await for (final s in stream) {
    final docs = s.docs;
    try {
      yield docs.map((d) => Track.fromJson(d.data())).toList();
    } catch (ex, st) {
      print(ex);
      print(st);
    }
  }
}
