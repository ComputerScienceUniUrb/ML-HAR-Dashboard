import 'package:aifit_dashboard/core/data/firestore_references.dart';
import 'package:aifit_dashboard/core/ui/collapsibile_card.dart';
import 'package:aifit_dashboard/core/utils.dart';
import 'package:aifit_dashboard/features/experiments/application/experiments_notifier.dart';
import 'package:aifit_dashboard/features/experiments/models/experiment.dart';
import 'package:aifit_dashboard/features/sessions/application/players_notifier.dart';
import 'package:aifit_dashboard/features/sessions/application/session_repository.dart';
import 'package:aifit_dashboard/features/sessions/application/session_steps_notifier.dart';
import 'package:aifit_dashboard/features/sessions/models/player.dart';
import 'package:aifit_dashboard/features/sessions/models/session_step.dart';
import 'package:aifit_dashboard/features/sessions/ui/session_tracks_widget.dart';
import 'package:aifit_dashboard/features/tracks/application/tracks_notifier.dart';
import 'package:aifit_dashboard/features/tracks/models/activity_type.dart';
import 'package:aifit_dashboard/features/tracks/models/smartphone_position.dart';
import 'package:aifit_dashboard/features/tracks/ui/widgets/track_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aifit_dashboard/features/sessions/application/sessions_notifier.dart';
import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';
import 'package:collection/collection.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';

const _uuid = Uuid();

class SessionDetailsScreen extends ConsumerWidget {
  final String sessionId;

  const SessionDetailsScreen({
    super.key,
    required this.sessionId,
  });

  // Helper per ottenere il nome dell'esperimento associato
  String? _getAssociatedExperimentName(
      WidgetRef ref, String? experimentId, List<Experiment> experiments) {
    if (experimentId == null) return null;
    try {
      final experiment =
          experiments.firstWhere((exp) => exp.id == experimentId);
      return experiment.name;
    } catch (e) {
      // Esperimento non trovato (magari eliminato)
      return 'Esperimento Sconosciuto ($experimentId)';
    }
  }

  // Metodo per ottenere l'etichetta del pulsante di azione
  String _getActionButtonLabel(SessionStatus status) {
    switch (status) {
      case SessionStatus.opened:
        return 'Avvia Sessione';
      case SessionStatus.live:
        return 'Termina Sessione';
      case SessionStatus.closed:
        return 'Reset Sessione';
      case SessionStatus.draft:
        return 'Apri Sessione';
    }
  }

  // Metodo per ottenere l'icona del pulsante di azione
  IconData _getActionButtonIcon(SessionStatus status) {
    switch (status) {
      case SessionStatus.opened:
        return Icons.play_circle_fill_outlined;
      case SessionStatus.live:
        return Icons.stop_circle_outlined;
      case SessionStatus.closed:
        return Icons.refresh_outlined;
      case SessionStatus.draft:
      default: // Questo default è necessario se non tutti i casi dell'enum sono coperti esplicitamente
        return Icons.touch_app_outlined;
    }
  }

  // Metodo per ottenere l'icona dello stato della sessione
  IconData _getIconForSessionStatus(SessionStatus status) {
    switch (status) {
      case SessionStatus.opened:
        return Icons.hourglass_empty_outlined;
      case SessionStatus.live:
        return Icons.directions_run_outlined;
      case SessionStatus.closed:
        return Icons.check_circle_outline_outlined;
      case SessionStatus.draft:
        return Icons.build;
    }
  }

  // Metodo per mappare lo stato della sessione a un'azione di step
  SessionStepAction fromTheArrivalSessionStatus(SessionStatus status) {
    return switch (status) {
      SessionStatus.draft => SessionStepAction.reset,
      SessionStatus.opened => SessionStepAction.open,
      SessionStatus.live => SessionStepAction.start,
      SessionStatus.closed => SessionStepAction.close,
    };
  }

