import 'package:aifit_dashboard/features/experiments/application/experiments_notifier.dart';
import 'package:aifit_dashboard/features/experiments/models/experiment.dart';
import 'package:aifit_dashboard/features/tracks/ui/widgets/experiment_track_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ExperimentDetailsScreen extends ConsumerWidget {
  final String experimentId;
  final Experiment? experiment;

  const ExperimentDetailsScreen({
    required this.experimentId,
    required this.experiment,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var experiment = this.experiment;
    experiment ??=
        ref.watch(listenExperimentProvider(experimentId)).valueOrNull;

    return Scaffold(
      appBar: AppBar(
        actions: [
          ElevatedButton(
            onPressed: () {
              context.go(
                '/experiments/details/$experimentId/edit',
                extra: experiment,
              );
            },
            child: const Text('Modifica'),
          ),
        ],
      ),
      body: experiment == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                _DetailWidget(
                  label: 'Nome',
                  text: experiment.name,
                ),
                _DetailWidget(
                  label: 'Descrizione',
                  text: experiment.description,
                ),
                _DetailWidget(
                  label: 'Codice',
                  text: experiment.shortCode,
                ),
                _DetailWidget(
                  label: 'Override attività',
                  text: experiment.activityTypeOverride?.translate,
                ),
                _DetailWidget(
                  label: 'Override posizione smartphone',
                  text: experiment.smartphonePositionOverride?.translate,
                ),
                SizedBox(
                    height: 600,
                    child: ExperimentTrackList(
                      experimentCode: experiment.shortCode,
                    )),
              ],
            ),
    );
  }
}

class _DetailWidget extends StatelessWidget {
  final String label;
  final String? text;

  const _DetailWidget({super.key, required this.label, required this.text});

  @override
  Widget build(BuildContext context) {
    final titleStyle = const TextStyle(fontSize: 18, color: Colors.grey);
    final textStyle = const TextStyle(fontSize: 20, color: Colors.black);
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: titleStyle,
          ),
          Text(
            text ?? '-',
            style: textStyle,
          ),
        ],
      ),
    );
  }
}
