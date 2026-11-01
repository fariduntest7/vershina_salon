import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

import 'package:vershina_salon/app/theme/design_tokens.dart';
import 'package:vershina_salon/features/masters/data/datasources/master_local_data_source.dart';
import 'package:vershina_salon/features/masters/domain/entities/master.dart';
import 'package:vershina_salon/features/masters/domain/repositories/master_repository.dart';

/// Реализация репозитория мастеров.
class MasterRepositoryImpl implements MasterRepository {
  MasterRepositoryImpl(this._dataSource);

  final MasterLocalDataSource _dataSource;

  @override
  Future<List<Master>> getAll() async => _dataSource.getAll();

  @override
  Future<String> create(Master master) async => _dataSource.create(master);

  @override
  Future<void> update(Master master) async => _dataSource.update(master);

  @override
  Future<void> delete(String id) async => _dataSource.delete(id);
}
