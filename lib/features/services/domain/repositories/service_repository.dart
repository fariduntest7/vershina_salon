import 'package:vershina_salon/features/services/domain/entities/service_item.dart';

/// Репозиторий услуг.
abstract interface class ServiceRepository {
  Future<List<ServiceItem>> getAll();
  Future<String> create(ServiceItem service);
  Future<void> update(ServiceItem service);
  Future<void> delete(String id);
}
