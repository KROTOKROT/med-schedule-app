import 'package:flutter/material.dart';

import 'home_screen.dart';
import 'add_medication_screen.dart';
import 'medication_list_screen.dart';
import 'medication_detail_screen.dart';
import 'settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  late final List<Widget> screens;

  @override
  void initState() {
    super.initState();

    screens = [
      HomeScreen(onNavigate: _goToTab),
      const AddMedicationScreen(),
      const MedicationListScreen(),
      const MedicationDetailScreen(),
      const SettingsScreen(),
    ];
  }

  void _goToTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Главная'),
          BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Добавить'),
          BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Список'),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'Детали'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Настройки'),
        ],
      ),
    );
  }
}