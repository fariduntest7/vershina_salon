import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';
import 'package:vershina_salon/features/appointments/presentation/widgets/appointment_row.dart';
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

                  return AppointmentRow(
                    time: timeLabel,
                    client: appointment.clientName,
                    service: appointment.serviceName,
                    master: appointment.masterName,
                    status: appointment.status,
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
