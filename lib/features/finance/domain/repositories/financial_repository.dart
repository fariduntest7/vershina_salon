import 'package:vershina_salon/features/finance/domain/entities/financial_entry.dart';

/// Репозиторий финансовых записей.
abstract interface class FinancialRepository {
  Future<List<FinancialEntry>> getAll();
  Future<String> create(FinancialEntry entry);
  Future<void> update(FinancialEntry entry);
  Future<void> delete(String id);
}
