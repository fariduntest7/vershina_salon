import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:vershina_salon/features/finance/data/datasources/financial_local_data_source.dart';
import 'package:vershina_salon/features/finance/data/repositories/financial_repository_impl.dart';
import 'package:vershina_salon/features/finance/domain/entities/financial_entry.dart';
import 'package:vershina_salon/features/finance/domain/repositories/financial_repository.dart';

final financialRepositoryProvider = Provider<FinancialRepository>((ref) {
  return FinancialRepositoryImpl(FinancialLocalDataSource());
});

final financialControllerProvider =
    StateNotifierProvider<FinancialController, List<FinancialEntry>>((ref) {
  final repository = ref.watch(financialRepositoryProvider);
  return FinancialController(repository);
});

class FinancialController extends StateNotifier<List<FinancialEntry>> {
  FinancialController(this._repository) : super(const <FinancialEntry>[]) {
    load();
  }

  final FinancialRepository _repository;

  Future<void> load() async {
    state = await _repository.getAll();
  }

  Future<void> addEntry({
    required String title,
    required String category,
    required double amount,
    required String type,
    DateTime? date,
  }) async {
    final entry = FinancialEntry(
      id: const Uuid().v4(),
      title: title.trim(),
      category: category.trim(),
      amount: amount,
      date: date ?? DateTime.now(),
      type: type,
    );

    await _repository.create(entry);
    await load();
  }
}
