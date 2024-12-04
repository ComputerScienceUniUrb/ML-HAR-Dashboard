import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExperimentsScreen extends ConsumerWidget {
  const ExperimentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Esperimenti'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.blue,
            onPressed: () {
              // TODO go to new experiment
            },
          ),
        ],
      ),
    );
  }
}
