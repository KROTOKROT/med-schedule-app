import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final Function(int) onNavigate;

  const HomeScreen({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Главная")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () => onNavigate(1),
              child: const Text("➕ Добавить лекарство"),
            ),
            ElevatedButton(
              onPressed: () => onNavigate(2),
              child: const Text("📋 Список лекарств"),
            ),
            ElevatedButton(
              onPressed: () => onNavigate(3),
              child: const Text("ℹ️ Детали"),
            ),
            ElevatedButton(
              onPressed: () => onNavigate(4),
              child: const Text("⚙️ Настройки"),
            ),
          ],
        ),
      ),
    );
  }
}