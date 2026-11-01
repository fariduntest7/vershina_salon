import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:vershina_salon/features/finance/data/datasources/financial_local_data_source.dart';
import 'package:vershina_salon/features/finance/domain/entities/financial_entry.dart';
import 'package:vershina_salon/features/finance/domain/repositories/financial_repository.dart';

/// Реализация репозитория финансов.
class FinancialRepositoryImpl implements FinancialRepository {
  FinancialRepositoryImpl(this._dataSource);

  final FinancialLocalDataSource _dataSource;

  @override
  Future<List<FinancialEntry>> getAll() async => _dataSource.getAll();

  @override
  Future<String> create(FinancialEntry entry) async => _dataSource.create(entry);

  @override
  Future<void> update(FinancialEntry entry) async => _dataSource.update(entry);

  @override
  Future<void> delete(String id) async => _dataSource.delete(id);
}
