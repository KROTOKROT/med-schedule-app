import 'package:flutter/material.dart';
import '../../models/medication.dart';
import '../../services/medication_service.dart';

class MedicationListScreen extends StatefulWidget {
  const MedicationListScreen({super.key});

  @override
  State<MedicationListScreen> createState() => _MedicationListScreenState();
}

class _MedicationListScreenState extends State<MedicationListScreen> {
  late Future<List<Medication>> meds;

  @override
  void initState() {
    super.initState();
    meds = MedicationService.getAll();
  }

  void refresh() {
    setState(() {
      meds = MedicationService.getAll();
    });
  }

  Future<void> delete(int id) async {
    await MedicationService.delete(id);
    refresh();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Список"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: refresh,
          )
        ],
      ),
      body: FutureBuilder<List<Medication>>(
        future: meds,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Ошибка: ${snapshot.error}"));
          }

          final data = snapshot.data ?? [];

          if (data.isEmpty) {
            return const Center(child: Text("Пусто"));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              final m = data[index];

              return Dismissible(
                key: Key(m.id.toString()),
                background: Container(color: Colors.red),
                onDismissed: (_) {
                  if (m.id != null) delete(m.id!);
                },
                child: ListTile(
                  title: Text(m.name),
                  subtitle: Text("${m.dosage} • ${m.time}"),
                  leading: const Icon(Icons.medication),
                ),
              );
            },
          );
        },
      ),
    );
  }
}