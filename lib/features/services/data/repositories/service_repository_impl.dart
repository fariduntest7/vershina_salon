import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:vershina_salon/features/services/data/datasources/service_local_data_source.dart';
import 'package:vershina_salon/features/services/domain/entities/service_item.dart';
import 'package:vershina_salon/features/services/domain/repositories/service_repository.dart';

/// Реализация репозитория услуг.
class ServiceRepositoryImpl implements ServiceRepository {
  ServiceRepositoryImpl(this._dataSource);

  final ServiceLocalDataSource _dataSource;

  @override
  Future<List<ServiceItem>> getAll() async => _dataSource.getAll();

  @override
  Future<String> create(ServiceItem service) async => _dataSource.create(service);

  @override
  Future<void> update(ServiceItem service) async => _dataSource.update(service);

  @override
  Future<void> delete(String id) async => _dataSource.delete(id);
}
