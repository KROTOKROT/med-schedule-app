import 'package:flutter/material.dart';
import '../../models/medication.dart';
import '../../services/medication_service.dart';

class AddMedicationScreen extends StatefulWidget {
  const AddMedicationScreen({super.key});

  @override
  State<AddMedicationScreen> createState() => _AddMedicationScreenState();
}

class _AddMedicationScreenState extends State<AddMedicationScreen> {
  final name = TextEditingController();
  final dosage = TextEditingController();
  final time = TextEditingController();
  final instructions = TextEditingController();

  Future<void> save() async {
    await MedicationService.add(
      Medication(
        name: name.text,
        dosage: dosage.text,
        time: time.text,
        instructions: instructions.text,
      ),
    );

    name.clear();
    dosage.clear();
    time.clear();
    instructions.clear();

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Добавлено")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Добавить")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(controller: name, decoration: const InputDecoration(labelText: "Название")),
            TextField(controller: dosage, decoration: const InputDecoration(labelText: "Дозировка")),
            TextField(controller: time, decoration: const InputDecoration(labelText: "Время")),
            TextField(controller: instructions, decoration: const InputDecoration(labelText: "Инструкции")),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: save,
              child: const Text("Сохранить"),
            )
          ],
        ),
      ),
    );
  }
}