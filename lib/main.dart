import 'package:aifit_dashboard/app.dart';
import 'package:aifit_dashboard/firebase_options.dart';
import 'package:aifit_dashboard/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  usePathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Listen for Auth changes and .refresh the GoRouter [router]
  // GoRouter router = RoutingService().router;
  FirebaseAuth.instance.authStateChanges().listen((User? user) {
    router.refresh();
  });

  runApp(const ProviderScope(child: AIFitDashboardApp()));
}
