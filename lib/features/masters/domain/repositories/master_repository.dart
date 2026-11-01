import 'package:vershina_salon/features/masters/domain/entities/master.dart';

/// Репозиторий мастеров.
abstract interface class MasterRepository {
  Future<List<Master>> getAll();
  Future<String> create(Master master);
  Future<void> update(Master master);
  Future<void> delete(String id);
}
