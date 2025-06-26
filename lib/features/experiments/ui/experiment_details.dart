import 'package:aifit_dashboard/features/experiments/application/experiments_notifier.dart';
import 'package:aifit_dashboard/features/experiments/models/experiment.dart';
import 'package:aifit_dashboard/features/tracks/ui/widgets/experiment_track_list.dart';
import 'package:aifit_dashboard/features/tracks/ui/widgets/track_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

    if (experiment == null) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final infoWidgets = [
      _DetailWidget(
        label: 'Nome',
        text: experiment.name,
      ),
      _DetailWidget(
        label: 'Descrizione',
        text: experiment.description,
      ),
      _DetailWidget(
        label: 'Creato il',
        text: dateFormat.format(experiment.createdAt),
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
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(experiment.name),
        actions: [
          IconButton(
            onPressed: () {
              context.go(
                '/experiments/details/$experimentId/edit',
                extra: experiment,
              );
            },
            icon: const Icon(Icons.edit),
          ),
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Center(
                      child: QrImageView(
                        data: buildUrl(experiment?.id ?? ''),
                        size: 250,
                      ),
                    ),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.qr_code),
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isDesktop = constraints.maxWidth > 600;

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                // Allinea all'inizio
                children: [
                  Expanded(
                    // Dai più spazio ai dettagli su desktop
                    flex: 2, // Ad esempio, 2/3 dello spazio
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: infoWidgets,
                    ),
                  ),
                  if (isDesktop) ...[
                    const SizedBox(width: 24), // Spaziatura
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(16),
                          child: QrImageView(
                            data: buildUrl(experiment!.shortCode),
                            version: QrVersions.auto,
                            size: constraints.maxWidth * 0.25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 600,
                child: ExperimentTrackList(
                  experimentCode: experiment!.shortCode,
                ),
              ),
            ],
          );
        },
      ),


    );
  }

  String buildUrl(String experimentId) {
    return 'https://aifit.com/v1/experiment/$experimentId';
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