  _deleteSession(WidgetRef ref) async {
    final batch = FirebaseFirestore.instance.batch();

    final players = await ref.read(getPlayersProvider(sessionId).future);
    batch.delete(FirestoreReference.sessionDoc(sessionId));
    for (final p in players) {
      batch.delete(FirestoreReference.playerDoc(sessionId, p.id));
    }
    await batch.commit();
    if (ref.context.mounted) {
      ref.context.pop();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsyncValue = ref.watch(getSessionsByIdProvider(sessionId));
    final playersCount = ref.watch(getPlayersCountProvider(sessionId));
    final experimentsAsyncValue = ref.watch(listenExperimentsProvider);
    final List<Experiment> experiments = experimentsAsyncValue.value ?? [];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pannello di controllo'),
        actions: [
          ElevatedButton.icon(
            onPressed: () => _deleteSession(ref),
            label: const Text('Elimina sessione'),
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
          ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: () {
              context.go('/$sessionId/preview');
            },
            label: const Text('Preview'),
            icon: const Icon(
              Icons.preview,
            ),
          ),
        ],
      ),
      body: sessionAsyncValue.when(
        data: (session) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: 300,
                  child: Row(
                    children: [
                      if (session.status == SessionStatus.live &&
                          session.selectedExperimentId != null)
                        Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text('Esperimento selezionato'),
                                Consumer(builder: (context, ref, child) {
                                  final experimentState = ref.watch(
                                      getExperimentByIdProvider(
                                          session.selectedExperimentId!));

                                  return switch (experimentState) {
                                    AsyncLoading() => const Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    AsyncData(:final value) => value == null
                                        ? const SizedBox.shrink()
                                        : ExperimentInfo(
                                            name: value.name,
                                            duration: value.duration,
                                            description: value.description,
                                            activityType:
                                                value.activityTypeOverride,
                                            smartphonePosition: value
                                                .smartphonePositionOverride,
                                          ),
                                    _ => const SizedBox.shrink(),
                                  };
                                }),
                                ElevatedButton(
                                  onPressed: () async {
                                    final newRunningId =
                                        session.runningId == null
                                            ? _uuid.v4()
                                            : null;
                                    final batch =
                                        FirebaseFirestore.instance.batch();

                                    batch.update(
                                      FirestoreReference.sessionDoc(sessionId),
                                      {
                                        'runningId': newRunningId,
                                      },
                                    );
                                    await batch.commit();

                                    await ref
                                        .read(getSessionRepositoryProvider)
                                        .writeStep(
                                          session.id,
                                          SessionStep(
                                            id: _uuid.v4(),
                                            action: session.runningId == null
                                                ? SessionStepAction
                                                    .startExperiment
                                                : SessionStepAction
                                                    .stopExperiment,
                                            experimentId:
                                                session.selectedExperimentId,
                                            runningId: newRunningId,
                                            currentStatus: session.status,
                                            createdAt: DateTime.now(),
                                          ),
                                        );
                                  },
                                  child: Text(
                                    session.runningId == null
                                        ? 'Avvia experimento'
                                        : 'Interrompi esperimento',
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      Center(
                        child: Column(
                          children: [
                            Icon(
                              _getIconForSessionStatus(session.status),
                              size: 80,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            const SizedBox(height: 16),
                            Text(
                              session.name,
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 24),
                            // Spazio prima del pulsante
                            ElevatedButton.icon(
                              icon: Icon(_getActionButtonIcon(session.status)),
                              label:
                                  Text(_getActionButtonLabel(session.status)),
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 32, vertical: 16),
                                textStyle:
                                    Theme.of(context).textTheme.titleMedium,
                              ),
                              onPressed: () async {
                                final SessionStatus newStatus =
                                    switch (session.status) {
                                  SessionStatus.draft => SessionStatus.opened,
                                  SessionStatus.opened => SessionStatus.live,
                                  SessionStatus.live => SessionStatus.closed,
                                  SessionStatus.closed => SessionStatus.draft,
                                };

                                await FirestoreReference.sessionDoc(sessionId)
                                    .update({
                                  'status': newStatus.name,
                                  'runningId': null,
                                });

                                await ref
                                    .read(getSessionRepositoryProvider)
                                    .writeStep(
                                      session.id,
                                      SessionStep(
                                        id: _uuid.v4(),
                                        action: fromTheArrivalSessionStatus(
                                            newStatus),
                                        experimentId:
                                            session.selectedExperimentId,
                                        currentStatus: session.status,
                                        createdAt: DateTime.now(),
                                      ),
                                    );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                // Spazio dopo l'intestazione

                // --- Sezione Dettagli Chiave e QR Code ---
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12)),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Dettagli Chiave',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                              const Divider(height: 20, thickness: 1),
                              // Dettaglio: Stato
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.info_outline,
                                        size: 20, color: Colors.grey[700]),
                                    const SizedBox(width: 12),
                                    const Text('Stato:'),
                                    const Spacer(),
                                    Expanded(
                                      child: Text(
                                        session.status.name,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Dettaglio: Data Creazione
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.calendar_today_outlined,
                                        size: 20, color: Colors.grey[700]),
                                    const SizedBox(width: 12),
                                    const Text('Data Creazione:'),
                                    const Spacer(),
                                    Expanded(
                                      child: Text(
                                        '${session.createdAt.toLocal()}'
                                            .split(' ')[0],
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              // Dettaglio: Partecipanti iscritti (con pulsante)
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Row(
                                  children: [
                                    Icon(Icons.person_outline,
                                        size: 20, color: Colors.grey[700]),
                                    const SizedBox(width: 12),
                                    TextButton(
                                      onPressed: () {
                                        context
                                            .go('/sessions/$sessionId/players');
                                      },
                                      child:
                                          const Text('Partecipanti iscritti:'),
                                    ),
                                    const Spacer(),
                                    Expanded(
                                      child: Text(
                                        playersCount.toString(),
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.end,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16), // Spazio tra card e QR
                    QrImageView(
                      data: 'https://aifit.com/v1/session/$sessionId',
                      size:
                          200, // Dimensione regolata per un migliore bilanciamento
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                // Spazio dopo la sezione info/QR

                // --- Sezione Esperimenti Associati ---
                const Divider(height: 20, thickness: 1),
                SessionExperimentsHistoryWidget(
                  experiments: experiments,
                  session: session,
                ),
                SessionExperimentsWidget(
                  session: session,
                  experiments: experiments,
                  onWriteStep: (String experimentId) async {
                    await FirestoreReference.sessionDoc(sessionId).update({
                      'experiments': FieldValue.arrayRemove([experimentId]),
                      if (experimentId == session.selectedExperimentId)
                        'selectedExperimentId': null,
                    });

                    await ref.read(getSessionRepositoryProvider).writeStep(
                          sessionId,
                          SessionStep(
                            id: _uuid.v4(),
                            action: SessionStepAction.removeExperiment,
                            experimentId: experimentId,
                            currentStatus: session.status,
                            createdAt: DateTime.now(),
                          ),
                        );
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text('Associazione esperimento rimossa.')),
                    );
                  },
                ),
                const SizedBox(height: 24),
                SessionStepsWidget(
                  sessionId: session.id,
                ),
                const SizedBox(height: 24),

                CollapsibleCard(
                  header: Text(
                    'Tracce',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                  extraWidget: ElevatedButton(
                    onPressed: () async {
                      final batch = FirebaseFirestore.instance.batch();

                      final tracks = await ref
                          .read(getTracksBySessionIdProvider(sessionId).future);

                      for (final t in tracks) {
                        batch.delete(FirebaseFirestore.instance
                            .collection('tracks')
                            .doc(t.cloudId));
                      }
                      batch.commit();
                    },
                    child: const Text('Elimina tracce'),
                  ),
                  content: SizedBox(
                      height: 400,
                      child: SessionTracksWidget(sessionId: session.id)),
                ),
                const SizedBox(height: 24),
                // Spazio in fondo
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Errore nel caricamento dell\'anteprima: $error'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () =>
                    ref.invalidate(getSessionsByIdProvider(sessionId)),
                child: const Text('Riprova'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ExperimentHeader extends StatelessWidget {
  const ExperimentHeader({super.key});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontWeight: FontWeight.bold, fontSize: 16);
    return const Row(
      children: [
        SizedBox(width: 60),
        Expanded(flex: 1, child: Text('Nome', style: style)),
        SizedBox(width: 8),
        Expanded(flex: 1, child: Text('Attività', style: style)),
        SizedBox(width: 8),
        Expanded(child: Text('Durata (secondi)', style: style)),
        SizedBox(width: 8),
        Expanded(child: Text('Posizione dello smartphone', style: style)),
        SizedBox(
          width: 100,
        ),
      ],
    );
  }
}

class SessionStepsWidget extends ConsumerWidget {
  final String sessionId;

  const SessionStepsWidget({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getSessionStepsProvider(sessionId));

    final steps = state.valueOrNull ?? [];
    return CollapsibleCard(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      initialExpanded: false,
      header: Text(
        'Cronologia Azioni', // Titolo più descrittivo
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      extraWidget: ElevatedButton(
        onPressed: steps.isEmpty
            ? null
            : () async {
                final batch = FirebaseFirestore.instance.batch();
                for (final step in steps) {
                  batch.delete(FirestoreReference.stepDoc(sessionId, step.id));
                }
                await batch.commit();
              },
        child: const Text('Elimina Tutto'), // Testo più chiaro
      ),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (steps.isEmpty)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Nessuna azione registrata.'),
              ),
            ),
          for (final step in steps)
            ListTile(
              title: Text(step.action.translate),
              subtitle: Text(
                '${step.createdAt.toLocal().hour}:${step.createdAt.toLocal().minute.toString().padLeft(2, '0')} - ${step.currentStatus.name}',
              ),
              // Puoi aggiungere più dettagli qui se necessario
            )
        ],
      ),
    );
  }
}

class ExperimentInfo extends StatelessWidget {
  final String? name;
  final String? description;
  final ActivityType? activityType;
  final SmartphonePosition? smartphonePosition;
  final int? duration;

  const ExperimentInfo({
    required this.name,
    required this.duration,
    required this.description,
    required this.activityType,
    required this.smartphonePosition,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (name != null)
          TextInfo(
            text: 'Nome Experimento',
            value: name,
          ),
        if (description != null)
          TextInfo(
            text: 'Descrizione',
            value: description,
          ),
        TextInfo(
          text: 'Attività',
          value: activityType?.translate,
        ),
        TextInfo(
          text: 'Posizione smartphone',
          value: smartphonePosition?.translate,
        ),
        TextInfo(
          text: 'Durata del test',
          value: '${duration ?? '-'} secondi',
        ),
      ],
    );
  }
}

class TextInfo extends StatelessWidget {
  final String text;
  final String? value;

  const TextInfo({required this.text, required this.value, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.grey),
        ),
        Text(
          value ?? '-',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}

class SessionExperimentsHistoryWidget extends ConsumerWidget {
  final Session session;
  final List<Experiment> experiments;

  const SessionExperimentsHistoryWidget({
    required this.experiments,
    required this.session,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final headerStyle = Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        );
    final players = ref.watch(getPlayersProvider(session.id)).valueOrNull ?? [];
    final steps =
        ref.watch(getExperimentStepsProvider(session.id)).valueOrNull ?? [];

    return CollapsibleCard(
      elevation: 2,
      header: Text(
        'Cronologia Esperimenti',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                  'ID esecuzione',
                  style: headerStyle,
                )),
                const SizedBox(width: 24),
                Expanded(
                    child: Text(
                  'Avvio alle',
                  style: headerStyle,
                )),
                const SizedBox(width: 24),
                Expanded(
                    child: Text(
                  'Nome',
                  style: headerStyle,
                )),
                const SizedBox(width: 24),
                Expanded(
                  child: Tooltip(
                    message:
                        'Il numero di utenti che hanno caricato la propria traccia per questo esperimento',
                    child: Text(
                      'Tracce completate',
                      style: headerStyle,
                    ),
                  ),
                ),
              ],
            ),
            for (final step in steps) ...[
              ExperimentHistoryWidget(
                step: step,
                experiment: experiments
                    .firstWhereOrNull((ex) => ex.id == step.experimentId),
                players: players,
              ),
              const Divider(),
            ]
          ],
        ),
      ),
    );
  }
}

class ExperimentHistoryWidget extends StatelessWidget {
  final SessionStep step;
  final Experiment? experiment;
  final List<Player> players;

  const ExperimentHistoryWidget({
    super.key,
    required this.step,
    required this.experiment,
    required this.players,
  });

  @override
  Widget build(BuildContext context) {
    final ex = experiment;
    if (ex == null) return const SizedBox.shrink();

    final count = players
        .where((player) => player.experimentLogs.any((log) =>
            log.experimentId == ex.id && log.runningId == step.runningId))
        .length;

    return Row(
      children: [
        Expanded(child: Text(step.runningId ?? 'Error')),
        const SizedBox(width: 24),
        Expanded(child: Text(genericDateFormatter.format(step.createdAt))),
        const SizedBox(width: 24),
        Expanded(child: Text(ex.name)),
        const SizedBox(width: 24),
        Expanded(child: Text('$count/${players.length}')),
      ],
    );
  }
}

class SessionExperimentsWidget extends ConsumerWidget {
  final Session session;
  final List<Experiment> experiments;
  final Function(String) onWriteStep;

  const SessionExperimentsWidget({
    required this.experiments,
    required this.session,
    required this.onWriteStep,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CollapsibleCard(
      elevation: 2,
      header: Text(
        'Esperimenti Associati',
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
            ),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 16),
            // Spazio dopo il titolo
            if (session.experiments.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Nessun esperimento associato.'),
                ),
              ),
            const ExperimentHeader(),
            for (final exId in session.experiments)
              Builder(builder: (context) {
                final experiment =
                    experiments.firstWhereOrNull((exp) => exp.id == exId);
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 60,
                        child: Checkbox(
                          value: session.selectedExperimentId == exId,
                          onChanged: session.runningId == null
                              ? (value) {
                                  if (value ?? false) {
                                    FirestoreReference.sessionDoc(session.id)
                                        .update({
                                      'selectedExperimentId': exId,
                                    });
                                  }
                                }
                              : null,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          experiment?.name ?? 'Esperimento Sconosciuto',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          experiment?.activityTypeOverride?.translate ?? '-',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${experiment?.duration ?? ''}',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          experiments
                                  .firstWhereOrNull((exp) => exp.id == exId)
                                  ?.smartphonePositionOverride
                                  ?.translate ??
                              '-',
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: session.status != SessionStatus.opened
                              ? null
                              : () async {
                                  onWriteStep(exId);
                                },
                          child: const Text('Rimuovi'),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            const SizedBox(height: 16),
            Center(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.add_circle_outline),
                label: const Text('Associa Esperimento'),
                onPressed: () {
                  _showExperimentSelectionDialog(
                    context,
                    ref,
                    session,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Metodo per mostrare il dialogo di selezione esperimento
  void _showExperimentSelectionDialog(
      BuildContext context, WidgetRef ref, Session currentSession) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Seleziona Esperimento'),
          content: Consumer(builder: (context, ref, child) {
            // Leggi la lista degli esperimenti disponibili
            final experimentsAsyncValue = ref.watch(listenExperimentsProvider);
            return SizedBox(
              width: double.maxFinite, // Permette al dialogo di espandersi
              child: experimentsAsyncValue.when(
                data: (experiments) {
                  if (experiments.isEmpty) {
                    return const Center(
                        child: Text('Nessun esperimento disponibile.'));
                  }
                  return ListView.builder(
                    shrinkWrap: true, // Importante in un dialogo
                    itemCount: experiments.length,
                    itemBuilder: (context, index) {
                      final experiment = experiments[index];
                      return ListTile(
                        title: Text(experiment.name),
                        onTap: () async {
                          if (currentSession.experiments
                              .contains(experiment.id)) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Esperimento già associato.')),
                            );
                            Navigator.of(dialogContext).pop();
                            return;
                          }

                          await FirestoreReference.sessionDoc(currentSession.id)
                              .update({
                            'experiments':
                                FieldValue.arrayUnion([experiment.id]),
                            if (currentSession.experiments.isEmpty)
                              'selectedExperimentId': experiment.id,
                          });
                          await ref
                              .read(getSessionRepositoryProvider)
                              .writeStep(
                                session.id,
                                SessionStep(
                                  id: _uuid.v4(),
                                  action: SessionStepAction.addExperiment,
                                  experimentId: experiment.id,
                                  currentStatus: currentSession.status,
                                  createdAt: DateTime.now(),
                                ),
                              );
                          Navigator.of(dialogContext).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                                content: Text(
                                    'Esperimento "${experiment.name}" associato.')),
                          );
                        },
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Center(
                  child: Text('Errore nel caricamento esperimenti: $error'),
                ),
              ),
            );
          }),
          actions: <Widget>[
            TextButton(
              child: const Text('Annulla'),
              onPressed: () {
                Navigator.of(dialogContext).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
