import 'package:aifit_dashboard/features/experiments/models/experiment.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'experiments_notifier.g.dart';

@riverpod
Stream<List<Experiment>> listenExperiments(Ref ref) async* {
  final ref = FirebaseFirestore.instance.collection('experiments');
  final stream = ref.snapshots();
  await for (final s in stream) {
    final docs = s.docs;
    try {
      yield docs.map((d) => Experiment.fromJson(d.data())).toList();
    } catch (ex, st) {
      print(ex);
      print(st);
    }
  }
}

@riverpod
Stream<Experiment> listenExperiment(Ref ref, String experimentId) async* {
  final ref =
      FirebaseFirestore.instance.collection('experiments').doc(experimentId);
  final stream = ref.snapshots();
  await for (final s in stream) {
    final data = s.data();
    try {
      if (data != null) {
        yield Experiment.fromJson(data);
      }
    } catch (ex, st) {
      print(ex);
      print(st);
    }
  }
}

@riverpod
Future<Experiment?> getExperimentById(Ref ref, String experimentId) async {
  final ref =
      FirebaseFirestore.instance.collection('experiments').doc(experimentId);
  final doc = await ref.get();
  final data = doc.data();
  if (doc.exists && data != null) {
    return Experiment.fromJson(data);
  }
  return null;
}
