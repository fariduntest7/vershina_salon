import 'package:flutter/material.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';
import 'package:vershina_salon/features/appointments/presentation/screens/appointments_screen.dart';
import 'package:vershina_salon/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:vershina_salon/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:vershina_salon/features/finance/presentation/screens/finance_screen.dart';

class MainShellScreen extends StatefulWidget {
  const MainShellScreen({super.key});

  @override
  State<MainShellScreen> createState() => _MainShellScreenState();
}

class _MainShellScreenState extends State<MainShellScreen> {
  int _currentIndex = 0;

  static const List<_ShellTab> _tabs = [
    _ShellTab(
      label: 'Главная',
      icon: Icons.home_rounded,
      screen: DashboardScreen(),
    ),
    _ShellTab(
      label: 'Календарь',
      icon: Icons.calendar_month_rounded,
      screen: CalendarScreen(),
    ),
    _ShellTab(
      label: 'Записи',
      icon: Icons.event_note_rounded,
      screen: AppointmentsScreen(),
    ),
    _ShellTab(
      label: 'Финансы',
      icon: Icons.account_balance_wallet_rounded,
      screen: FinanceScreen(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      body: IndexedStack(
        index: _currentIndex,
        children: _tabs.map((tab) => tab.screen).toList(),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: DesignTokens.border.withOpacity(0.5)),
          ),
        ),
        child: NavigationBar(
          backgroundColor: DesignTokens.secondaryBackground,
          selectedIndex: _currentIndex,
          onDestinationSelected: (index) {
            setState(() => _currentIndex = index);
          },
          destinations: _tabs
              .map(
                (tab) => NavigationDestination(
                  label: tab.label,
                  icon: Icon(tab.icon),
                  selectedIcon: Icon(tab.icon, color: DesignTokens.goldPrimary),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

class _ShellTab {
  const _ShellTab({
    required this.label,
    required this.icon,
    required this.screen,
  });

  final String label;
  final IconData icon;
  final Widget screen;
}
