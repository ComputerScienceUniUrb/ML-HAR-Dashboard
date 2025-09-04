import 'dart:math';
import 'dart:typed_data';

import 'package:aifit_dashboard/core/data/firestore_references.dart';
import 'package:aifit_dashboard/features/tensor_flow/application/tensor_flow_notifier.dart';
import 'package:aifit_dashboard/features/tensor_flow/tensor_flow_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dropzone/flutter_dropzone.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:super_drag_and_drop/super_drag_and_drop.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

class TensorFlowScreen extends ConsumerWidget {
  const TensorFlowScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final list = ref.watch(getTensorFlowModelProvider).valueOrNull ?? [];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Modelli TensorFlow in Cloud'),
        actions: [
          IconButton(
            tooltip: 'Carica nuovo modello',
            onPressed: () {
              showDialog(
                context: context,
                builder: (_) =>
                    Dialog(child: UploadModelDialog(list.firstOrNull)),
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: list.isEmpty
          ? const Center(
              child: Text('Nessun modello trovato o caricamento in corso...'))
          : ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index) {
                final item = list[index];
                return ListTile(
                  leading: const Icon(Icons.model_training_outlined),
                  title: Text('Versione ${item.version}'),
                  subtitle: Text('Caricata il ${item.addedOn}'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        tooltip: 'Copia URL',
                        icon: const Icon(Icons.copy),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: item.url));
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Link copiato negli appunti!'),
                            ),
                          );
                        },
                      ),
                      IconButton(
                        tooltip: 'Download',
                        icon: const Icon(Icons.download),
                        onPressed: () async {
                          final uri = Uri.parse(item.url);
                          if (await canLaunchUrl(uri)) {
                            launchUrl(uri);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}

/// Dialog per il caricamento di un nuovo modello.
class UploadModelDialog extends ConsumerStatefulWidget {
  final TensorFlowModel? currentModel;

  const UploadModelDialog(this.currentModel, {super.key});

  @override
  ConsumerState<UploadModelDialog> createState() => _UploadModelDialogState();
}

class _UploadModelDialogState extends ConsumerState<UploadModelDialog> {
  final _noteController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  Uint8List? model;
  String? fileName;
  bool isUploading = false;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final newVersion = (widget.currentModel?.version ?? 0) + 1;
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Carica Nuovo Modello: Versione $newVersion',
              style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _noteController,
              maxLines: 2,
              decoration: const InputDecoration(hintText: 'Aggiungi una nota'),
              // decoration: Outline(),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 150,
              child: isUploading
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Stack(
                      children: [
                        DropZoneView(
                          onDataLoaded: (data, fileName) {
                            setState(() {
                              model = data;
                              this.fileName = fileName;
                            });
                          },
                        ),
                      ],
                    ),
            ),
            if (fileName != null) Text(fileName ?? ''),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: model != null && fileName != null && !isUploading
                  ? () async {
                      try {
                        final name = fileName;

                        if (name == null) return;
                        setState(() {
                          isUploading = true;
                        });
                        final uploadTask = await FirebaseStorage.instance
                            .ref('tf_models/$fileName')
                            .putData(model!);

                        final downloadUrl =
                            await uploadTask.ref.getDownloadURL();

                        final m = TensorFlowModel(
                          id: const Uuid().v4(),
                          url: downloadUrl,
                          enabled: true,
                          version: newVersion,
                          notes: _noteController.text.trim(),
                          addedOn: DateTime.now(),
                          fileName: name,
                        );

                        await FirestoreReference.tensorFlowModelDoc(m.id)
                            .set(m.toJson());
                        if (context.mounted) {
                          context.pop();
                        }
                      } catch (ex, st) {
                        print(ex);
                        print(st);
                        setState(() {
                          isUploading = false;
                        });
                      }
                    }
                  : null,
              child: const Text('Carica modello'),
            )
          ],
        ),
      ),
    );
  }
}

class DropZoneView extends StatefulWidget {
  final Function(Uint8List, String) onDataLoaded;

  const DropZoneView({
    super.key,
    required this.onDataLoaded,
  });

  @override
  State<DropZoneView> createState() => _DropZoneViewState();
}

class _DropZoneViewState extends State<DropZoneView> {
  late DropzoneViewController controller1;
  late DropzoneViewController controller2;
  String message1 = 'Drop something here';
  String message2 = 'Drop something here';
  bool highlighted1 = false;

  bool dropping = false;

  Uint8List? data;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(
          color: highlighted1
              ? Colors.blue
              : data != null
                  ? Colors.green
                  : Colors.grey[100],
          child: Center(
            child: Text(
              highlighted1
                  ? 'Rilascia'
                  : data != null
                      ? 'data loaded'
                      : 'Trascina qui il file',
            ),
          ),
        ),
        DropzoneView(
          operation: DragOperation.copy,
          cursor: CursorType.grab,
          onCreated: (ctrl) => controller1 = ctrl,
          onLoaded: () => print('Zone 1 loaded'),
          onError: (error) => print('Zone 1 error: $error'),
          onHover: () {
            setState(() => highlighted1 = true);
            print('Zone 1 hovered');
          },
          onLeave: () {
            setState(() => highlighted1 = false);
            print('Zone 1 left');
          },
          onDropFile: (file) async {
            print('Zone 1 drop: ${file.name}');
            setState(() {
              message1 = '${file.name} dropped';
              highlighted1 = false;
            });
            final bytes = await controller1.getFileData(file);
            print('Read bytes with length ${bytes.length}');
            setState(() {
              data = bytes;
              highlighted1 = false;
            });
            widget.onDataLoaded(bytes, file.name);
          },
          onDropInvalid: (mime) => print('Zone 1 invalid MIME: $mime'),
          onDropFiles: (files) => print('Zone 1 drop multiple: $files'),
        ),
      ],
    );
  }
}
