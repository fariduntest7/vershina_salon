import 'package:vershina_salon/features/appointments/domain/entities/appointment.dart';

/// Локальный источник данных записей.
class AppointmentLocalDataSource {
  AppointmentLocalDataSource()
      : _appointments = <Appointment>[
          Appointment(
            id: 'appt-1',
            clientName: 'Анна Петрова',
            serviceName: 'Мужская стрижка',
            masterName: 'Сардор',
            startsAt: DateTime(2026, 10, 20, 9, 0),
            endsAt: DateTime(2026, 10, 20, 10, 0),
            status: 'Подтверждена',
            amount: 350,
          ),
          Appointment(
            id: 'appt-2',
            clientName: 'Рустам Мирзоев',
            serviceName: 'Окрашивание',
            masterName: 'Фарид',
            startsAt: DateTime(2026, 10, 21, 11, 30),
            endsAt: DateTime(2026, 10, 21, 13, 0),
            status: 'В процессе',
            amount: 680,
          ),
        ];

  final List<Appointment> _appointments;

  Future<List<Appointment>> getAll() async {
    return List<Appointment>.from(_appointments);
  }

  Future<String> create(Appointment appointment) async {
    _appointments.add(appointment);
    return appointment.id;
  }

  Future<void> update(Appointment appointment) async {
    final index = _appointments.indexWhere((item) => item.id == appointment.id);
    if (index == -1) {
      throw StateError('Запись не найдена для обновления.');
    }
    _appointments[index] = appointment;
  }

  Future<void> delete(String id) async {
    _appointments.removeWhere((item) => item.id == id);
  }
}
