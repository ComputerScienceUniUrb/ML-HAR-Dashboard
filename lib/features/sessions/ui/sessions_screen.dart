import 'package:aifit_dashboard/features/sessions/ui/create_session_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:aifit_dashboard/features/sessions/application/sessions_notifier.dart';
import 'package:go_router/go_router.dart';

class SessionsScreen extends ConsumerWidget {
  const SessionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sessionsAsyncValue = ref.watch(getSessionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sessioni'),
      ),
      body: sessionsAsyncValue.when(
        data: (sessions) {
          if (sessions.isEmpty) {
            return const Center(
              child: Text('Nessuna sessione trovata.'),
            );
          }
          // Visualizza la lista di sessioni
          return ListView.builder(
            itemCount: sessions.length,
            itemBuilder: (context, index) {
              final session = sessions[index];
              // Assumiamo che Session abbia una proprietà 'name' o simile
              // e un 'id' per la chiave
              return ListTile(
                key: ValueKey(session.id), // Assumi che Session abbia un 'id'
                title: Text(session.name), // Assumi che Session abbia un 'name'
                // Puoi aggiungere altri dettagli qui, es. subtitle, trailing
                // subtitle: Text('Dettagli sessione...'),
                onTap: () {

                  context.go('/sessions/${session.id}');
                },
              );
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Errore nel caricamento delle sessioni: $error'),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () => ref.invalidate(getSessionsProvider),
                child: const Text('Riprova'),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showCreateSessionDialog(context);
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showCreateSessionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Crea Nuova Sessione'),
          content: CreateSessionForm(
            onSessionCreated: (newSession) {
              try{
                FirebaseFirestore.instance
                    .collection('sessions')
                    .doc(newSession.id)
                    .set(newSession.toJson());
              }catch(ex){
                print(ex);
              }
              if (Navigator.canPop(dialogContext)) {
                Navigator.pop(dialogContext);
              }
            },
          ),
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
