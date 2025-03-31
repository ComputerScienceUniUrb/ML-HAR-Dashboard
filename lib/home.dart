import 'package:aifit_dashboard/features/tracks/ui/widgets/track_list.dart';
import 'package:aifit_dashboard/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AIFit Dashboard'),
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
            title: Text('Tracce'),
            onTap: () {
              context.go('/tracks');
            },
          ),
          ListTile(
            title: Text('Esperimenti'),
            onTap: () {
              context.go('/experiments');
            },
          ),
        ],
      ),
    );
  }
}
