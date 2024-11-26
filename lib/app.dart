import 'package:aifit_dashboard/home.dart';
import 'package:flutter/material.dart';

class AIFitDashboardApp extends StatelessWidget {
  const AIFitDashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
