import 'package:vershina_salon/features/finance/domain/entities/financial_entry.dart';

/// Локальный источник финансовых записей.
class FinancialLocalDataSource {
  FinancialLocalDataSource()
      : _entries = <FinancialEntry>[
          FinancialEntry(
            id: 'finance-1',
            title: 'Выручка: стрижка',
            category: 'Услуги',
            amount: 350,
            date: DateTime(2026, 10, 20),
            type: 'income',
          ),
          FinancialEntry(
            id: 'finance-2',
            title: 'Аренда студии',
            category: 'Расходы',
            amount: 2600,
            date: DateTime(2026, 10, 19),
            type: 'expense',
          ),
          FinancialEntry(
            id: 'finance-3',
            title: 'Выручка: окрашивание',
            category: 'Услуги',
            amount: 680,
            date: DateTime(2026, 10, 18),
            type: 'income',
          ),
        ];

  final List<FinancialEntry> _entries;

  Future<List<FinancialEntry>> getAll() async => List<FinancialEntry>.from(_entries);

  Future<String> create(FinancialEntry entry) async {
    _entries.add(entry);
    return entry.id;
  }

  Future<void> update(FinancialEntry entry) async {
    final index = _entries.indexWhere((item) => item.id == entry.id);
    if (index == -1) {
      throw StateError('Финансовая запись не найдена.');
    }
    _entries[index] = entry;
  }

  Future<void> delete(String id) async {
    _entries.removeWhere((item) => item.id == id);
  }
}
