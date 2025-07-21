import 'package:aifit_dashboard/core/data/firestore_references.dart';
import 'package:aifit_dashboard/features/sessions/application/players_notifier.dart';
import 'package:aifit_dashboard/features/sessions/models/player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class PlayerScreen extends ConsumerWidget {
  final String sessionId;

  const PlayerScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(getPlayersProvider(sessionId)).valueOrNull ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Players'),
      ),
      body: players.isEmpty
          ? const Center(
              child: Text('Non ci sono iscritti'),
            )
          : ListView(
              padding: const EdgeInsets.all(8.0),
              children: [
                for (int i = 0; i < players.length; i++)
                  PLayerTile(
                    player: players[i],
                    index: '${i + 1}',
                    onDelete: () {
                      final playerId = players[i].id;
                      FirestoreReference.playerDoc(sessionId, playerId)
                          .delete();
                    },
                  )
              ],
            ),
    );
  }
}

class PLayerTile extends StatelessWidget {
  final Player player;
  final String index;
  final Function() onDelete;

  const PLayerTile({
    super.key,
    required this.player,
    required this.index,
    required this.onDelete,
  });

  static final dateFormat = DateFormat('dd/MM/yyyy HH:mm');

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        player.subscribedOn != null
            ? dateFormat.format(player.subscribedOn!)
            : 'Unknown',
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Row(
        children: [
          Text(
              'Anni: ${player.age ?? '-'} | Genere: ${player.gender} | Peso: ${player.weight ?? '-'} | Altezza: ${player.height ?? '-'}'),
        ],
      ),
      leading: CircleAvatar(
        radius: 20,
        child: Text(index),
      ),
      trailing: ElevatedButton(
        onPressed: onDelete,
        child: const Text('Elimina'),
      ),
    );
  }
}
