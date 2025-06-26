import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aifit_dashboard/features/sessions/application/sessions_notifier.dart';
import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart'; // Assumi che Session sia definito qui

class SessionPreviewScreen extends ConsumerWidget {
  final String sessionId;

  const SessionPreviewScreen({
    super.key,
    required this.sessionId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionAsyncValue = ref.watch(getSessionsByIdProvider(sessionId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Anteprima Sessione'),
      ),
      body: sessionAsyncValue.when(
        data: (session) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
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
                const SizedBox(height: 24),
                _buildInfoCard(
                  context,
                  title: 'Dettagli Chiave',
                  children: [
                    _buildDetailRow(
                      icon: Icons.info_outline,
                      label: 'Stato',
                      value: session.status.name,
                    ),
                    _buildDetailRow(
                      icon: Icons.person_outline,
                      label: 'Partecipanti',
                      value: 123.toString(),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                switch (session.status) {
                  SessionStatus.draft => Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Sessione in costruzione',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),

                    ],
                  ),
                  SessionStatus.opened => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Invita Partecipanti',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        QrImageView(
                          data: "session_id:${session.id}",
                          version: QrVersions.auto,
                          size: 200.0,
                          gapless: false,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Mostra questo QR code per permettere ai partecipanti di unirsi alla sessione.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  SessionStatus.live => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sessione in Corso',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        const Icon(Icons.timer_outlined,
                            size: 60, color: Colors.green),
                        const SizedBox(height: 16),
                        Text(
                          'La sessione "${session.name}" è attualmente attiva.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                  SessionStatus.closed => Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Sessione Terminata',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 16),
                        const Icon(Icons.check_circle_outline,
                            size: 60, color: Colors.grey),
                        const SizedBox(height: 16),
                        Text(
                          'La sessione "${session.name}" è stata completata.',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                        const SizedBox(height: 24),
                      ],
                    ),
                }
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

  Widget _buildDetailRow(
      {required IconData icon, required String label, required String value}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.grey[700]),
          const SizedBox(width: 12),
          Text('$label:'),
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
      default:
        return Icons.help_outline;
    }
  }
}
