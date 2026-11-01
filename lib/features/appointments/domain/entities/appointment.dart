/// Сущность записи.
///
/// Запись связывает клиента, услугу, мастера, время и стоимость.
class Appointment {
  const Appointment({
    required this.id,
    required this.clientId,
    required this.masterId,
    required this.serviceId,
    required this.startsAt,
    required this.endsAt,
    required this.status,
    required this.totalPrice,
    required this.createdAt,
    this.notes,
  });

  final String id;
  final String clientId;
  final String masterId;
  final String serviceId;
  final DateTime startsAt;
  final DateTime endsAt;
  final String status;
  final double totalPrice;
  final DateTime createdAt;
  final String? notes;
}
