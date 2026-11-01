import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppShell extends StatelessWidget {
  const AppShell({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_rounded), label: 'Главная'),
          NavigationDestination(icon: Icon(Icons.calendar_month_rounded), label: 'Календарь'),
          NavigationDestination(icon: Icon(Icons.people_rounded), label: 'Клиенты'),
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
      ),
    );
  }
}
