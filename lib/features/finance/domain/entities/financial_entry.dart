/// Финансовая запись салона.
class FinancialEntry {
  const FinancialEntry({
    required this.id,
    required this.title,
    required this.category,
    required this.amount,
    required this.date,
    required this.type,
  });

  final String id;
  final String title;
  final String category;
  final double amount;
  final DateTime date;
  final String type;

  FinancialEntry copyWith({
    String? id,
    String? title,
    String? category,
    double? amount,
    DateTime? date,
    String? type,
  }) {
    return FinancialEntry(
      id: id ?? this.id,
      title: title ?? this.title,
      category: category ?? this.category,
      amount: amount ?? this.amount,
      date: date ?? this.date,
      type: type ?? this.type,
    );
  }
}
