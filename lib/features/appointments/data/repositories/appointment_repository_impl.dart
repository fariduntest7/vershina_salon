import 'package:vershina_salon/features/appointments/data/datasources/appointment_local_data_source.dart';
import 'package:vershina_salon/features/appointments/domain/entities/appointment.dart';
import 'package:vershina_salon/features/appointments/domain/repositories/appointment_repository.dart';

/// Реализация репозитория записей.
class AppointmentRepositoryImpl implements AppointmentRepository {
  AppointmentRepositoryImpl(this._dataSource);

  final AppointmentLocalDataSource _dataSource;

  @override
  Future<List<Appointment>> getAll() async => _dataSource.getAll();

  @override
  Future<String> create(Appointment appointment) async {
    return _dataSource.create(appointment);
  }

  @override
  Future<void> update(Appointment appointment) async {
    await _dataSource.update(appointment);
  }

  @override
  Future<void> delete(String id) async {
    await _dataSource.delete(id);
  }
}
