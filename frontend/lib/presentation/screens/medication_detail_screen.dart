import 'package:flutter/material.dart';

class MedicationDetailScreen extends StatelessWidget {
  const MedicationDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Детали")),
      body: const Center(
        child: Text("Детали лекарства"),
      ),
    );
  }
}