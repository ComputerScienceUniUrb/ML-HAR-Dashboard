import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Assicurati che il percorso al tuo modello Session e all'enum SessionStatus sia corretto
import 'package:aifit_dashboard/features/sessions/models/session.dart';
import 'package:uuid/uuid.dart';

// Assumiamo che tu abbia un notifier per gestire le sessioni, ad esempio:
// import 'package:aifit_dashboard/features/sessions/application/sessions_notifier.dart';

class CreateSessionForm extends ConsumerStatefulWidget {
  final void Function(Session newSession)?
      onSessionCreated; // Callback opzionale

  const CreateSessionForm({super.key, this.onSessionCreated});

  @override
  ConsumerState<CreateSessionForm> createState() => _CreateSessionFormState();
}

class _CreateSessionFormState extends ConsumerState<CreateSessionForm> {
  final _formKey = GlobalKey<FormState>();
  String _sessionName = '';
  SessionStatus _selectedStatus = SessionStatus.draft; // Valore predefinito

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Qui dovresti chiamare il metodo del tuo notifier per creare la sessione.
      // Ad esempio, se hai un SessionsNotifier con un metodo addSession:
      // final sessionsNotifier = ref.read(sessionsNotifierProvider.notifier);
      // await sessionsNotifier.addSession(name: _sessionName, activityType: _selectedStatus);

      // Per questo esempio, creo un oggetto Session e lo passo al callback
      // (se fornito) e/o stampo i dati.
      // L'ID e createdAt verrebbero gestiti dal backend o dal notifier.

      final userId = FirebaseAuth.instance.currentUser?.uid;

      if (userId == null) {
        // Mostra un messaggio di successo (opzionale)
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Utente non autenticato.')));

        return;
      }

      final newSession = Session(
        userId: userId,
        id: const Uuid().v4(),
        name: _sessionName,
        status: _selectedStatus,
        createdAt: DateTime.now(),
      );

      print('Nuova Sessione da creare:');
      print('Nome: ${newSession.name}');
      print('Tipo Attività: ${newSession.status}');
      print('ID (temp): ${newSession.id}');
      print('Creata il (temp): ${newSession.createdAt}');

      widget.onSessionCreated?.call(newSession);

      // Se il form è in un dialogo, potresti volerlo chiudere:
      // if (Navigator.canPop(context)) {
      //   Navigator.pop(context);
      // }

      // Mostra un messaggio di successo (opzionale)
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
            content: Text(
                'Sessione "${newSession.name}" pronta per essere creata.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min, // Per usarlo in un dialogo
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nome Sessione',
              hintText: 'Es. Allenamento Mattutino',
              border: OutlineInputBorder(),
            ),
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'Inserisci un nome per la sessione.';
              }
              return null;
            },
            onSaved: (value) {
              _sessionName = value!.trim();
            },
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<SessionStatus>(
            decoration: const InputDecoration(
              labelText: 'Stato Iniziale Sessione',
              border: OutlineInputBorder(),
            ),
            value: _selectedStatus,
            items: SessionStatus.values.map((SessionStatus status) {
              return DropdownMenuItem<SessionStatus>(
                value: status,
                child: Text(status.name), // Mostra il nome dell'enum
              );
            }).toList(),
            onChanged: (SessionStatus? newValue) {
              if (newValue != null) {
                setState(() {
                  _selectedStatus = newValue;
                });
              }
            },
            onSaved: (SessionStatus? newValue) {
              _selectedStatus = newValue ?? SessionStatus.opened;
            },
          ),
          const SizedBox(height: 24),
          Center(
            child: ElevatedButton.icon(
              icon: const Icon(Icons.add_circle_outline),
              label: const Text('Crea Sessione'),
              onPressed: _submitForm,
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                textStyle: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
