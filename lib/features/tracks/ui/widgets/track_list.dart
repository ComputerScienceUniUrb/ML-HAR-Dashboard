import 'package:aifit_dashboard/features/tracks/application/tracks_notifier.dart';
import 'package:aifit_dashboard/features/tracks/models/track.dart';
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
    return switch (state) {
      AsyncData(:final value) => _Grid(
          tracks: value,
        ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}

class _Grid extends StatefulWidget {
  final List<Track> tracks;

  const _Grid({super.key, required this.tracks});

  @override
  State<_Grid> createState() => _GridState();
}

class _GridState extends State<_Grid> {
  final List<PlutoColumn> columns = [];

  final List<PlutoRow> rows = [];

  @override
  void initState() {
    super.initState();

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
              child: Text('Download'),
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
      ],
    );
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

final dateFormat = DateFormat('dd MMMM yyyy - HH:mm');

/*class _TrackTile extends StatelessWidget {
  final Track track;

  const _TrackTile({required this.track});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Text(
              dateFormat.format(track.timestamp),
            )
          ],
        ),
      ),
    );
  }
}*/

class _UserColumnMenu implements PlutoColumnMenuDelegate<_UserColumnMenuItem> {
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
}

enum _UserColumnMenuItem {
  moveNext,
  movePrevious,
}

extension TrackRow on Track {
  toCell() {
    return {
      'download_url': PlutoCell(value: downloadUrl),
      'date': PlutoCell(value: dateFormat.format(timestamp)),
      'battery': PlutoCell(value: startBatteryLevel),
      'battery_save_mode': PlutoCell(value: isInBatterySaveMode),
      'activity_type': PlutoCell(value: activityType.name),
      'smartphone_position': PlutoCell(value: smartphonePosition.name),
      'age': PlutoCell(value: userInfo.age),
      'height': PlutoCell(value: userInfo.height),
      'weight': PlutoCell(value: userInfo.weight),
      'gender': PlutoCell(value: userInfo.gender.name),
    };
  }
}
