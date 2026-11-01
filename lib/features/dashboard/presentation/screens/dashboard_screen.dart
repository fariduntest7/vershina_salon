import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vershina_salon/app/providers/app_providers.dart';
import 'package:vershina_salon/app/theme/design_tokens.dart';
import 'package:vershina_salon/features/appointments/providers/appointment_providers.dart';
import 'package:vershina_salon/features/masters/providers/master_providers.dart';
import 'package:vershina_salon/features/services/providers/service_providers.dart';

/// Экран панели управления.
///
/// Основная статистика приложения формируется из данных о клиентах,
/// мастерах, услугах и записях. Это позволяет панели оставаться живой и
/// отражать текущее состояние салона без ручного обновления статических значений.
class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clients = ref.watch(clientListControllerProvider);
    final appointments = ref.watch(appointmentListControllerProvider);
    final masters = ref.watch(masterListControllerProvider);
    final services = ref.watch(serviceListControllerProvider);

    final totalIncome = appointments.fold<double>(
      0,
      (sum, item) => sum + item.amount,
    );
    final today = DateTime.now();
    final todayAppointments = appointments.where((item) {
      return item.startsAt.year == today.year &&
          item.startsAt.month == today.month &&
          item.startsAt.day == today.day;
    }).length;
    final averageMasterRating = masters.isEmpty
        ? 0.0
        : masters.fold<double>(0, (sum, item) => sum + item.rating) / masters.length;

    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      appBar: AppBar(
        backgroundColor: DesignTokens.secondaryBackground,
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_rounded),
          ),
        ],
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
                    accent: DesignTokens.success,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    title: 'Клиенты',
                    value: '${clients.length}',
                    icon: Icons.people_alt_rounded,
                    accent: DesignTokens.goldPrimary,
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
                    value: '${appointments.length}',
                    icon: Icons.event_note_rounded,
                    accent: DesignTokens.info,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _MetricCard(
                    title: 'Мастеров',
                    value: '${masters.length}',
                    icon: Icons.person_rounded,
                    accent: DesignTokens.warning,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: DesignTokens.cardBackground,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: DesignTokens.border),
              ),
              child: Row(
                children: [
                  Container(
                    width: 46,
                    height: 46,
                    decoration: BoxDecoration(
                      color: DesignTokens.goldPrimary.withOpacity(0.12),
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: const Icon(
                      Icons.today_rounded,
                      color: DesignTokens.goldPrimary,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Сегодня',
                          style: TextStyle(
                            color: DesignTokens.secondaryText,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '$todayAppointments записей · ${services.length} услуг',
                          style: const TextStyle(
                            color: DesignTokens.primaryText,
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    '${averageMasterRating.toStringAsFixed(1)} ★',
                    style: const TextStyle(
                      color: DesignTokens.goldPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
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
                          child: const Icon(
                            Icons.person_rounded,
                            color: DesignTokens.goldPrimary,
                          ),
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
    required this.accent,
  });

  final String title;
  final String value;
  final IconData icon;
  final Color accent;

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
              color: accent.withOpacity(0.12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: accent, size: 18),
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
