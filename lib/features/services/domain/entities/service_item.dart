/// Услуга салона.
class ServiceItem {
  const ServiceItem({
    required this.id,
    required this.name,
    required this.category,
    required this.durationMinutes,
    required this.price,
    required this.isPopular,
  });

  final String id;
  final String name;
  final String category;
  final int durationMinutes;
  final double price;
  final bool isPopular;

  ServiceItem copyWith({
    String? id,
    String? name,
    String? category,
    int? durationMinutes,
    double? price,
    bool? isPopular,
  }) {
    return ServiceItem(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      durationMinutes: durationMinutes ?? this.durationMinutes,
      price: price ?? this.price,
      isPopular: isPopular ?? this.isPopular,
    );
  }
}
