import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      {
        'title': 'Управляйте салоном',
        'subtitle': 'Контроль клиентов, записей, услуг и доходов в одном месте.',
        'icon': Icons.dashboard_customize_rounded,
      },
      {
        'title': 'Планируйте записи',
        'subtitle': 'Календарь, статусы, время и мастера без лишней бюрократии.',
        'icon': Icons.calendar_month_rounded,
      },
      {
        'title': 'Рост и аналитика',
        'subtitle': 'Отслеживайте финансовую активность и эффективность команды.',
        'icon': Icons.trending_up_rounded,
      },
    ];

    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const Spacer(),
            SizedBox(
              height: 240,
              child: PageView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 110,
                        height: 110,
                        decoration: BoxDecoration(
                          color: DesignTokens.goldPrimary.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Icon(
                          item['icon'] as IconData,
                          size: 52,
                          color: DesignTokens.goldPrimary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        item['title'] as String,
                        style: const TextStyle(
                          color: DesignTokens.primaryText,
                          fontSize: 26,
                          fontWeight: FontWeight.w700,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        item['subtitle'] as String,
                        style: const TextStyle(
                          color: DesignTokens.secondaryText,
                          fontSize: 15,
                          height: 1.5,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => context.go('/auth'),
                child: const Text('Продолжить'),
              ),
            ),
            const SizedBox(height: 12),
            TextButton(
              onPressed: () => context.go('/dashboard'),
              child: const Text(
                'Пропустить',
                style: TextStyle(color: DesignTokens.goldPrimary),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
