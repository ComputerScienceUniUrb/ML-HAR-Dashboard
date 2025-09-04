import 'package:aifit_dashboard/core/data/firestore_references.dart';
import 'package:aifit_dashboard/core/utils.dart';
import 'package:aifit_dashboard/features/tracks/application/tracks_notifier.dart';
import 'package:aifit_dashboard/features/tracks/models/inference_output.dart';
import 'package:aifit_dashboard/features/tracks/models/track.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class TrackList extends ConsumerWidget {
  const TrackList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getTracksProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutte le tracce'),
      ),
      body: switch (state) {
        AsyncData(:final value) => TrackGrid(
            tracks: value,
          ),
        AsyncError(:final error) => Text('Error: $error'),
        _ => const Center(child: CircularProgressIndicator()),
      },
    );
  }
}

class TrackGrid extends StatefulWidget {
  final List<Track> tracks;

  const TrackGrid({super.key, required this.tracks});

  @override
  State<TrackGrid> createState() => _TrackGridState();
}

class _TrackGridState extends State<TrackGrid> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();
    init();
  }

  void init() {
    rows.clear();
    columns.clear();
    for (final t in widget.tracks) {
      rows.add(PlutoRow(cells: t.toCell()));
    }

    columns.addAll(
      [
        PlutoColumn(
          title: 'CSV',
          field: 'download_url',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return ElevatedButton(
              onPressed: () async {
                final url = rendererContext
                    .row.cells[rendererContext.column.field]!.value
                    .toString();
                final uri = Uri.parse(url);
                if (await canLaunchUrl(uri)) {
                  launchUrl(uri);
                }
              },
              child: const Text('Download'),
            );
          },
        ),
        PlutoColumn(
          readOnly: true,
          title: 'Inference',
          field: 'inference',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            final enabled = rendererContext
                    .row.cells[rendererContext.column.field]?.value !=
                null;
            return ElevatedButton(
              onPressed: enabled
                  ? () async {
                final windowSize = 200;
                final allOutputs = rendererContext
                          .row.cells[rendererContext.column.field]?.value;
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Text(
                                          'Risultati Inferenza (${allOutputs.length} blocchi non sovrapposti)',
                                          style: const TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  if (allOutputs.isEmpty)
                                    const Padding(
                                      padding: EdgeInsets.all(20),
                                      child:
                                          Text('Nessun risultato da mostrare.'),
                                    )
                                  else
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.6,
                                      width: double.maxFinite,
                                      child: ListView.builder(
                                        itemCount: allOutputs.length,
                                        itemBuilder: (context, index) {
                                          final output = allOutputs[index] as InferenceOutput;
                                          final startIndex = index * windowSize;
                                          final endIndex =
                                              startIndex + windowSize - 1;
                                          return Card(
                                            margin: const EdgeInsets.symmetric(
                                                vertical: 8.0),
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(12.0),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    'Blocco #${index + 1} (Campioni $startIndex - $endIndex)',
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: Theme.of(context)
                                                          .colorScheme
                                                          .primary,
                                                    ),
                                                  ),
                                                  const Divider(),
                                                  const SizedBox(height: 4),
                                                  Text('Age: ${output.age}'),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                      'Weight: ${output.weight}'),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                      'Height: ${output.height}'),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                    'Activity: ${output.activity.name} (index: ${output.activityIndex})',
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  const SizedBox(height: 4),
                                                  for (final a
                                                      in output.activities)
                                                    Text(
                                                        '\t\t${a.keys.first} (${a.values.first})'),
                                                  const SizedBox(height: 4),
                                                  Text(
                                                      'Gender: ${output.gender}'),
                                                ],
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    }
                  : null,
              child: const Text('Show'),
            );
          },
        ),
        PlutoColumn(
          readOnly: true,
          title: 'Date',
          field: 'date',
          type: PlutoColumnType.text(),
        ),
        PlutoColumn(
          readOnly: true,
          title: 'EXP. CODE',
          field: 'code',
          type: PlutoColumnType.text(),
        ),

        PlutoColumn(
          readOnly: true,
          title: '%',
          field: 'battery',
          width: 60,
          type: PlutoColumnType.number(),
        ),

        /// Number Column definition
        PlutoColumn(
          readOnly: true,
          title: 'Battery Save Mode',
          field: 'battery_save_mode',
          width: 100,
          type: PlutoColumnType.text(),
        ),

        /// Select Column definition
        PlutoColumn(
          readOnly: true,
          title: 'Activity Type',
          field: 'activity_type',
          type: PlutoColumnType.text(),
        ),

        /// Datetime Column definition
        PlutoColumn(
          readOnly: true,
          title: 'Smartphone position',
          field: 'smartphone_position',
          type: PlutoColumnType.text(),
        ),
        PlutoColumn(
          readOnly: true,
          title: 'Durata (s)',
          field: 'duration',
          width: 100,
          type: PlutoColumnType.number(),
        ),

        /// Time Column definition
        PlutoColumn(
          readOnly: true,
          title: 'Age',
          field: 'age',
          width: 100,
          type: PlutoColumnType.number(),
        ),
        PlutoColumn(
          readOnly: true,
          title: 'Height',
          field: 'height',
          width: 100,
          type: PlutoColumnType.number(),
        ),
        PlutoColumn(
          readOnly: true,
          title: 'Weight',
          field: 'weight',
          width: 100,
          type: PlutoColumnType.number(),
        ),
        PlutoColumn(
          readOnly: true,
          title: 'Gender',
          field: 'gender',
          width: 100,
          type: PlutoColumnType.text(),
        ),
        PlutoColumn(
          readOnly: true,
          title: 'Device',
          field: 'device',
          width: 100,
          type: PlutoColumnType.text(),
        ),
        PlutoColumn(
          readOnly: true,
          title: 'OS',
          field: 'os',
          width: 100,
          type: PlutoColumnType.text(),
        ),
        PlutoColumn(
          readOnly: true,
          title: 'App Version',
          field: 'app_version',
          width: 100,
          type: PlutoColumnType.text(),
        ),
        PlutoColumn(
          readOnly: true,
          title: 'Is it Debug?',
          field: 'debug',
          width: 50,
          type: PlutoColumnType.text(),
        ),
        PlutoColumn(
          title: 'Delete track',
          field: 'delete',
          type: PlutoColumnType.text(),
          renderer: (rendererContext) {
            return ElevatedButton(
              onPressed: () async {
                final trackId = rendererContext
                    .row.cells[rendererContext.column.field]!.value
                    .toString();
                print(trackId);
                // await FirestoreReference.trackDoc(trackId).delete();
                // await FirebaseStorage.instance.refFromURL(widget.tracks[].downloadUrl).delete();
              },
              child: const Text('Delete'),
            );
          },
        ),
      ],
    );
  }

  @override
  void didUpdateWidget(covariant TrackGrid oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.tracks != widget.tracks) {
      init();
    }
  }

  @override
  Widget build(BuildContext context) {
    return PlutoGrid(
      columns: columns,
      rows: rows,
      // columnMenuDelegate: _UserColumnMenu(),
    );
  }
}

