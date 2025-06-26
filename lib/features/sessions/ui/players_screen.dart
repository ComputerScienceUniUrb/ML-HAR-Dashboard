import 'package:aifit_dashboard/features/sessions/application/players_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerScreen extends ConsumerWidget {
  final String sessionId;

  const PlayerScreen({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(getPlayersProvider(sessionId)).valueOrNull ??[];

    return Scaffold(
      appBar: AppBar(
        title: Text('Players'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8.0),
        children: [
          for(final p in players)
            ListTile(
              title: Text(p.id),
            )
        ],
      ),
    );
  }
}
