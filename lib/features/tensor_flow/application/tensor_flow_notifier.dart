import 'package:aifit_dashboard/features/tensor_flow/tensor_flow_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tensor_flow_notifier.g.dart';

@riverpod
Stream<List<TensorFlowModel>> getTensorFlowModel(Ref ref) async* {
  final ref = FirebaseFirestore.instance
      .collection('tf_models')
      .orderBy('version', descending: true);
  final stream = ref.snapshots();
  await for (final s in stream) {
    final docs = s.docs;
    try {
      final list = docs.map((d) {
        try {
          final s = TensorFlowModel.fromJson(d.data());
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
