/// Модель клиента.
///
/// Представляет сущность клиента салона.
/// Клиент может иметь личные данные, контактную информацию,
/// историю визитов и комментарии.
class Client {
  const Client({
    required this.id,
    required this.name,
    required this.phone,
    required this.createdAt,
    this.email,
    this.birthDate,
    this.photoUrl,
    this.notes,
    this.isActive = true,
    this.totalSpend = 0,
    this.lastVisitAt,
    this.updatedAt,
  });

  final String id;
  final String name;
  final String phone;
  final String? email;
  final DateTime? birthDate;
  final String? photoUrl;
  final String? notes;
  final bool isActive;
  final double totalSpend;
  final DateTime? lastVisitAt;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Client copyWith({
    String? id,
    String? name,
    String? phone,
    String? email,
    DateTime? birthDate,
    String? photoUrl,
    String? notes,
    bool? isActive,
    double? totalSpend,
    DateTime? lastVisitAt,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Client(
      id: id ?? this.id,
      name: name ?? this.name,
      phone: phone ?? this.phone,
      email: email ?? this.email,
      birthDate: birthDate ?? this.birthDate,
      photoUrl: photoUrl ?? this.photoUrl,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      totalSpend: totalSpend ?? this.totalSpend,
      lastVisitAt: lastVisitAt ?? this.lastVisitAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
