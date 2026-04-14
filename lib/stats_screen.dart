import 'package:flutter/material.dart';

// ─── Écran Statistiques (F6) ─────────────────────────────────────────────────
// À compléter entièrement : propriétés, constructeur, affichage des données.

class StatsScreen extends StatelessWidget {
  StatsScreen({super.key, required this.tasks});
  final tasks;

  dynamic get count => tasks.where((task) => task.isDone == true).length;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Statistiques'), backgroundColor: Theme.of(context).colorScheme.inversePrimary),
      body: Center(
        child: Column(
          children: [
            Text(tasks.length),
            Text(count),
            Text(tasks.length-count),
            Text(tasks.length-count),
          ]
      )
    )
    );
  }
}
