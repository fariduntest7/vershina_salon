/// Use case создания записи.
///
/// Проверяет корректность временного диапазона и сохраняет запись.
class CreateAppointmentUseCase {
  const CreateAppointmentUseCase();

  Appointment call({
    required String id,
    required String clientId,
    required String masterId,
    required String serviceId,
    required DateTime startsAt,
    required DateTime endsAt,
    required String status,
    required double totalPrice,
    required DateTime createdAt,
    String? notes,
  }) {
    if (endsAt.isBefore(startsAt) || endsAt.isAtSameMomentAs(startsAt)) {
      throw const BusinessRuleException('Время окончания записи должно быть позже времени начала.');
    }

    return Appointment(
      id: id,
      clientId: clientId,
      masterId: masterId,
      serviceId: serviceId,
      startsAt: startsAt,
      endsAt: endsAt,
      status: status,
      totalPrice: totalPrice,
      createdAt: createdAt,
      notes: notes,
    );
  }
}
