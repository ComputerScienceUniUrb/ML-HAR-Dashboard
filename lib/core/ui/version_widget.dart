import 'package:aifit_dashboard/core/application/version_notifier.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class VersionWidget extends ConsumerWidget {
  const VersionWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final version = ref.watch(getVersionProvider).valueOrNull ?? '0.0.6';

    return Center(child: Text('v$version'));
  }
}
