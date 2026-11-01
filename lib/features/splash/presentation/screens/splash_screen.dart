import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future<void>.delayed(const Duration(milliseconds: 1200), () {
      if (!mounted) return;
      context.go('/onboarding');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: DesignTokens.goldPrimary.withOpacity(0.12),
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: DesignTokens.goldPrimary.withOpacity(0.4),
                ),
              ),
              child: const Icon(
                Icons.spa_rounded,
                size: 62,
                color: DesignTokens.goldPrimary,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'VERSHINA SALON',
              style: TextStyle(
                color: DesignTokens.primaryText,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: 1.6,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Luxury management',
              style: TextStyle(
                color: DesignTokens.secondaryText,
                fontSize: 14,
                letterSpacing: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
