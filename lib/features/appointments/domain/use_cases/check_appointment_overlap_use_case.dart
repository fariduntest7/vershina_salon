/// Use case проверки пересечения расписания мастера.
///
/// В реальной реализации эта логика используется при создании записи и
/// при проверке тайм-слотов в календаре.
class CheckAppointmentOverlapUseCase {
  const CheckAppointmentOverlapUseCase();

  bool call({
    required DateTime candidateStart,
    required DateTime candidateEnd,
    required DateTime existingStart,
    required DateTime existingEnd,
  }) {
    final overlapStart = candidateStart.isBefore(existingEnd) && candidateEnd.isAfter(existingStart);
    return overlapStart;
  }
}
