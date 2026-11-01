import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BottomNavigationBarExt extends StatelessWidget {
  const BottomNavigationBarExt({super.key});

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      destinations: const [
        NavigationDestination(icon: Icon(Icons.dashboard_rounded), label: 'Главная'),
        NavigationDestination(icon: Icon(Icons.calendar_month_rounded), label: 'Календарь'),
        NavigationDestination(icon: Icon(Icons.people_alt_rounded), label: 'Клиенты'),
        NavigationDestination(icon: Icon(Icons.settings_rounded), label: 'Настройки'),
      ],
      onDestinationSelected: (index) {
        switch (index) {
          case 0:
            context.go('/dashboard');
          case 1:
            context.go('/calendar');
          case 2:
            context.go('/auth');
          case 3:
            context.go('/settings');
        }
      },
    );
  }
}
