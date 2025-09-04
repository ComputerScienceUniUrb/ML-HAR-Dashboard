import 'package:aifit_dashboard/core/dialog_utils.dart';
import 'package:aifit_dashboard/core/ui/my_text_field.dart';
import 'package:aifit_dashboard/features/experiments/application/experiments_notifier.dart';
import 'package:aifit_dashboard/features/experiments/models/experiment.dart';
import 'package:aifit_dashboard/features/tracks/models/activity_type.dart';
import 'package:aifit_dashboard/features/tracks/models/smartphone_position.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../../../core/constants.dart';

class NewExperimentScreen extends HookConsumerWidget {
  final Experiment? initialExperiment;
  final String? initialExperimentId;

  const NewExperimentScreen({
    this.initialExperiment,
    this.initialExperimentId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(() => GlobalKey<FormState>(), []);
    var experiment = initialExperiment;
    final exId = initialExperimentId;
    if (exId != null) {
      final experimentState = ref.watch(getExperimentByIdProvider(exId));

      if (experimentState.isLoading) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Caricamento esperimento'),
          ),
          body: const Center(
            child: CircularProgressIndicator(),
          ),
        );
      } else if (experimentState.valueOrNull == null) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Esperimento inesistente'),
          ),
          body: Center(
            child: Text('L\'esperimento con id $exId non esiste'),
          ),
        );
      }

      experiment = experimentState.valueOrNull;
    }

    final nameController = useTextEditingController(text: experiment?.name);
    final descController =
        useTextEditingController(text: experiment?.description);
    final shortCodeController =
        useTextEditingController(text: experiment?.shortCode.toUpperCase());
    final enabled = useState(experiment?.enabled ?? false);
    final activityTypeOverride =
        useState<ActivityType?>(experiment?.activityTypeOverride);
    final smartphonePositionOverride =
        useState<SmartphonePosition?>(experiment?.smartphonePositionOverride);
    final durationController =
        useTextEditingController(text: experiment?.duration?.toString());
    final isLoading = useState(false);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            experiment != null ? 'Modifica esperimento' : 'Crea esperimento'),
        actions: [
          ElevatedButton(
            onPressed: isLoading.value
                ? null
                : () async {
                    final userId = FirebaseAuth.instance.currentUser?.uid;
                    if (userId == null) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Utente non autenticato.')));
                      return;
                    }

                    if (formKey.currentState?.validate() ?? false) {
                      SmartDialog.showLoading();
                      try {
                        final duration = int.tryParse(durationController.text);

                        if (duration == null || duration > maxTestDuration) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text(
                                  'La durata non può superare i 30 secondi.'),
                            ),
                          );
                          return;
                        }

                        isLoading.value = true;
                        final data = Experiment(
                          userId: userId,
                          id: experiment?.id ?? const Uuid().v4(),
                          name: nameController.text.trim(),
                          shortCode:
                              shortCodeController.text.trim().toLowerCase(),
                          enabled: enabled.value,
                          createdAt: experiment?.createdAt ?? DateTime.now(),
                          activityTypeOverride: activityTypeOverride.value,
                          smartphonePositionOverride:
                              smartphonePositionOverride.value,
                          duration: duration,
                        );
                        await FirebaseFirestore.instance
                            .collection('experiments')
                            .doc(data.id)
                            .set(
                              data.toJson(),
                              SetOptions(merge: true),
                            );
                        isLoading.value = false;
                        SmartDialog.dismiss();
                        showMessage(
                          experiment != null
                              ? 'Esperimento aggiornato!'
                              : 'Esperimento creato!',
                        );
                      } catch (ex, st) {
                        SmartDialog.dismiss();
                        isLoading.value = false;
                        print(ex);
                        print(st);

                        showError(ex.toString());
                      }
                    }
                  },
            child: const Text('Salva'),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            MyTextField(
              controller: nameController,
              hint: 'Nome esperimento',
            ),
            const SizedBox(height: 8),
            MyTextField(
              controller: descController,
              maxLines: 3,
              hint: 'Descrizione esperimento',
            ),
            const SizedBox(height: 8),
            MyTextField(
              controller: shortCodeController,
              hint: 'Codice esperimento',
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    hintText: 'Tipo di attività',
                    enabled: !isLoading.value,
                    initialItem: activityTypeOverride.value,
                    headerBuilder: (context, item, enabled) {
                      return Text(
                        item.translate,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                    listItemBuilder: (context, item, isSelected, onSelect) {
                      return Text(item.translate);
                    },
                    items: ActivityType.values,
                    onChanged: (v) {
                      if (v == activityTypeOverride.value) return;
                      if (activityTypeOverride.value ==
                              ActivityType.onBicycle ||
                          v == ActivityType.onBicycle) {
                        activityTypeOverride.value = null;
                      }
                      activityTypeOverride.value = v;
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.red,
                  onPressed: !isLoading.value
                      ? () {
                          activityTypeOverride.value = null;
                        }
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: CustomDropdown(
                    hintText: 'Posizione smartphone',
                    enabled: !isLoading.value,
                    initialItem: smartphonePositionOverride.value,
                    headerBuilder: (context, item, enabled) {
                      return Text(
                        item.translate,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                    listItemBuilder: (context, item, isSelected, onSelect) {
                      return Text(item.translate);
                    },
                    items: activityTypeOverride.value != ActivityType.onBicycle
                        ? SmartphonePosition.values
                            .take(SmartphonePosition.values.length - 1)
                            .toList()
                        : SmartphonePosition.values,
                    onChanged: (v) {
                      smartphonePositionOverride.value = v;
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: Colors.red,
                  onPressed: !isLoading.value
                      ? () {
                          smartphonePositionOverride.value = null;
                        }
                      : null,
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                for (final d in selectableDurations)
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: FilterChip(
                      selected: int.tryParse(durationController.text) == d,
                      label: Text('$d sec'),
                      onSelected: (bool value) {
                        durationController.text = d.toString();
                      },
                    ),
                  ),
                Expanded(
                  child: MyTextField(
                    controller: durationController,
                    maxLines: 1,
                    suffix: 'secondi',
                    hint: 'Durata in secondi',
                    validator: (value) {
                      const error =
                          'La durata inserita non è valida, inserire un valore da 5 a 30';
                      if (value == null) return error;
                      final duration = int.tryParse(value);
                      if (duration == null ||
                          duration > maxTestDuration ||
                          duration < 5) {
                        return error;
                      }
                      return null;
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Abilitato?'),
                Switch(
                    value: enabled.value,
                    onChanged: (v) {
                      enabled.value = v;
                    })
              ],
            ),
          ],
        ),
      ),
    );
  }
}
