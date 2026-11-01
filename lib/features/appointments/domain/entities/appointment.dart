/// Сущность записи клиента в салон.
class Appointment {
  const Appointment({
    required this.id,
    required this.clientName,
    required this.serviceName,
    required this.masterName,
    required this.startsAt,
    required this.endsAt,
    required this.status,
    required this.amount,
  });

  final String id;
  final String clientName;
  final String serviceName;
  final String masterName;
  final DateTime startsAt;
  final DateTime endsAt;
  final String status;
  final double amount;

  Appointment copyWith({
    String? id,
    String? clientName,
    String? serviceName,
    String? masterName,
    DateTime? startsAt,
    DateTime? endsAt,
    String? status,
    double? amount,
  }) {
    return Appointment(
      id: id ?? this.id,
      clientName: clientName ?? this.clientName,
      serviceName: serviceName ?? this.serviceName,
      masterName: masterName ?? this.masterName,
      startsAt: startsAt ?? this.startsAt,
      endsAt: endsAt ?? this.endsAt,
      status: status ?? this.status,
      amount: amount ?? this.amount,
    );
  }
}
