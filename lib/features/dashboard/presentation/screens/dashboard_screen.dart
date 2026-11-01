import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vershina_salon/app/providers/app_providers.dart';
import 'package:vershina_salon/app/theme/design_tokens.dart';

/// Экран панели управления.
///
/// Основная статистика приложения формируется из данных о клиентах и записей.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientListControllerProvider);
    final totalIncome = clients.fold<double>(0, (sum, client) => sum + client.totalSpend);

    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      appBar: AppBar(
        backgroundColor: DesignTokens.secondaryBackground,
        title: const Text('Dashboard'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    title: 'Доход',
                    value: '${totalIncome.toStringAsFixed(0)} TJS',
                    icon: Icons.trending_up_rounded,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    title: 'Клиенты',
                    value: '${clients.length}',
                    icon: Icons.people_alt_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Expanded(
                  child: _MetricCard(
                    title: 'Записи',
                    value: '18',
                    icon: Icons.event_note_rounded,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    title: 'Прибыль',
                    value: '12 450 TJS',
                    icon: Icons.attach_money_rounded,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Последние клиенты',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  color: DesignTokens.primaryText,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: clients.length,
                itemBuilder: (context, index) {
                  final client = clients[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 10),
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: DesignTokens.cardBackground,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: DesignTokens.border),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: DesignTokens.goldPrimary.withOpacity(0.14),
                          child: const Icon(Icons.person_rounded, color: DesignTokens.goldPrimary),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                client.name,
                                style: const TextStyle(
                                  color: DesignTokens.primaryText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                client.phone,
                                style: const TextStyle(color: DesignTokens.secondaryText),
                              ),
                            ],
                          ),
                        ),
                        Text(
                          '${client.totalSpend.toStringAsFixed(0)} TJS',
                          style: const TextStyle(
                            color: DesignTokens.goldPrimary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricCard extends StatelessWidget {
  const _MetricCard({
    required this.title,
    required this.value,
    required this.icon,
  });

  final String title;
  final String value;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: DesignTokens.cardBackground,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: DesignTokens.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: DesignTokens.goldPrimary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: DesignTokens.goldPrimary, size: 18),
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(
              color: DesignTokens.secondaryText,
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              color: DesignTokens.primaryText,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}
