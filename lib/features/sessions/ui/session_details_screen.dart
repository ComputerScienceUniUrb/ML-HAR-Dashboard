import 'package:aifit_dashboard/features/experiments/application/experiments_notifier.dart';
import 'package:aifit_dashboard/features/experiments/models/experiment.dart';
import 'package:aifit_dashboard/features/sessions/application/players_notifier.dart';
import 'package:aifit_dashboard/features/sessions/application/session_steps_notifier.dart';
import 'package:aifit_dashboard/features/sessions/models/session_step.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Assicurati che il percorso al tuo provider e al modello Session sia corretto
import 'package:aifit_dashboard/features/sessions/application/sessions_notifier.dart';
import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:go_router/go_router.dart'; // Assumi che Session sia definito qui
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Assicurati che il percorso al tuo provider e al modello Session sia corretto
import 'package:aifit_dashboard/features/sessions/application/sessions_notifier.dart';
import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart'; // Assumi che Session sia definito qui

const _uuid = Uuid();

class SessionDetailsScreen extends ConsumerWidget {
  final String sessionId;

  const SessionDetailsScreen({
    super.key,
    required this.sessionId,
  });

  // Nuovo metodo per mostrare il dialogo di selezione esperimento
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
                          await FirebaseFirestore.instance
                              .collection('sessions')
                              .doc(sessionId)
                              .update({
                            'experiments':
                                FieldValue.arrayUnion([experiment.id]),
                            if (currentSession.experiments.isEmpty)
                              'selectedExperimentId': experiment.id,
                          });
                          await writeStep(
                            SessionStep(
                              id: const Uuid().v4(),
                              action: SessionStepAction.addExperiment,
                              experimentId: experiment.id,
                              currentStatus: currentSession.status,
                              createdAt: DateTime.now(),
                            ),
                          );
                          Navigator.of(dialogContext)
                              .pop(); // Chiudi il dialogo
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

  Future writeStep(SessionStep step) async {
    await FirebaseFirestore.instance
        .collection('sessions')
        .doc(sessionId)
        .collection('steps')
        .doc(step.id)
        .set(step.toJson());
  }

  // Helper per ottenere il nome dell'esperimento associato
  // Questo richiede di leggere anche il provider degli esperimenti
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

  // NUOVO METODO per ottenere l'etichetta del pulsante
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

