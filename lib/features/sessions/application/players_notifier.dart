import 'package:aifit_dashboard/features/sessions/models/player.dart';
import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:aifit_dashboard/features/sessions/models/session_step.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'players_notifier.g.dart';

@riverpod
Stream<List<Player>> getPlayers(Ref ref, String sessionId) async* {
  final ref = FirebaseFirestore.instance
      .collection('sessions')
      .doc(sessionId)
      .collection('players');
  final stream = ref.snapshots();
  await for (final s in stream) {
    final docs = s.docs;
    try {
      final output= docs.map((d) => Player.fromJson(d.data())).toList();
      output.sort((a,b)=>a.id.compareTo(b.id));
      yield output;
    } catch (ex, st) {
      print(ex);
      print(st);
    }
  }
}

@Riverpod(dependencies: [getPlayers])
int getPlayersCount(Ref ref, String sessionId){
  return ref.watch(getPlayersProvider(sessionId)).valueOrNull?.length ?? 0;
}
