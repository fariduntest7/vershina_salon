import 'package:vershina_salon/features/appointments/domain/entities/appointment.dart';

/// Репозиторий записей.
abstract interface class AppointmentRepository {
  Future<List<Appointment>> getAll();
  Future<String> create(Appointment appointment);
  Future<void> update(Appointment appointment);
  Future<void> delete(String id);
}
