import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:vershina_salon/features/authentication/presentation/screens/auth_screen.dart';
import 'package:vershina_salon/features/backup/presentation/screens/backup_screen.dart';
import 'package:vershina_salon/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:vershina_salon/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:vershina_salon/features/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:vershina_salon/features/settings/presentation/screens/settings_screen.dart';
import 'package:vershina_salon/features/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  final GoRouter router = GoRouter(
    initialLocation: '/splash',
    routes: <RouteBase>[
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingScreen(),
      ),
      GoRoute(
        path: '/auth',
        builder: (context, state) => const AuthScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/calendar',
        builder: (context, state) => const CalendarScreen(),
      ),
      GoRoute(
        path: '/backup',
        builder: (context, state) => const BackupScreen(),
      ),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
    ],
  );
}