/*class _UserColumnMenu implements PlutoColumnMenuDelegate<_UserColumnMenuItem> {
  @override
  List<PopupMenuEntry<_UserColumnMenuItem>> buildMenuItems({
    required PlutoGridStateManager stateManager,
    required PlutoColumn column,
  }) {
    return [
      if (column.key != stateManager.columns.last.key)
        const PopupMenuItem<_UserColumnMenuItem>(
          value: _UserColumnMenuItem.moveNext,
          height: 36,
          enabled: true,
          child: Text('Move next', style: TextStyle(fontSize: 13)),
        ),
      if (column.key != stateManager.columns.first.key)
        const PopupMenuItem<_UserColumnMenuItem>(
          value: _UserColumnMenuItem.movePrevious,
          height: 36,
          enabled: true,
          child: Text('Move previous', style: TextStyle(fontSize: 13)),
        ),
    ];
  }

  @override
  void onSelected({
    required BuildContext context,
    required PlutoGridStateManager stateManager,
    required PlutoColumn column,
    required bool mounted,
    required _UserColumnMenuItem? selected,
  }) {
    switch (selected) {
      case _UserColumnMenuItem.moveNext:
        final targetColumn = stateManager.columns
            .skipWhile((value) => value.key != column.key)
            .skip(1)
            .first;

        stateManager.moveColumn(column: column, targetColumn: targetColumn);
        break;
      case _UserColumnMenuItem.movePrevious:
        final targetColumn = stateManager.columns.reversed
            .skipWhile((value) => value.key != column.key)
            .skip(1)
            .first;

        stateManager.moveColumn(column: column, targetColumn: targetColumn);
        break;
      case null:
        break;
    }
  }
}*/

enum _UserColumnMenuItem {
  moveNext,
  movePrevious,
}

extension TrackRow on Track {
  Map<String, PlutoCell> toCell() {
    return {
      'download_url': PlutoCell(value: downloadUrl),
      'inference': PlutoCell(value: inferenceOutputs),
      'date': PlutoCell(value: genericDateFormatter.format(timestamp)),
      'battery': PlutoCell(value: startBatteryLevel),
      'code': PlutoCell(value: experimentCode ?? '-'),
      'battery_save_mode': PlutoCell(value: isInBatterySaveMode),
      'activity_type': PlutoCell(value: activityType.translate),
      'smartphone_position': PlutoCell(value: smartphonePosition.translate),
      'duration': PlutoCell(value: testDuration),
      'age': PlutoCell(value: userInfo.age),
      'height': PlutoCell(value: userInfo.height),
      'weight': PlutoCell(value: userInfo.weight),
      'gender': PlutoCell(value: userInfo.gender.translate),
      'os': PlutoCell(value: os),
      'device': PlutoCell(value: device),
      'app_version': PlutoCell(value: appVersion),
      'delete': PlutoCell(value: cloudId),
      'debug': PlutoCell(value: debug),
    };
  }
}
