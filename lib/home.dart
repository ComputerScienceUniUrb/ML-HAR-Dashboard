import 'package:aifit_dashboard/core/application/version_notifier.dart';
import 'package:aifit_dashboard/core/ui/version_widget.dart';
import 'package:aifit_dashboard/features/tracks/ui/widgets/track_list.dart';
import 'package:aifit_dashboard/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:package_info_plus/package_info_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AIFit Dashboard'),
        centerTitle: true,
        leading: const VersionWidget(),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            color: Colors.black,
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Tracce'),
            onTap: () {
              context.go('/tracks');
            },
          ),
          ListTile(
            title: const Text('Esperimenti'),
            onTap: () {
              context.go('/experiments');
            },
          ),
        ],
      ),
    );
  }
}
