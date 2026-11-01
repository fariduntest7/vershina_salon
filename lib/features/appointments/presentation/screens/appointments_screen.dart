import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';
import 'package:vershina_salon/features/appointments/providers/appointment_providers.dart';

class AppointmentsScreen extends ConsumerWidget {
  const AppointmentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appointments = ref.watch(appointmentListControllerProvider);

    return Scaffold(
      backgroundColor: DesignTokens.primaryBackground,
      appBar: AppBar(
        backgroundColor: DesignTokens.secondaryBackground,
        title: const Text('Записи'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: appointments.isEmpty
            ? const Center(
                child: Text(
                  'Пока нет записей',
                  style: TextStyle(color: DesignTokens.primaryText),
                ),
              )
            : ListView.separated(
                itemCount: appointments.length,
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final appointment = appointments[index];
                  final timeLabel =
                      '${appointment.startsAt.hour.toString().padLeft(2, '0')}:${appointment.startsAt.minute.toString().padLeft(2, '0')} - '
                      '${appointment.endsAt.hour.toString().padLeft(2, '0')}:${appointment.endsAt.minute.toString().padLeft(2, '0')}';

                  return Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: DesignTokens.cardBackground,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(color: DesignTokens.border),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: DesignTokens.goldPrimary.withOpacity(0.14),
                          child: const Icon(
                            Icons.event_available_rounded,
                            color: DesignTokens.goldPrimary,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                appointment.clientName,
                                style: const TextStyle(
                                  color: DesignTokens.primaryText,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${appointment.serviceName} · ${appointment.masterName}',
                                style: const TextStyle(
                                  color: DesignTokens.secondaryText,
                                  fontSize: 12,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                timeLabel,
                                style: const TextStyle(
                                  color: DesignTokens.goldPrimary,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${appointment.amount.toStringAsFixed(0)} TJS',
                              style: const TextStyle(
                                color: DesignTokens.primaryText,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: DesignTokens.goldPrimary.withOpacity(0.12),
                                borderRadius: BorderRadius.circular(999),
                              ),
                              child: Text(
                                appointment.status,
                                style: const TextStyle(
                                  color: DesignTokens.goldPrimary,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await ref.read(appointmentListControllerProvider.notifier).addAppointment(
            clientName: 'Новый клиент',
            serviceName: 'Маникюр',
            masterName: 'Фарид',
            startsAt: DateTime(2026, 10, 25, 14, 0),
            endsAt: DateTime(2026, 10, 25, 15, 30),
            amount: 420,
          );
        },
        icon: const Icon(Icons.add_rounded),
        label: const Text('Новая запись'),
      ),
    );
  }
}
