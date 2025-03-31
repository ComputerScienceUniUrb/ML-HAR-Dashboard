import 'package:aifit_dashboard/features/auth/ui/sign_in_screen.dart';
import 'package:aifit_dashboard/features/experiments/models/experiment.dart';
import 'package:aifit_dashboard/features/experiments/ui/experiment_details.dart';
import 'package:aifit_dashboard/features/experiments/ui/experiments_screen.dart';
import 'package:aifit_dashboard/features/experiments/ui/new_experiment.dart';
import 'package:aifit_dashboard/features/tracks/ui/widgets/track_list.dart';
import 'package:aifit_dashboard/home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:go_router/go_router.dart';

// GoRouter configuration
final router = GoRouter(
  initialLocation: '/',
  observers: [FlutterSmartDialog.observer],
  debugLogDiagnostics: true,
  redirect: (BuildContext context, GoRouterState state) {
    final bool loggedIn = FirebaseAuth.instance.currentUser != null;
    final bool loggingIn = state.matchedLocation == '/signin';
    if (!loggedIn) return '/signin';
    if (loggingIn) return '/';
    // no need to redirect at all
    return null;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const HomeScreen(),
      routes: [
        GoRoute(
          path: 'tracks',
          builder: (context, state) => const TrackList(),
        ),
        GoRoute(
          path: 'experiments',
          builder: (context, state) => const ExperimentsScreen(),
          routes: [
            GoRoute(
              path: 'new',
              builder: (context, state) {
                return const NewExperimentScreen();
              },
            ),
            GoRoute(
                path: 'details/:experimentId',
                builder: (context, state) {
                  final exId = state.pathParameters['experimentId'] as String;
                  final ex = state.extra as Experiment?;
                  return ExperimentDetailsScreen(
                    experimentId: exId,
                    experiment: ex,
                  );
                },
                routes: [
                  GoRoute(
                      path: 'edit',
                      builder: (context, state) {
                        final ex = state.extra as Experiment?;
                        return NewExperimentScreen(
                          initialExperiment: ex,
                          initialExperimentId: state.pathParameters['experimentId'],
                        );
                      }),
                ]),
          ],
        ),
      ]
    ),
    GoRoute(
      path: '/signin',
      builder: (context, state) => const SignInScreen(),
    ),

  ],
);
