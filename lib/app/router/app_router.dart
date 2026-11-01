import 'package:flutter/material.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: <RouteBase>[
      GoRoute(path: '/splash', builder: (context, state) => const SplashScreen()),
      GoRoute(path: '/onboarding', builder: (context, state) => const OnboardingScreen()),
      GoRoute(path: '/auth', builder: (context, state) => const AuthScreen()),
      GoRoute(path: '/dashboard', builder: (context, state) => const DashboardScreen()),
      GoRoute(path: '/calendar', builder: (context, state) => const CalendarScreen()),
      GoRoute(path: '/appointments', builder: (context, state) => const AppointmentsScreen()),
      GoRoute(path: '/masters', builder: (context, state) => const MastersScreen()),
      GoRoute(path: '/services', builder: (context, state) => const ServicesScreen()),
      GoRoute(path: '/finance', builder: (context, state) => const FinanceScreen()),
      GoRoute(path: '/backup', builder: (context, state) => const BackupScreen()),
      GoRoute(path: '/settings', builder: (context, state) => const SettingsScreen()),
    ],
  );
}
