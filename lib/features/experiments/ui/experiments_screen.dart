import 'package:aifit_dashboard/features/experiments/application/experiments_notifier.dart';
import 'package:aifit_dashboard/features/experiments/models/experiment.dart';
import 'package:aifit_dashboard/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExperimentsScreen extends ConsumerWidget {
  const ExperimentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(listenExperimentsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esperimenti'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.blue,
            onPressed: () {
              context.go('/experiments/new');
            },
          ),
        ],
      ),
      body: switch (state) {
        AsyncData<List<Experiment>>(value: final list) => list.isEmpty
            ? const Center(
                child: Text(
                    'Non ci sono esperimenti!\nCrea un esperimento premendo il pulsante + in alto a destra.'),
              )
            : ListView(
                children: [
                  for (final e in list)
                    ListTile(
                      onTap: (){
                        context.go('/experiments/details/${e.id}');
                      },
                      title: Text(e.name),
                    )
                ],
              ),
        _ => const Center(
            child: CircularProgressIndicator(),
          )
      },
    );
  }
}
