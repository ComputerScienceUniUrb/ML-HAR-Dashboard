import 'package:aifit_dashboard/features/tracks/application/tracks_notifier.dart';
import 'package:aifit_dashboard/features/tracks/models/track.dart';
import 'package:aifit_dashboard/features/tracks/ui/widgets/track_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:pluto_grid_plus/pluto_grid_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class ExperimentTrackList extends ConsumerWidget {
  final String experimentCode;
  const ExperimentTrackList({required this.experimentCode, super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(getTracksByExperimentCodeProvider(experimentCode));
    return switch (state) {
      AsyncData(:final value) => TrackGrid(
        tracks: value,
      ),
      AsyncError(:final error) => Text('Error: $error'),
      _ => const Center(child: CircularProgressIndicator()),
    };
  }
}
