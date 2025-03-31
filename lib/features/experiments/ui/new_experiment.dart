import 'package:aifit_dashboard/core/dialog_utils.dart';
import 'package:aifit_dashboard/core/ui/my_text_field.dart';
import 'package:aifit_dashboard/features/experiments/application/experiments_notifier.dart';
import 'package:aifit_dashboard/features/experiments/models/experiment.dart';
import 'package:aifit_dashboard/features/tracks/models/activity_type.dart';
import 'package:aifit_dashboard/features/tracks/models/smartphone_position.dart';
import 'package:animated_custom_dropdown/custom_dropdown.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

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
        useTextEditingController(text: experiment?.shortCode);
    final enabled = useState(experiment?.enabled ?? false);
    final activityTypeOverride =
        useState<ActivityType?>(experiment?.activityTypeOverride);
    final smartphonePositionOverride =
        useState<SmartphonePosition?>(experiment?.smartphonePositionOverride);
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
                    SmartDialog.showLoading();
                    try {
                      isLoading.value = true;
                      final data = Experiment(
                        id: experiment?.id ?? const Uuid().v4(),
                        name: nameController.text.trim(),
                        shortCode: shortCodeController.text.trim(),
                        enabled: enabled.value,
                        createdAt: experiment?.createdAt ?? DateTime.now(),
                        activityTypeOverride: activityTypeOverride.value,
                        smartphonePositionOverride:
                            smartphonePositionOverride.value,
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
                  },
            child: const Text('Salva'),
          ),
        ],
      ),
      body: ListView(
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
                    if (activityTypeOverride.value == ActivityType.onBicycle ||
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
    );
  }
}
