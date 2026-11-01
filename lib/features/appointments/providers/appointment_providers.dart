import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:vershina_salon/app/providers/app_providers.dart';
import 'package:vershina_salon/app/theme/design_tokens.dart';
import 'package:vershina_salon/features/appointments/data/datasources/appointment_local_data_source.dart';
import 'package:vershina_salon/features/appointments/data/repositories/appointment_repository_impl.dart';
import 'package:vershina_salon/features/appointments/domain/entities/appointment.dart';
import 'package:vershina_salon/features/appointments/domain/repositories/appointment_repository.dart';

final appointmentRepositoryProvider = Provider<AppointmentRepository>((ref) {
  return AppointmentRepositoryImpl(AppointmentLocalDataSource());
});

final appointmentListControllerProvider =
    StateNotifierProvider<AppointmentListController, List<Appointment>>((ref) {
  final repository = ref.watch(appointmentRepositoryProvider);
  return AppointmentListController(repository);
});

class AppointmentListController extends StateNotifier<List<Appointment>> {
  AppointmentListController(this._repository) : super(const <Appointment>[]) {
    load();
  }

  final AppointmentRepository _repository;

  Future<void> load() async {
    final appointments = await _repository.getAll();
    state = appointments;
  }

  Future<void> addAppointment({
    required String clientName,
    required String serviceName,
    required String masterName,
    required DateTime startsAt,
    required DateTime endsAt,
    required double amount,
  }) async {
    final appointment = Appointment(
      id: const Uuid().v4(),
      clientName: clientName.trim(),
      serviceName: serviceName.trim(),
      masterName: masterName.trim(),
      startsAt: startsAt,
      endsAt: endsAt,
      status: 'Новая',
      amount: amount,
    );

    await _repository.create(appointment);
    await load();
  }
}
