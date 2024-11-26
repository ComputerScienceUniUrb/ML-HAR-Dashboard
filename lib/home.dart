import 'package:aifit_dashboard/features/tracks/ui/widgets/track_list.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AIFit Dashboard'),
      ),
      body: TrackList(),
    );
  }
}
