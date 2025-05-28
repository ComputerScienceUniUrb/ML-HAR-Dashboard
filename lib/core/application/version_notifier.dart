import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:package_info_plus/package_info_plus.dart';

part 'version_notifier.g.dart';

@riverpod
Future<String> getVersion(Ref ref) async {
  final p = await PackageInfo.fromPlatform(baseUrl: 'https://ml-har.web.app/');
  return p.version;
}