  // NUOVO METODO per ottenere l'icona del pulsante (opzionale, ma coerente)
  IconData _getActionButtonIcon(SessionStatus status) {
    switch (status) {
      case SessionStatus.opened:
        return Icons.play_circle_fill_outlined;
      case SessionStatus.live:
        return Icons.stop_circle_outlined;
      case SessionStatus.closed:
        return Icons.refresh_outlined;
      case SessionStatus.draft:
      default:
        return Icons.touch_app_outlined; // Icona di fallback
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsyncValue = ref.watch(getSessionsByIdProvider(sessionId));
    final playersCount =
        ref.watch(getPlayersCountProvider(sessionId));

    final experimentsAsyncValue = ref.watch(listenExperimentsProvider);
    final List<Experiment> experiments = experimentsAsyncValue.value ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pannello di controllo'),
        actions: [
          IconButton(
            onPressed: () {
              context.go('/session/$sessionId/preview');
            },
            icon: const Icon(Icons.preview),
            tooltip: 'Vai alla preview',
          )
        ],
      ),
      body: sessionAsyncValue.when(
        data: (session) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: [
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
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      icon: Icon(_getActionButtonIcon(session.status)),
                      label: Text(_getActionButtonLabel(session.status)),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 16),
                        textStyle: Theme.of(context).textTheme.titleMedium,
                        // backgroundColor: Theme.of(context).colorScheme.primary,
                        // foregroundColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                      onPressed: () async {
                        final SessionStatus newStatus =
                            switch (session.status) {
                          SessionStatus.draft => SessionStatus.opened,
                          SessionStatus.opened => SessionStatus.live,
                          SessionStatus.live => SessionStatus.closed,
                          SessionStatus.closed => SessionStatus.draft,
                        };

                        await FirebaseFirestore.instance
                            .collection('sessions')
                            .doc(sessionId)
                            .update({
                          'status': newStatus.name,
                        });

                        await writeStep(
                          SessionStep(
                            id: const Uuid().v4(),
                            action: fromTheArrivalSessionStatus(newStatus),
                            experimentId: session.selectedExperimentId,
                            currentStatus: session.status,
                            createdAt: DateTime.now(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SizedBox(
                  height: 250,
                  child: Row(
                    children: [
                      Expanded(
                        child: _buildInfoCard(
                          context,
                          title: 'Dettagli Chiave',
                          children: [
                            _buildDetailRow(
                              icon: Icons.info_outline,
                              label: 'Stato',
                              value: session
                                  .status.name, // o una formattazione migliore
                            ),
                            _buildDetailRow(
                              icon: Icons.calendar_today_outlined,
                              label: 'Data Creazione',
                              value: '${session.createdAt.toLocal()}'
                                  .split(' ')[0], // Solo data
                            ),
                            _buildDetailRow(
                              icon: Icons.person_outline,
                              label: 'Partecipanti iscritti',
                              value: playersCount.toString(),
                              onTap: (){
                                context.go('/session/$sessionId/players');
                              }
                            ),
                          ],
                        ),
                      ),
                      QrImageView(
                        data: 'https://aifit.com/v1/session/$sessionId',
                        size: 250,
                      ),
                    ],
                  ),
                ),
                const Divider(height: 20, thickness: 1),
                Card(
                  child: Column(
                    children: [
                      // Mostra l'esperimento associato o il pulsante

                      const Text(
                        'Esperimenti',
                      ),
                      for (final exId in session.experiments)
                        Builder(builder: (context) {
                          final experiment = experiments
                              .firstWhereOrNull((exp) => exp.id == exId);
                          if (experiment == null) {
                            return const SizedBox.shrink();
                          }
                          final associatedExperimentName = experiment.name;
                          final isSelected =
                              session.selectedExperimentId == exId;
                          return Container(
                            // color: isSelected ? Colors.green : null,
                            child: Row(
                              children: [
                                Checkbox(
                                    value: isSelected,
                                    onChanged: isSelected
                                        ? null
                                        : (value) {
                                            if (value ?? false) {
                                              FirebaseFirestore.instance
                                                  .collection('sessions')
                                                  .doc(sessionId)
                                                  .update({
                                                'selectedExperimentId': exId,
                                              });
                                            }
                                          }),
                                Text(
                                  associatedExperimentName,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  experiment.activityTypeOverride?.translate ??
                                      '-',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  experiment.smartphonePositionOverride
                                          ?.translate ??
                                      '-',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w500),
                                ),
                                Spacer(),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Center(
                                    child: ElevatedButton.icon(
                                      icon: const Icon(
                                          Icons.remove_circle_outline,
                                          color: Colors.redAccent),
                                      label: const Text('Rimuovi Esperimento',
                                          style: TextStyle(
                                              color: Colors.redAccent)),
                                      onPressed: session.status !=
                                              SessionStatus.opened
                                          ? null
                                          : () async {
                                              await FirebaseFirestore.instance
                                                  .collection('sessions')
                                                  .doc(sessionId)
                                                  .update({
                                                'experiments':
                                                    FieldValue.arrayRemove(
                                                        [exId]),
                                                if (exId ==
                                                    session
                                                        .selectedExperimentId)
                                                  'selectedExperimentId': null,
                                              });

                                              await writeStep(
                                                SessionStep(
                                                  id: const Uuid().v4(),
                                                  action: SessionStepAction
                                                      .removeExperiment,
                                                  experimentId: exId,
                                                  currentStatus: session.status,
                                                  createdAt: DateTime.now(),
                                                ),
                                              );
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                const SnackBar(
                                                    content: Text(
                                                        'Associazione esperimento rimossa.')),
                                              );
                                            },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                      // Pulsante per selezionare l'esperimento
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Center(
                          // Centra il pulsante
                          child: OutlinedButton.icon(
                            // Usiamo OutlinedButton
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
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SessionStepsWidget(
                  sessionId: session.id,
                ),
                const SizedBox(height: 24),
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

  Widget _buildInfoCard(BuildContext context,
      {required String title, required List<Widget> children}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
            ),
            const Divider(height: 20, thickness: 1),
            ...children,
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    Function()? onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 12),
          TextButton(
            onPressed: onTap,
            child: Text('$label:'),
          ),
          const Spacer(),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  IconData _getIconForSessionStatus(SessionStatus status) {
    switch (status) {
      case SessionStatus.opened:
        return Icons.hourglass_empty_outlined;
      case SessionStatus.live:
        return Icons
            .directions_run_outlined; // o un'icona più generica per "attiva"
      // case SessionStatus.paused:
      //   return Icons.pause_circle_outline_outlined;
      case SessionStatus.closed:
        return Icons.check_circle_outline_outlined;
      case SessionStatus.draft:
        return Icons.build;
    }
  }

  SessionStepAction fromTheArrivalSessionStatus(SessionStatus status) {
    return switch (status) {
      SessionStatus.draft => SessionStepAction.reset,
      SessionStatus.opened => SessionStepAction.open,
      SessionStatus.live => SessionStepAction.start,
      SessionStatus.closed => SessionStepAction.close,
    };
  }
}

class SessionStepsWidget extends ConsumerWidget {
  final String sessionId;

  const SessionStepsWidget({super.key, required this.sessionId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getSessionStepsProvider(sessionId));

    final steps = state.valueOrNull ?? [];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Text('History'),
                Spacer(),
                ElevatedButton(
                  onPressed: steps.isEmpty
                      ? null
                      : () async {
                          final batch = FirebaseFirestore.instance.batch();
                          for (final step in steps) {
                            batch.delete(FirebaseFirestore.instance
                                .collection('sessions')
                                .doc(sessionId)
                                .collection('steps')
                                .doc(step.id));
                          }
                          await batch.commit();
                        },
                  child: Text('Clear'),
                )
              ],
            ),
            for (final step in steps)
              ListTile(
                title: Text(step.action.name),
              )
          ],
        ),
      ),
    );
  }
}
